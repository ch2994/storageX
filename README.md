# storageX
## Demo Link
https://safe-headland-54193.herokuapp.com (Supported by Heroku)
## Team
1.  Cheng Huang (ch2994)
2.  Niuyin Mei (nm3150)
3.  Zhihao Zhang (zz2692)

## Iteration Two Deliberable:
1.  User stories for the basic features of your product
2.  Working prototype that passes the user stories when running cucumber
3.  Heroku deployment link
4.  Code (github URI) for public
5.  Any additional materials you would like to submit

## Features:
### 1. Sign up/Log in
Customers are allowed to search for listings without log in. To create a listing or make a resevation, however, customers will be asked to log in or create an account. Sign up and log in buttons are located on the top right side of the main page. 

### 2. Create a listing
This is one of main features for listing owners. Customers could use the feature to upload their spare storage with all necessary information. Moreover, for the sake of attracting storage-seekers, fancy images could be uploaded and managed whenever you like. 

When you are in log-in state, you will be allowed to post your own listing. The post steps are as follows:

1. Click the "Post my storage" in the Homepage or your own listing page.
2. Fill up all required information including name, zip code, price, size, address, city, state.
3. Images upload is optional, but recommended. 
4. Please click on the button - "Location Check" to make sure your address is valid and what you want in a geographic map.
5. Finally press the "Save" button and finish your posting.
### 3. Make a booking
This is a main feature for customers. Before customer login into their StorageX account, they can only view the pictures, locations and review for a certain listing, but they cannot make a booking until they are logged in. 

The booking steps are as follows:
1. Click the "More Details" button for the listing you would prefer.
2. View the price/size/location/review for the exact listing.
3. Click "Book" if you want to move on.
4. Choose a date which is suitable for you. If the date is not available, you will be noticed.
5. The booking is complete. You could edit/write a review if you like.

### 4. Edit listing/booking
For listing editing:
1. Go to "My Listings" tab.
2. Pick the listing you want to edit and click "edit".
3. Edit your information, e.g. basic information/upload pictures.
4. Click "Save".

For booking editing:
1. Go to "My Bookings" tab.
2. Pick the booking you want to edit and click "edit".
3. Edit your booking information(booking date/time).
4. Click "Save".

### 5. Search listing & Map mode
This is an advanced feature from iteration II. As a storage-seeker, you may not know where your target is or you may just know some basic information, like a very ambiguous street name. For this scenario, we developed a fuzzy search feature that support fuzzy matching between user query and listings. Besides, auto-suggestion is also supported and users could see available listing in a map mode at the same time. makes our product more user-friendly. 

\* Microsoft Azure Map supports address-matching RESTful APIs and map component.

## How to test:
1. BDD \
The project uses cucumber for BDD tests and there are 14 scenarios. To run the tests, run the following command:
```bash
bundle exec cucumber
