# Mobile-DI
Mobile DI iOS app

Screenshots 
    ![Login page](screenshots/login.PNG?=250x "Login page")
    ![Web Service list page](screenshots/tableview.PNG?raw=true "TableView page")
    ![Navigation bar](screenshots/nav.PNG?raw=true "Navigation bar")
    ![Details page](screenshots/detailpage.PNG?raw=true "Details page")

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
    



