import 'package:braintumourdetect/auth/auth_service.dart';
import 'package:braintumourdetect/pages/chatbot.dart';
import 'package:braintumourdetect/pages/profile_page.dart';
import 'package:braintumourdetect/pages/scanner_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  int _navIndex = 0;
  late PageController _pageController;
  final authService = AuthService();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tumour Detector'),
        actions: [
          IconButton(
            onPressed: () {
              authService.signOut();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 55, 74, 90), // Set background color here
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Image Carousel
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: buildImageCarousel(),
          ),
          // Indicator Dots
          buildIndicatorDots(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            tabs: [
              const GButton(
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

  Widget buildImageCarousel() {
    return SizedBox(
      height: 400,
      width: 20,
      child: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          buildBox('lib/images/signs.jpg', 'Signs & Symptoms', context,'https://my.clevelandclinic.org/health/diseases/6149-brain-cancer-brain-tumor'),
          buildBox('lib/images/precaution.png', 'Precautions', context,'https://sahyadrihospital.com/blog/brain-tumor-prevention-risk-reduction/'),
          buildBox('lib/images/treatment.png', 'Treatment', context,'https://www.hopkinsmedicine.org/health/conditions-and-diseases/brain-tumor/brain-tumor-treatment'),
        ],
      ),
    );
  }

  Widget buildIndicatorDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < 3; i++)
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = i;
              });
              _pageController.jumpToPage(i);
            },
            child: Container(
              width: 10,
              height: 10,
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _selectedIndex == i ? Colors.blue : Colors.grey,
              ),
            ),
          ),
      ],
    );
  }

  Widget buildBox(String imagePath, String title, BuildContext context, String url) {
    return GestureDetector(
      onTap: () async{
        final Uri url0 =Uri.parse(url);
        // Add navigation logic here
        // if(await canLaunchUrl(_url)){
        await launchUrl(url0);
        // }else{
        // throw 'Could not launch';
        // }
      },
      child: Container(
        width: 100,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(15, 13, 93, 20),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: const Color.fromRGBO(15, 13, 93, 50),
              child: Image.asset(
                imagePath,
                width: 200,
                height: 300,
              ),
            ),
            // const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(width: 10,),
                const Icon(Icons.arrow_forward,size: 30,color: Colors.white,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}