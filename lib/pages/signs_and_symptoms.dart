import 'package:flutter/material.dart';

class SignsAndSymptoms extends StatelessWidget {
  const SignsAndSymptoms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signs And Symptoms'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            children: [
              Image.asset(
                'lib/images/signsandsymp.jpg',
                width: 411,
              ),
              const Text("When brain tumors are very small, some people may not experience any symptoms or the symptoms are so minimal they don’t notice them. As brain tumors grow, signs and symptoms can vary and largely depend on the tumor’s location within the brain, its size, and how quickly it grows.",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 8,),
              const Text("Some of the more common signs and symptoms caused by brain tumors include the following:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text("-Headaches",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),
                    ),
                  ),
                ],
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text("-Seizures",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),
                    ),
                  ),
                ],
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text("-Difficulty thinking, speaking, or finding words",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),
                    ),
                  ),
                ],
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text("-Changes in personality or behavior",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text("-Weakness, numbness, or loss of movement "
                    "in one part or one side of the body",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  ),
                ),
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text("-Difficulty with balance or dizziness",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),
                    ),
                  ),
                ],
              ),
              const  Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text("-Memory loss",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),
                    ),
                  ),
                ],
              ),
              const  Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text("-Confusion in everyday matters or disorientation",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),
                    ),
                  ),
                ],
              ),
              const  Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text("-Unexplained nausea or vomiting",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),
                    ),
                  ),
                ],
              ),
              const  Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text("-Fatigue or muscle weakness",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),
                    ),
                  ),
                ],
              ),
              const Text("Other possible signs and symptoms can include abnormal eye movements, trouble swallowing, trouble walking, weakness or drooping of one side of the face, loss of appetite or weight loss, and slurred speech.",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const  Text("If you are experiencing any new, persistent, or concerning symptoms or you suspect you may have a brain tumor, please talk to your healthcare provider as soon as possible.",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const  Text("If you suddenly experience any of the following symptoms, please call 911:",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const  Row(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: 8.0),
                    child: Text("-Numbness or weakness in the face, arm, or leg",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),
                    ),
                  ),
                ],
              ),
              const  Row(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: 8.0),
                    child: Text("-Trouble speaking or understanding speech",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),
                    ),
                  ),
                ],
              ),
              const  Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text("-Trouble seeing in one or both eyes",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),
                    ),
                  ),
                ],
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text("-Difficulty with walking, balance, or dizziness",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),
                    ),
                  ),
                ],
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text("-Worst headache of your life",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),
                    ),
                  ),
                ],
              ),
              const Text("Brain tumors can damage healthy tissue, press on healthy brain tissue, or cause pressure in the brain and negatively impact certain functions.",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}