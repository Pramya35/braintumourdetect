import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  late PageController _pageController;

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
      ),
      backgroundColor: Color.fromARGB(255, 55, 74, 90), // Set background color here
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Image Carousel
          buildImageCarousel(),
          // Indicator Dots
          buildIndicatorDots(),
        ],
      ),
      // bottomNavigationBar: ,
    );
  }

  Widget buildImageCarousel() {
    return SizedBox(
      height: 120,
      child: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          buildBox('lib/images/logo.jpg', 'Signs & Symptoms', context),
          buildBox('lib/images/logo.jpg', 'Precautions', context),
          buildBox('lib/images/logo.jpg', 'Treatment', context),
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

  Widget buildBox(String imagePath, String title, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Add navigation logic here
      },
      child: Container(
        width: 100,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 60,
              height: 60,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}
