import 'package:flutter/material.dart';
import 'home.dart'; // Import the home page

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add a delay to navigate to the next page after 3 seconds
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const Home()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 18, 28, 36), // Blue background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 75, // Adjust the size of the image
              backgroundColor: Color.fromARGB(86, 221, 213, 213),
              child: ClipOval(
                child: Image.asset(
                  'lib/images/logo.jpg', // Your logo image
                  width: 80, // Adjust the size of the image
                  height: 80, // Adjust the size of the image
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'BRAIN CARE',
              style: TextStyle(
                color: Color.fromARGB(255, 248, 248, 249),
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Tumour Detection App',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
