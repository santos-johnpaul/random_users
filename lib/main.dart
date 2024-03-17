import 'package:flutter/material.dart';
import 'homepage.dart';
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
  void navigateToHomepage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Homepage()),
    );
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
            Text(
              'Random User API',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Image.network(
              'https://i.gifer.com/YCZH.gif',
              height: 200,

            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                navigateToHomepage(context);
              },
              child: Text('Go to Homepage'),
            ),
          ],
        ),
      ),
    );
  }
}