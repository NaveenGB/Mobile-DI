# Mobile-DI
Mobile DI iOS app

Screenshots 

<img src="screenshots/login.PNG" width="200"></br>
<img src="screenshots/tableview.PNG" width="200"></br>
<img src="screenshots/nav.PNG" width="200"></br>
<img src="screenshots/detailpage.PNG" width="200"></br>

Functionalities

    -> Login Page:
    Accepts username and password aunthenticated from preloaded list of user credentials 

    username: naveen
    password: naveen@123
    
    username: vamsi
    password: vamsi@123

    -> Web service call:
        On successfull authentication URL - "https://jsonplaceholder.typicode.com/photos" is requested

    -> Web service list page
        The JSON formatted data from web service with 5000 records is parsed and the data is loaded on to a TableView 
        Sample data:
        {
            "albumId": 1,
            "id": 1,
            "title": "accusamus beatae ad facilis cum similique qui sunt",
            "url": "http://placehold.it/600/92c952",
            "thumbnailUrl": "http://placehold.it/150/92c952"
        }

        List item selection from TableView takes lands to a detail page

    -> Detail Page
        Contains description of the particular record
    



