import 'package:flutter/material.dart';

class PrecautionsScreen extends StatelessWidget {
  const PrecautionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Precautions'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            children: [

              Image.asset(
                'lib/images/precaution.jpg',
                width: 411,
              ),
              const Text("The human brain is a complex and delicate organ that plays a crucial role daily. Unfortunately, brain tumours are a significant health concern, affecting millions worldwide. In India, the prevalence of brain tumours has increased in recent years, necessitating a deeper understanding of prevention and risk reduction strategies.",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("Preventive Measures",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text("-Diet and Nutrition",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        color: Colors.red
                      ),
                    ),
                  ),
                ],
              ),
              const Text("A healthy diet is vital in maintaining overall health, including brain health. Incorporating brain-boosting foods into your diet can provide essential nutrients and antioxidants. These include fruits, vegetables, whole grains, lean proteins, and foods rich in omega-3 fatty acids. Avoiding processed and sugary foods is also recommended.",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0,top: 10),
                    child: Text("-Lifestyle Modifications",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.red
                      ),
                    ),
                  ),
                ],
              ),
              const Text(" Regular exercise has been shown to have numerous benefits for brain health. Engaging in physical activities like walking, jogging, or cycling can improve blood flow to the brain and help reduce the risk of tumours. Maintaining a healthy weight through a balanced diet and regular exercise is also essential. Additionally, managing stress levels and getting adequate sleep are crucial for overall well-being.",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0,top: 10),
                    child: Text("-Environmental Factors",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.red
                      ),
                    ),
                  ),
                ],
              ),
              const Text(" Minimising exposure to environmental toxins can help reduce the risk of brain tumours. This includes avoiding or limiting exposure to chemicals, such as pesticides and solvents, and ensuring proper ventilation in living and working spaces. While research on the potential risks associated with cell phones and Wi-Fi radiation is ongoing, using hands-free devices and reducing screen time may provide peace of mind.",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0,top: 10),
                    child: Text("-Smoking and Alcohol",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.red
                      ),
                    ),
                  ),
                ],
              ),
              const Text("Smoking tobacco and excessive alcohol consumption have been linked to an increased risk of various cancers, including brain tumours. Quitting smoking and moderating alcohol intake are essential steps towards reducing this risk. Seek support from support groups or counselling services if needed.",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0,top: 10),
                    child: Text("-Radiation Exposure",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.red
                      ),
                    ),
                  ),
                ],
              ),
              const Text(" Both ionising and non-ionizing radiation can increase the risk of brain tumours. Minimising unnecessary exposure to radiation sources, such as medical imaging tests, is advisable. When such tests are necessary, ensure that the benefits outweigh the risks. Discuss any concerns about radiation exposure with a doctor.",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}