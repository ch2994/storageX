// Reference: Microsoft Azure Fuzzy Search Sample

var map;

var geocodeServiceUrlTemplate = 'https://atlas.microsoft.com/search/{searchType}/json?typeahead=true&subscription-key={subscription-key}&api-version=1&query={query}&language={language}&lon={lon}&lat={lat}&countrySet={countrySet}&view=Auto';

function GetMap() {
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

    //Wait until the map resources are ready.
    map.events.add('ready', function () {
        //Create a data source to store the data in.
        datasource = new atlas.source.DataSource();

        map.sources.add(datasource);

        //Add a layer for rendering point data.
        map.layers.add(new atlas.layer.SymbolLayer(datasource));

        //Create a jQuery autocomplete UI widget.
        $("#queryTbx").autocomplete({
            minLength: 3,   //Don't ask for suggestions until atleast 3 characters have been typed. This will reduce costs by not making requests that will likely not have much relevance.
            source: function (request, response) {

                var countryIso = 'US';

                var center = map.getCamera().center;

                //Create a URL to the Azure Maps search service to perform the search.
                var requestUrl = geocodeServiceUrlTemplate.replace('{query}', encodeURIComponent(request.term))
                    .replace('{searchType}', 'fuzzy')
                    .replace('{subscription-key}', atlas.getSubscriptionKey())
                    .replace('{language}', 'en-US')
                    .replace('{lon}', center[0])    //Use a lat and lon value of the center the map to bais the results to the current map view.
                    .replace('{lat}', center[1])
                    .replace('{countrySet}', countryIso); //A comma seperated string of country codes to limit the suggestions to.

                $.ajax({
                    url: requestUrl,
                    success: function (data) {
                        response(data.results);
                    }
                });
            },
            select: function (event, ui) {
                //Remove any previous added data from the map.
                datasource.clear();

                //Create a point feature to mark the selected location.
                // datasource.add(new atlas.data.Feature(ui.item));

                //Run the preventDefault first, and then we could modify the input field value.
                event.preventDefault();

                // debugger;

                document.getElementById("queryTbx").value = ui.item.address.freeformAddress
                // $("queryTbx").val = ui.item.address.freeformAddress

                //Zoom the map into the selected location.
                // map.setCamera({
                //     bounds: [
                //         ui.item.viewport.topLeftPoint.lon, ui.item.viewport.btmRightPoint.lat,
                //         ui.item.viewport.btmRightPoint.lon, ui.item.viewport.topLeftPoint.lat
                //     ],
                //     padding: 30
                // });
            }
        }).autocomplete("instance")._renderItem = function (ul, item) {
            //Format the displayed suggestion to show the formatted suggestion string.
            var suggestionLabel = item.address.freeformAddress;

            if (item.poi && item.poi.name) {
                suggestionLabel = item.poi.name + ' (' + suggestionLabel + ')';
            }

            return $("<li>")
                .append("<a>" + suggestionLabel + "</a>")
                .appendTo(ul);
        };
    });
}