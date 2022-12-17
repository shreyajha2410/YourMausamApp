import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
void main() => runApp(
  MaterialApp(
    title:"Weather App",
    debugShowCheckedModeBanner: false,
    home: Home(),
  )
);

class Home extends StatefulWidget {

  @override
  State<StatefulWidget> createState(){
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  var temp;
  var description;
  var currently;
  var humidity;
  var windspeed;

  Future getweather () async{
    http.Response response= await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=Lucknow&units=metric&appid=e0ca52163bfca0334f5cbf84c82b230b"));
    var results= jsonDecode(response.body);
    setState(() {
      this.temp=results['main']['temp'];
      this.description=results['weather'][0]['description'];
      this.currently=results['weather'][0]['main'];
      this.humidity=results['main']['humidity'];
      this.windspeed=results['wind']['speed'];
    });
  }
  @override
  void initState(){
    super.initState();
    this.getweather();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        decoration: BoxDecoration(
          image:DecorationImage(
          image: AssetImage('assets/app.jpg'),
          fit:BoxFit.cover,
        ),
        ),
      child:Column(
        children: <Widget>[

          Container(
            height: MediaQuery.of(context).size.height/3,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom:10.0 ),
                  child: Text(
                    "Lucknow",
                   style: TextStyle(
                     color:Colors.lightBlue[100],
                     fontSize: 40.0,
                     fontWeight: FontWeight.w600
                   ),
                  ),
                ),
                Text(
                  temp!= null? temp.toString()+"\u00B0"+"C":"Loading",
                  style:TextStyle(
                    color: Colors.lightBlue[100],
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:10.0 ),
                  child: Text(
                    currently !=null ? currently.toString() : "Loading",
                    style: TextStyle(
                        color:Colors.lightBlue[100],
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: ListView(
                  children:<Widget> [
                    ListTile(
                      leading:FaIcon(FontAwesomeIcons.thermometerHalf),
                      title:Text("Temperature"),
                      trailing: Text(temp!=null ? temp.toString()+'\u00B0'+"C":"loading"),
                    ),
                    SizedBox(height: 10.0),
                    ListTile(
                      leading:FaIcon(FontAwesomeIcons.cloud),
                      title:Text("Weather"),
                      trailing: Text(description !=null ? description.toString() :"loading"),
                    ),
                    SizedBox(height: 10.0),
                    ListTile(
                      leading:FaIcon(FontAwesomeIcons.sun),
                      title:Text("Humidity"),
                      trailing: Text(humidity !=null ? humidity.toString()+"%" :"loading"),
                    ),
                    SizedBox(height: 10.0),
                    ListTile(
                      leading:FaIcon(FontAwesomeIcons.wind),
                      title:Text("Wind Speed"),
                      trailing: Text(windspeed !=null ? windspeed.toString()+"m/s" :"loading"),
                    )
                  ],
                ),
              )
          )
        ],
      ),
      )
    );
  }
}
