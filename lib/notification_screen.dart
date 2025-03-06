import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key, this.email, this.name});

  /// The name of the user (nullable).
  final String? name;

  /// The email of the user (nullable).
  final String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// AppBar with a title and a back button
      appBar: AppBar(
        title: const Text("Notification"),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context)
                .pop(); // Navigates back to the previous screen
          },
        ),
      ),

      /// Body of the screen wrapped in a ListView to allow scrolling
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          /// Displays the user's name
          Text(
            "My name is ${name ?? 'Unknown'}", // Shows 'Unknown' if name is null
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade700,
            ),
          ),

          const SizedBox(height: 10), // Adds spacing between widgets

          /// Displays the user's email
          Text(
            "My email is ${email ?? 'Not provided'}", // Shows 'Not provided' if email is null
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),

          const SizedBox(height: 20),

          /// A divider for visual separation
          const Divider(),

          /// A sample notification card to illustrate UI elements
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), //rounds the corners
            ),
            child: const ListTile(
              leading: Icon(Icons.notifications, color: Colors.blue),
              title: Text("New Notification"),
              subtitle: Text("You have received a new message."),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),

          const SizedBox(height: 20),

          /// A button for demonstration purposes
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Button Pressed!")),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              "Acknowledge",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
