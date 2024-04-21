import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:braintumourdetect/pages/home.dart';
import 'package:braintumourdetect/pages/profile_page.dart';
import 'package:braintumourdetect/pages/scanner_screen.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({Key? key}) : super(key: key);

  @override
  _ChatBotState createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  final TextEditingController _controller = TextEditingController();
  int _navIndex = 2; // Add this line to track the selected tab index
  List<String> _messages = []; // List to store messages

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Mind Mentor'),
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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/images/bg.png'),
            fit: BoxFit.fitWidth,
            opacity: 0.8,
          ),
        ),
        child: Column(
          children: [
            // Display messages
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_messages[index]),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color.fromARGB(90, 120, 157, 195).withOpacity(0.8),
                    const Color.fromARGB(255, 21, 73, 90).withOpacity(0.8),
                  ],
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Type a message...',
                        hintStyle: TextStyle(
                          color: Colors.white54,
                          fontFamily: 'Cera Pro',
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _sendMessage(_controller.text);
                    },
                    icon: const Icon(Icons.send_rounded),
                    color: Colors.white,
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
                },
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const BrainTumourDetection()));
                },
                icon: Icons.upload,
                text: 'Upload',
              ),
              GButton(
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder:
                  //     (context) =>  ChatBot())
                  // );
                },
                icon: Icons.chat_bubble,
                text: 'Chat',
              ),
              GButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const MyAccount()));
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

  // Function to send a message
  void _sendMessage(String message) {
    setState(() {
      _messages.add(message); // Add the message to the list
    });
    _controller.clear(); // Clear the text field after sending the message
  }
}
