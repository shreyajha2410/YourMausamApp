# YourMausumApp
API based projet: No dataset needed

Your Mausum Application is an application to view the weather information in Hindi. It shows the temperature, weather condition, humidity and wind speed in a list format. It is escpecially made for people who are not well versed in English and cannot understand tough English words like temperature, weather etc. It also has a easy to use front end so that it can be used by the masses for daily use.

# Methodology
The technology stack which is used is Flutter which is a powerful front end mobile framework which is used for cross platform i.e. both IOS and Android. 
The project was started by doing research as to the number of people who will be benefited by the website, the hindi words that will be used in the website to represent words like humididty temeperature etc. 
Then the front end of the project was started in which the background image was set, the container widget is used, which has a column widget to store the City name at the top then the list widget is used to store the temperature, humditiy, wind speed and weather conditions in a list format. 

# Description
The weather information is fetched from OpenWeatherMap API which is a REST API. The weather information is fetched from the API using HTTP.get request. 
The API key and city name is added into the URL of the API. HTTP.get request is made to the server. The API server sends the information in JSON format. HTTP.response function is used to store this JSON data and the json.decode function is used to convert the JSON data to DART objects which is thh language of Flutter.
We also check that the HTTP repsonse is OK that is 200 and the data sent from the API server is not NULL. If the value is NULL, loading message appears on the screen.

# Input / Output
![input1](https://user-images.githubusercontent.com/90370611/208239859-ed317736-036b-4559-8ca3-5df49731b73c.jpg)
<img width="960" alt="image" src="https://user-images.githubusercontent.com/90370611/208239925-ff6471e1-d076-44a8-9927-50f2738a097b.png">

# Live Link
https://weather-44ced.web.app/#/

# Screenshot of Interface
<img width="960" alt="image" src="https://user-images.githubusercontent.com/90370611/208239965-926aecaa-00a1-4b69-b4e4-be424c885343.png">


