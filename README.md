# Swift-Weather-App

A basic weather app is implemented using Swift5 and Xcode.
The app displays following information to the user:
1. Location
2. Day of the week
3. Temperature in degree celsius
4. Weather condition
5. An image based on the weather condition
6. A button to select any other location
When the app is loaded for the first time, a dialog box appears which asks the user to grant location access.
On click of the ‘Select Location’ button, a list of cities is shown to the user and the user can select any city by scrolling or can Search the city using a search bar.
The app uses open weather api to get the weather data. https://home.openweathermap.org/ List of cities is fetched from a json file which is downloaded from the same site.
Following libraries are installed and imported using pod:
1. Alamofire: To make request to web api
2. SwiftyJSON: To read api json response
3. NVActivityIndicatorView: To display location dialog box
** The app is a bit slow when ‘Select Location’ button is clicked as the cities json file is big and it takes time to load the data
- Roshni Soni
 
 Screens:
 1. Home Screen (User’s location Data)
 
 2. On click of ‘Select Location’ Button
 
 3. On Search
 
 4. On Click of any city from the list
 
