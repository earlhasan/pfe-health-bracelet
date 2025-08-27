// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class FAQPage extends StatefulWidget {
  const FAQPage({Key? key}) : super(key: key);

  @override
  _FAQPageState createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  late Future<List<Map<String, String>>> faqData;

  @override
  void initState() {
    super.initState();
    faqData = fetchFAQs(); // Simulating API or Firebase data fetching
  }

  Future<List<Map<String, String>>> fetchFAQs() async {
    await Future.delayed(Duration(seconds: 2)); // Simulating a delay
    return [
      {
        "question": "How does the app work?",
        "answer": "The app helps doctors monitor patient data in real-time."
      },
      {
        "question": "Is patient data secure?",
        "answer":
            "Yes, patient data is encrypted and follows privacy standards."
      },
      {
        "question": "How do I contact support?",
        "answer": "You can reach out through the app’s support section."
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FAQ"), backgroundColor: Colors.blue),
      body: FutureBuilder<List<Map<String, String>>>(
        future: faqData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator()); // Loading spinner
          } else if (snapshot.hasError) {
            return Center(child: Text("Error loading FAQs"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No FAQs available"));
          }

          return ListView.builder(
            padding: EdgeInsets.all(16.0),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8.0),
                child: ExpansionTile(
                  title: Text(
                    snapshot.data![index]["question"]!,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(snapshot.data![index]["answer"]!),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
