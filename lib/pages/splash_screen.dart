import 'package:braintumourdetect/auth/auth_gate.dart';
import 'package:flutter/material.dart';
// Import the home page

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add a delay to navigate to the next page after 10 seconds
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const AuthGate()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 28, 36), // Blue background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 75, // Adjust the size of the image
              backgroundColor: const Color.fromARGB(86, 221, 213, 213),
              child: ClipOval(
                child: Image.asset(
                  'lib/images/logo.jpg', // Your logo image
                  width: 80, // Adjust the size of the image
                  height: 80, // Adjust the size of the image
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'BRAIN CARE',
              style: TextStyle(
                color: Color.fromARGB(255, 248, 248, 249),
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
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
