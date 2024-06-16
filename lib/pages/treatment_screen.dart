import 'package:flutter/material.dart';

class TreatmentScreen extends StatelessWidget {
  const TreatmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Treatment'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            children: [
              Image.asset(
                'lib/images/treatment.jpg',
                width: 411,
              ),
              const Text("The main treatments for brain tumours are surgery and radiotherapy. Some people might have chemotherapy. Your treatment depends on the type of tumour you have, where it is and your general health.",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0,top: 10),
                    child: Text("-Preparing for treatment and life afterwards",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.red
                      ),
                    ),
                  ),
                ],
              ),
              const Text("There are things you can do to help you feel more in control of your physical and mental health when preparing for treatment. In the hospital, preparing for treatment is also called prehabilitation or prehab.",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8.0,top: 10),
                child: Text("-Treatment options for brain and spinal cord tumours",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.red
                  ),
                ),
              ),
              const Text("The main treatment options for brain and spinal cord tumours are surgery, radiotherapy and chemotherapy.",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0,top: 10),
                    child: Text("-Surgery for brain tumours",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.red
                      ),
                    ),
                  ),
                ],
              ),
              const Text("You might have surgery to remove all or part of your tumour. Or or to drain a build up of fluid (hydrocephalus) on your brain. ",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0,top: 10),
                    child: Text("-Radiotherapy for brain tumours",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.red
                      ),
                    ),
                  ),
                ],
              ),
              const Text("Radiotherapy uses high energy x-rays to treat brain and spinal cord tumours. ",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0,top: 10),
                    child: Text("-Chemotherapy for brain tumours",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.red
                      ),
                    ),
                  ),
                ],
              ),
              const Text("You might have chemotherapy for some types of brain tumours. It uses cytotoxic drugs to destroy brain tumour cells. ",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0,top: 10),
                    child: Text("-Controlling symptoms of brain tumours",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.red
                      ),
                    ),
                  ),
                ],
              ),
              const Text("You might have some medicines to help control the symptoms of your brain tumour.",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0,top: 10),
                    child: Text("-If your brain tumour comes back",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.red
                      ),
                    ),
                  ),
                ],
              ),
              const Text("You might have treatment with surgery, radiotherapy and chemotherapy if your brain tumour comes back. ",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0,top: 10),
                    child: Text("-Follow up after brain tumour treatment",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.red
                      ),
                    ),
                  ),
                ],
              ),
              const Text("You have follow up appointments to check how you are and see if you have any problems or worries.",
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