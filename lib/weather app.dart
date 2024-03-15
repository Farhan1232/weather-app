import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/repository/repository.dart';
import 'package:weather_app/weather_Model.dart';
import 'package:weather_icons/weather_icons.dart';

class weatherapp extends StatefulWidget {
  const weatherapp({super.key});

  @override
  State<weatherapp> createState() => _weatherappState();
}

class _weatherappState extends State<weatherapp> {
  final TextEditingController _controller = TextEditingController();
  weatherModel? weathermodel;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Weather App'),
        ),backgroundColor: Color.fromARGB(255, 199, 158, 124),
      elevation: 0,),
      backgroundColor: Color.fromARGB(255, 199, 158, 124),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(hintText: 'Search.....Weather',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                weathermodel = await repo().getweatherApp(_controller.text);
                setState(() {});
              },
              child: Text('Search'),
            ),
            // Image.network(
            //   'https://i.pinimg.com/originals/77/0b/80/770b805d5c99c7931366c2e84e88f251.png',
            // ),
            SizedBox(height: 30,),
            Icon(Icons.sunny_snowing,size: 150,color: Colors.blue,),
            SizedBox(
              height: 10,
            ),Text('${weathermodel?.main?.temp}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70,vertical: 20),
                child: Row(children: [
                  Column(children: [SizedBox(height: 8,),
                    Icon(Icons.thermostat,size: 50,color: Colors.white,),
                    SizedBox(height: 5,),
                    Text(' ${weathermodel?.main?.tempMax}')
                  ],),SizedBox(width: 130,),
                  Column(children: [SizedBox(height: 8,),
                    Icon(Icons.thermostat_auto_outlined,size: 50,color: Colors.white,),
                    SizedBox(height: 5,),
                    Text('  ${weathermodel?.main?.tempMin}'),
                  ],),
                ],),
              ),
            ),SizedBox(height: 5,),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70,vertical: 20),
            child: Row(children: [
                  Column(children: [SizedBox(height: 8,),
                  Icon(Icons.wind_power_outlined,size: 50,color: Colors.white,),
                    SizedBox(height: 5,),
                    Text(' ${weathermodel?.main?.pressure}')
                  ],),SizedBox(width: 130,),
                  Column(children: [
                    SizedBox(height: 8,),
                    IconButton(onPressed: (){}, icon: Icon(WeatherIcons.humidity,size: 50,color: Colors.white,)),
                    SizedBox(height: 5,),
                    Text(' ${weathermodel?.main?.humidity}'),
                  ],),
                ],),
          ),
        ),SizedBox(height: 10,),
        
        
        
        
        
        
            
                          ],
                        ),
                 
           ) );
  }
}
