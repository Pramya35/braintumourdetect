import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:braintumourdetect/pages/home.dart';
import 'package:braintumourdetect/pages/profile_page.dart';
import 'package:braintumourdetect/pages/scanner_screen.dart';
import 'package:intl/intl.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({Key? key}) : super(key: key);

  @override
  _ChatBotState createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  final TextEditingController _userInput = TextEditingController();
  static const apiKey = "AIzaSyD28WUHrOBFqBhJ0CYd5hxDUTHo6RBfEaI";
  final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
  final List<Message> _messages = [];
  int _navIndex = 0;

  Future<void> sendMessage() async {
    final message = _userInput.text;
    setState(() {
      _messages.add(Message(isUser: true, message: message, date: DateTime.now()));
    });
    final content = [Content.text(message)];
    final response = await model.generateContent(content);
    setState(() {
      _messages.add(Message(isUser: false, message: response.text ?? "", date: DateTime.now()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop),
            image: AssetImage('lib/images/bg.png'),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return Messages(
                    isUser: message.isUser,
                    message: message.message,
                    date: DateFormat('HH:mm').format(message.date),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 15,
                    child: TextFormField(
                      style: TextStyle(color: Colors.black),
                      controller: _userInput,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        label: Text('Enter Your Message'),
                      ),
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    padding: EdgeInsets.all(12),
                    iconSize: 30,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(CircleBorder()),
                    ),
                    onPressed: () {
                      sendMessage();
                    },
                    icon: Icon(Icons.send),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
          ],
        ),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ChatBot()));
                },
                icon: Icons.chat_bubble,
                text: 'Chat',
              ),
              GButton(
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => const MyAccount()));
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

class Message {
  final bool isUser;
  final String message;
  final DateTime date;
  Message({required this.isUser, required this.message, required this.date});
}

class Messages extends StatelessWidget {
  final bool isUser;
  final String message;
  final String date;
  const Messages({
    super.key,
    required this.isUser,
    required this.message,
    required this.date,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(vertical: 15).copyWith(
        left: isUser ? 100 : 10,
        right: isUser ? 10 : 100,
      ),
      decoration: BoxDecoration(
        color: isUser ? Colors.blueAccent : Colors.grey.shade400,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: isUser ? Radius.circular(10) : Radius.zero,
          topRight: Radius.circular(10),
          bottomRight: isUser ? Radius.zero : Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message,
            style: TextStyle(fontSize: 16, color: isUser ? Colors.white : Colors.black),
          ),
          Text(
            date,
            style: TextStyle(fontSize: 10, color: isUser ? Colors.white : Colors.black),
          ),
        ],
      ),
    );
  }
}
