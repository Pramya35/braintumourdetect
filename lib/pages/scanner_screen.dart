import 'dart:io';
import 'package:braintumourdetect/pages/home.dart';
import 'package:braintumourdetect/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:image_picker/image_picker.dart';

import 'chatbot.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brain Tumour Detection',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BrainTumourDetection(),
    );
  }
}

class BrainTumourDetection extends StatefulWidget {
  const BrainTumourDetection({super.key});

  @override
  _BrainTumourDetectionState createState() => _BrainTumourDetectionState();
}

class _BrainTumourDetectionState extends State<BrainTumourDetection> {
  File? _imageFile;
  int _navIndex = 1;
  final int _selectedIndex = 1;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Brain Tumour Detection'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Upload the MRI image',
              style: TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 20.0),
            GestureDetector(
              onTap: getImage,
              child: Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Icon(
                  Icons.upload,
                  size: 50.0,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            _imageFile != null
                ? Column(
              children: [
                Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Image.file(
                    _imageFile!,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: clearSelection,
                        child: Container(
                            padding: const EdgeInsets.all(5),
                            width: 60,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text("Clear",
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                        )
                    ),
                    TextButton(
                        onPressed: () => {},
                        child: Container(
                            padding: const EdgeInsets.all(5),
                            width: 60,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text("TEST",
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                        )
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                Container(
                  padding: const EdgeInsets.only(left: 15,right: 10,top: 5,bottom: 5),
                  width: 100,
                  decoration: const BoxDecoration(
                    color: Colors.greenAccent,

                  ),
                  child: const Text("Prediction-"),
                ),
              ],
            )
                : Container(),
            Container(
              child: const TextField(
                decoration: InputDecoration(
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            tabs: [
              GButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:
                      (context) => const Home())
                  );
                },
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder:
                  //     (context) => const BrainTumourDetection())
                  // );
                },
                icon: Icons.upload,
                text: 'Upload',
              ),
              GButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:
                      (context) =>  const ChatBot())
                  );
                },
                icon: Icons.chat_bubble,
                text: 'Chat',
              ),
              GButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:
                      (context) => const MyAccount())
                  );
                },
                icon: Icons.person,
                text: 'Profile',
              ),

            ],
            selectedIndex: _navIndex,
            onTabChange: (index) {
              setState(() {
                _navIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }


  void clearSelection() {
    setState(() {
      _imageFile = null;
    });
  }
}