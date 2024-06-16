import 'package:braintumourdetect/pages/home.dart';
import 'package:braintumourdetect/pages/scanner_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:braintumourdetect/Pages/edit_account.dart';
import 'package:braintumourdetect/auth/auth_service.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'chatbot.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  final AuthService _authService = AuthService();
  Map<String, dynamic>? userData;
  String? currentUserEmail;
  int _navIndex = 3;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    try {
      currentUserEmail = await _authService.getCurrentUserEmail();
      Map<String, dynamic> data = await _authService.getUserData(currentUserEmail!);

      setState(() {
        userData = data;
      });
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My Account'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(120, 146, 187, 227),
                Color.fromARGB(255, 28, 115, 142),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blueGrey[50],
              ),
              width: 500,
              height: 500,
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 100,
                    ),
                  ),

                  const SizedBox(height: 10,),

                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Name",
                          style: GoogleFonts.lato(
                              fontSize: 25,
                              color: Colors.grey
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          userData?['name'] ?? "Loading...",
                          style: GoogleFonts.lato(
                            fontSize: 25,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10,),

                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Phone Number",
                          style: GoogleFonts.lato(
                              fontSize: 25,
                              color: Colors.grey
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          userData?['phone'] ?? "Loading...",
                          style: GoogleFonts.lato(
                            fontSize: 25,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10,),

                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Email ID",
                          style: GoogleFonts.lato(
                              fontSize: 25,
                              color: Colors.grey
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          userData?['email'] ?? "Loading...",
                          style: GoogleFonts.lato(
                            fontSize: 28,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10,),

                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Location",
                          style: GoogleFonts.lato(
                              fontSize: 25,
                              color: Colors.grey
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          userData?['location'] ?? "Loading...",
                          style: GoogleFonts.lato(
                            decoration: TextDecoration.underline,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      _authService.signOut();
                    }, icon: Icon(Icons.logout),

                  ),
                ],
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
                  Navigator.push(context, MaterialPageRoute(builder:
                      (context) => const BrainTumourDetection())
                  );
                },
                icon: Icons.upload,
                text: 'Upload',
              ),
              GButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:
                      (context) =>  ChatBot())
                  );
                },
                icon: Icons.chat_bubble,
                text: 'Chat',
              ),
              GButton(
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder:
                  //     (context) => const MyAccount())
                  // );
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
}
