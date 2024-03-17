import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'var.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String? name;
  String? gender;
  String? country;
  String? email;
  String? age;
  String? phoneNumber;
  String? username;
  String? status;
  String? photo;

  Future<void> getData() async {
    final response = await http.get(Uri.parse(url));
    setState(() {
      user = [jsonDecode(response.body)];
    });

    name = user[0]['results'][0]['name']['title'] +
        '. ' +
        user[0]['results'][0]['name']['first'] +
        ' ' +
        user[0]['results'][0]['name']['last'];
    gender = user[0]['results'][0]['gender'];
    country = user[0]['results'][0]['location']['country'];
    email = user[0]['results'][0]['email'];
    username = user[0]['results'][0]['login']['username'];
    age = user[0]['results'][0]['dob']['age'].toString();
    phoneNumber = user[0]['results'][0]['phone'];
    photo = user[0]['results'][0]['picture']['large'];
    print(photo);

    await Future.delayed(Duration(seconds: 2));
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Text('Home'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(photo ?? ''),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name ?? '',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          age ?? '',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          gender ?? '',
                          style: TextStyle(
                            color: gender == 'male' ? Colors.blue : Colors.pink,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            // User Data Section
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDataRow (Icons.location_city, country ?? ''),
                    _buildDataRow(Icons.email, email ?? ''),
                    _buildDataRow(Icons.person_2_outlined, username ?? ''),
                    _buildDataRow(Icons.phone_android_outlined, phoneNumber ?? ''),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}