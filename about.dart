import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
        backgroundColor: Colors.amber,
        foregroundColor: Colors.brown,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "To Do List App",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  '''
Developed by Prateek Basnet

Welcome to the To-Do List App. By using this app, you agree to the terms and conditions outlined below.

This app is designed to help you stay organized by creating and managing your personal to-do lists. It's meant for individual productivity use only. When you use this app, you agree to use it responsibly and legally. Please do not use the app for any harmful, illegal, or malicious activities.

The information you enter in the app, like your task names, descriptions, or deadlines, is saved locally on your device. I do not collect or store your personal data on external servers, nor do I share your information with third parties. However, it's your responsibility to make sure you back up any important data. I cannot guarantee the recovery of data if something unexpected happens, such as a device reset or app reinstallation.

By using this app, you acknowledge that I, as the developer, am not responsible for any damages or losses that may occur from using the app. This includes any potential loss of data or missed deadlines. The app is provided “as is,” and while I strive to make it as helpful and reliable as possible, I can’t guarantee it will always be free from bugs or interruptions.

I may update or change these terms from time to time. When I do, your continued use of the app means that you accept the updated terms.

If you ever have questions, suggestions, or concerns about the app or these terms, feel free to reach out to me. 

Thank you for using the To-Do List app I hope it helps you stay on top of your tasks and get things done more efficiently.
''',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
