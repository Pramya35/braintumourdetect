import 'package:flutter/material.dart';

Widget getDetailsContent(String title) {
  switch (title) {
    case 'Signs & Symptoms':
      return const SignsAndSymptomsDetails();
    case 'Precautions':
      return const PrecautionsDetails();
    case 'Treatment':
      return const TreatmentDetails();
    default:
      return Container(); // Return empty container as a fallback
  }
}

// Details for Signs & Symptoms
class SignsAndSymptomsDetails extends StatelessWidget {
  const SignsAndSymptomsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Signs & Symptoms',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            'Common signs and symptoms of brain tumours include headaches, seizures, cognitive changes, and vision problems.',
            style: TextStyle(fontSize: 16.0),
          ),
          Text(
            'Other symptoms may include nausea, vomiting, balance issues, and speech difficulties.',
            style: TextStyle(fontSize: 16.0),
          ),
          // Add more details as needed
        ],
      ),
    );
  }
}

// Details for Precautions
class PrecautionsDetails extends StatelessWidget {
  const PrecautionsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Precautions',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            'There are no specific precautions to prevent brain tumours, but leading a healthy lifestyle with a balanced diet and regular exercise may reduce the risk.',
            style: TextStyle(fontSize: 16.0),
          ),
          Text(
            'It is important to seek medical attention if you experience any unusual symptoms or changes in your health.',
            style: TextStyle(fontSize: 16.0),
          ),
          // Add more details as needed
        ],
      ),
    );
  }
}

// Details for Treatment
class TreatmentDetails extends StatelessWidget {
  const TreatmentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Treatment',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            'Treatment for brain tumours depends on several factors, including the type, size, and location of the tumour, as well as the patient\'s overall health and preferences.',
            style: TextStyle(fontSize: 16.0),
          ),
          Text(
            'Common treatments include surgery, radiation therapy, and chemotherapy. The treatment plan is usually determined by a team of medical professionals.',
            style: TextStyle(fontSize: 16.0),
          ),
          // Add more details as needed
        ],
      ),
    );
  }
}
