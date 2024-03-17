import 'package:flutter/material.dart';
import 'main.dart';
class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Text('Home'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              // image and name
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    ClipOval(
                      child: Image.network(
                        'https://tse1.explicit.bing.net/th?id=OIP.Ybso1cBFcCQ3OxH8HlSDvgHaHa&pid=Api&P=0&h=180',
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Lorem Ipsum',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),

              // data of the user
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.male_outlined, color: Colors.blue),
                        Text('Male'),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.location_city, color: Colors.red[800]),
                        Text('Country Placeholder'),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.email, color: Colors.yellow[800]),
                        Text('EmailPlaceholder@example.com'),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.person_2_outlined, color: Colors.green[800]),
                        Text('UsernamePlaceholder'),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.calendar_today, color: Colors.blue[800]),
                        Text('42 years old'),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.phone_android_outlined, color: Colors.purple[800]),
                        Text('+1234567890'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
