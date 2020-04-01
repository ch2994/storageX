var map;

var geocodeServiceUrlTemplate = 'https://atlas.microsoft.com/search/{searchType}/json?typeahead=true&subscription-key={subscription-key}&api-version=1&query={query}&language={language}&lon={lon}&lat={lat}&countrySet={countrySet}&limit={numResult}&view=Auto';

function check_for_listing_address(){
    initial_map();
    check_for_new_point();
}

function extrac_address_from_form() {
    address_elements = [$('#listing_address').val(), $('#listing_city').val(), $('#listing_state').val(), $('#listing_zipcode').val()]
    return address_elements.join(', ')
}

function initial_map() {
    //Initialize a map instance.
    map = new atlas.Map('MapDisplay', {
        view: 'Auto',
        center: [-74.00723, 40.71305],
        zoom: 12,
        authOptions: {
            authType: 'subscriptionKey',
            subscriptionKey: gon.azure_map_key
        }
    });
}

function check_for_new_point() {

    var specific_address = extrac_address_from_form();
    var center = map.getCamera().center;

    var countryIso = 'US';

    //Create a URL to the Azure Maps search service to perform the search.
    var requestUrl = geocodeServiceUrlTemplate.replace('{query}', encodeURIComponent(specific_address))
        .replace('{searchType}', 'address')
        .replace('{subscription-key}', atlas.getSubscriptionKey())
        .replace('{language}', 'en-US')
        .replace('{lon}', center[0])    //Use a lat and lon value of the center the map to bais the results to the current map view.
        .replace('{lat}', center[1])
        .replace('{countrySet}', countryIso) //A comma seperated string of country codes to limit the suggestions to.
        .replace('{numResult}', 1)

    $.ajax({
        url: requestUrl,
        success: function (data) {

            if (data.results.length == 0){
                alert("Please input a valid address.")
                return
            }

            datasource = new atlas.source.DataSource();

            map.sources.add(datasource);

            //Add a layer for rendering point data.
            map.layers.add(new atlas.layer.SymbolLayer(datasource));

            point_loc = data.results[0]

            //Create a point feature to mark the selected location.
            datasource.add(new atlas.data.Feature(new atlas.data.Point([point_loc.position.lon, point_loc.position.lat])));

            //Zoom the map into the selected location.
            map.setCamera({
                bounds: [
                    point_loc.viewport.topLeftPoint.lon, point_loc.viewport.btmRightPoint.lat,
                    point_loc.viewport.btmRightPoint.lon, point_loc.viewport.topLeftPoint.lat
                ],
                padding: 30,
                zoom: 12
            });

        }
    });
}