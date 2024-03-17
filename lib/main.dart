import 'dart:convert';
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'package:http/http.dart' as http;
import 'var.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Loading(),
));

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}


class _LoadingState extends State<Loading> {

  Future<void> getData() async {
    try {
      final response = await http.get(Uri.parse(url)).timeout(Duration(seconds: 60));
      user = [jsonDecode(response.body)];
      print(user[0]['info']['version']);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=> Homepage()));
    } catch(e) {
      // Handle error here
      showNoInternetDialog();
      print('No Internet Connection');
    }
  }

  void showNoInternetDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('No Internet Connection'),
          content: Text('Please check your internet connection and try again.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Future.delayed(Duration(seconds: 4), () {
                  getData();
                });
              },
              child: Text('Retry'),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://i.gifer.com/XOsX.gif',
              height: 200,
            ),
            SizedBox(height: 10),
            Text(
              'Random User API',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Image.network(
              'https://i.gifer.com/YCZH.gif',
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
