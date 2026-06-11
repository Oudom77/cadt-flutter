import 'package:flutter/material.dart';

enum Location {

  phnompenh(
    label: "PhnomPenh", 
    temperatureRange: "Min 10.0°C\nMax 30.0°",
    temperature: "16.7°C",
    image: "assets/ex4/cloudy.png",
    background: [Color.fromARGB(255, 227, 115, 255), Color.fromARGB(255, 167, 100, 255)],
  ),
  paris(
    label: "Paris",
    temperatureRange: "Min 10.0°C\nMax 40.0°",
    temperature: "26.7°C",
    image: "assets/ex4/sunnyCloudy.png",
    background: [Color.fromARGB(255, 180, 255, 110), Color.fromARGB(255, 85, 255, 62)],
  ),
  rome(
    label: "Rome",
    temperatureRange: "Min 10.0°C\nMax 40.0°",
    temperature: "67.2°C",
    image: "assets/ex4/sunny.png",
    background: [Color.fromARGB(255, 255, 60, 60), Color.fromARGB(255, 255, 34, 34)],
  ),
  toulouse(
    label: "Toulouse", 
    temperatureRange: "Min 10.0°C\nMax 40.0°",
    temperature: "45.67°C",
    image: "assets/ex4/veryCloudy.png",
    background: [Color.fromARGB(255, 255, 193, 135), Color.fromARGB(255, 255, 188, 63)],
  );

  final String label;
  final String temperatureRange;
  final String temperature;
  final String image;
  final List <Color> background;

  const Location({
    required this.label, 
    required this.temperatureRange, 
    required this.image,
    required this.temperature,
    required this.background,
  });
}

class WeatherApp extends StatelessWidget {

  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Weather App",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: Icon(Icons.cloud_circle_rounded, color: Colors.white, size: 36,),
          actions: [
            Icon(Icons.menu, color: Colors.white,),
            SizedBox(width: 10,)
          ],
          backgroundColor: Colors.blue.shade300,
        ),
        body: Container(
          padding: EdgeInsets.all(40),
          child: Center(
            child: Column(
              children: [
                WeatherCard(location: Location.phnompenh),
                SizedBox(height: 20,),
                WeatherCard(location: Location.paris),
                SizedBox(height: 20,),
                WeatherCard(location: Location.rome),
                SizedBox(height: 20,),
                WeatherCard(location: Location.toulouse),
                SizedBox(height: 20,),
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 20,
                        right: 150,
                        child: Icon(Icons.sunny)
                      ),
                      ListTile(
                        title: Text("Data", style: TextStyle(fontSize: 24, color: Colors.white)),
                        subtitle: Text("data", style: TextStyle(color: Colors.white)),
                        trailing: Text("Blueee", style: TextStyle(fontSize: 36, color: Colors.white)),
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(Location.paris.image)
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WeatherCard extends StatelessWidget {

  final Location location;

  const WeatherCard({
    super.key, 
    required this.location
  });

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(25),
      elevation: 8,
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: AlignmentGeometry.centerRight,
            colors: location.background,
          )
        ),
        child: Stack(
          children: [
            Positioned(
              top: -30,
              right: -20,
              child: ClipOval(
                child: Container(
                  height: 250,
                  width: 210,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: AlignmentGeometry.centerRight,
                      colors: location.background
                    )
                  ),
                ),
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(location.image),
              ),
              trailing: Text(
                location.temperature,
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                ),
              ),
              title: Text(
                location.label,
                style: TextStyle(
                  color: Colors.white
                ),
              ),
              subtitle: Text(
                location.temperatureRange,
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


void main(){

  runApp(
    const WeatherApp()
  );
}


