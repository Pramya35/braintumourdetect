import 'package:braintumourdetect/pages/profile_page.dart';
import '../auth/auth_service.dart';
import '/pages/chatbot.dart';
import '/pages/precautions_screen.dart';
import '/pages/scanner_screen.dart';
import '/pages/signs_and_symptoms.dart';
import '/pages/treatment_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
const Home({Key? key}) : super(key: key);

@override
_HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
int _selectedIndex = 0;
int _selectedIndex2 = 0;
int _navIndex = 0;
late PageController _pageController;
late PageController _pageController2;
final AuthService _authService = AuthService();

@override
void initState() {
super.initState();
_pageController = PageController(initialPage: _selectedIndex);
_pageController2 = PageController(initialPage: _selectedIndex2);
}

@override
Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
    centerTitle: true,
    title: const Text('Brain Care'),
    actions: <Widget>[
      IconButton(
          onPressed: () {
            _authService.signOut();
          },
          icon: Icon(Icons.logout))
    ],
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
backgroundColor: const Color.fromARGB(255, 255, 255, 255), // Set background color here
body: SingleChildScrollView(
child: Column(
crossAxisAlignment: CrossAxisAlignment.stretch,
children: [

const Padding(
padding: EdgeInsets.only(left: 10, top: 10),
child: Text("Early detection",
style: TextStyle(
fontWeight: FontWeight.bold,
fontSize: 30,
),
),
),
const Padding(
padding: EdgeInsets.only(left: 10,bottom: 10),
child: Text("makes a difference",
style: TextStyle(
fontWeight: FontWeight.bold,
fontSize: 30,
),
),
),
Container(
decoration: BoxDecoration(
color: Colors.grey.shade200,
borderRadius: BorderRadius.circular(10)
),
child: Column(
children: [
Padding(
padding: const EdgeInsets.only(left: 20.0,right: 20,top: 20),
child: Container(
decoration: BoxDecoration(
borderRadius: BorderRadius.circular(10),
color: Colors.greenAccent,
),
child: const Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Padding(
padding: EdgeInsets.all(20),
child: Text("Upload MRI image here",
style: TextStyle(
fontSize: 25
),
),
),
Icon(Icons.document_scanner_outlined,
size: 30,
),
],
),
),
),
Padding(
padding: const EdgeInsets.only(bottom: 20.0),
child: Container(
width: 200,
child: TextButton(
onPressed: () {
  Navigator.push(context,
    MaterialPageRoute(builder:(context)=> const BrainTumourDetection()));
},
child: const Text("Upload"),
style: ButtonStyle(
backgroundColor: MaterialStateProperty.all(Colors.white),
shape: MaterialStateProperty.all<RoundedRectangleBorder>(
RoundedRectangleBorder(
borderRadius: BorderRadius.circular(10),
side: const BorderSide(color: Colors.amber)
)
)
),
),
),
)
],
),
),

const SizedBox(height: 10,),
// Image Carousel
Padding(
padding: const EdgeInsets.only(left: 70, right: 70),
child: Column(
  children: [
    buildImageCarousel(),
  ],
),
),
// Indicator Dots
buildIndicatorDots(),

const SizedBox(height: 10,),

Container(
// height: 266,
color: Colors.white,
child: Column(
children: [
const Padding(
padding: EdgeInsets.only(left: 20,top: 5),
child: Row(
children: [
Text(
"Brain Tumour Types",

style: TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontSize: 26,
),
),
],
),
),
Padding(
padding: const EdgeInsets.only(left: 20, right: 20),
child: buildImageCarousel2(),
),
// Indicator Dots
buildIndicatorDots2(),
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
// width: 500,
child: PageView(
controller: _pageController,
onPageChanged: (index) {
setState(() {
_selectedIndex = index;
});
},
children: [
buildBox('lib/images/sign01.jpg', 'Signs & Symptoms', context, const SignsAndSymptoms()),
buildBox('lib/images/precaution01.jpg', 'Precautions', context, const PrecautionsScreen()),
buildBox('lib/images/treatment.jpg', 'Treatment', context, const TreatmentScreen()),
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

Widget buildImageCarousel2() {
return SizedBox(
height: 500,
child: PageView(
controller: _pageController2,
onPageChanged: (index) {
setState(() {
_selectedIndex2 = index;
});
},
children: [
buildBox2('lib/images/glioma.png',Colors.cyan, 'GLIOMA','Gliomas are primary brain tumors, which means they are derived from the brain tissue itself', context, 'https://www.ivybraintumorcenter.org/brain-tumor-care/brain-tumor-types/gliomas/'),
buildBox2('lib/images/pitutary.png',Colors.red, 'METASTATIC', 'A metastatic brain tumor, or ‘secondary’ brain tumor, originates from cancer in another part of the body.',context, 'https://www.ivybraintumorcenter.org/brain-tumor-care/brain-tumor-types/brain-metastases/'),
buildBox2('lib/images/meningioma.png',Colors.blueGrey, 'MENINGIOMA', 'Meningiomas are  ‘primary’ brain tumors. They are derived from the lining of the brain (known as the meninges).',context, 'https://www.ivybraintumorcenter.org/brain-tumor-care/brain-tumor-types/meningiomas/'),
],
),
);
}

Widget buildIndicatorDots2() {
return Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
for (int i = 0; i < 3; i++)
GestureDetector(
onTap: () {
setState(() {
_selectedIndex2 = i;
});
_pageController2.jumpToPage(i);
},
child: Container(
width: 10,
height: 10,
margin: const EdgeInsets.all(5),
decoration: BoxDecoration(
shape: BoxShape.circle,
color: _selectedIndex2 == i ? Colors.blue : Colors.grey,
),
),
),
],
);
}

Widget buildBox(String imagePath, String title, BuildContext context, Widget page) {
return GestureDetector(
onTap: () {
Navigator.push(context, MaterialPageRoute(builder: (context) => page
)
);
},
child: Container(
width: 300,
margin: const EdgeInsets.all(8),
decoration: BoxDecoration(
color: const Color.fromRGBO(15, 13, 93, 20),
borderRadius: BorderRadius.circular(20),
  image: DecorationImage(
    image: AssetImage(imagePath),
    fit: BoxFit.cover,
  )
),
child: Column(
mainAxisAlignment: MainAxisAlignment.end,
children: [
// Container(
// // color: Color.fromRGBO(15, 13, 93, 50),
// child: Image.asset(
// imagePath,
// width: 250,
// height: 300,
// ),
// ),
// const SizedBox(height: 8),
Padding(
  padding: const EdgeInsets.only(bottom: 8.0),
  child: Container(
    color: Colors.white12,
    child: Row(
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
  ),
),
],
),
),
);
}

Widget buildBox2(String imagePath,Color color, String title,String content, BuildContext context, String url) {
return GestureDetector(
onTap: () async{
final Uri _url =Uri.parse(url);
// Add navigation logic here
if(await canLaunchUrl(_url)){
await launchUrl(_url);
}else{
throw 'Could not launch';
}
},
child: Container(
// width: 100,
// height: 300,
// margin: const EdgeInsets.all(8),
decoration: BoxDecoration(
color: color,
borderRadius: BorderRadius.circular(20),
),
child: Column(
mainAxisAlignment: MainAxisAlignment.start,
children: [
// Padding(
//   padding: const EdgeInsets.only(top: 8.0),
//   child: Image.asset(
//   imagePath,
//   // width: 400,
//   // height: 100,
//   ),
// ),
Container(
  width: 420,
  height: 300,
  margin: const EdgeInsets.all(8),
  decoration: BoxDecoration(
      color: const Color.fromRGBO(15, 13, 93, 20),
      image: DecorationImage(
        image: AssetImage(imagePath),
        fit: BoxFit.cover,
      )
  ),
),
// const SizedBox(height: 8),
Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Text(
title,
textAlign: TextAlign.start,
style: const TextStyle(
color: Colors.white,
fontWeight: FontWeight.bold,
fontSize: 22,
),
),
// SizedBox(width: 10,),
// Icon(Icons.arrow_forward,size: 30,color: Colors.white,)
],
),
  Row(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SizedBox(
          width: 388,
          child: Text(content,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white
          ),
          ),
        ),
      )
    ],
  ),
  const Padding(
    padding: EdgeInsets.only(left: 10,top: 15),
    child: Row(
      children: [
        Text("Learn More",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
        Icon(Icons.arrow_forward_ios_rounded,
          color: Colors.white,
        ),
      ],
    ),
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