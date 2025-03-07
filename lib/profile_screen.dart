import 'package:flutter/material.dart';
import 'package:training_1/notification_screen.dart';

/// Profile screen displaying user details and allowing navigation to notifications.
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  /// Controller to handle email input.
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      /// AppBar with title and notification icon.
      appBar: AppBar(
        title: const Text("Shrijal Shrestha"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => NotificationScreen(
                    email: emailController.text,
                    name: "Shrijal Shrestha",
                  ),
                ),
              );
            },
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),

      /// Body containing profile details.
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const SizedBox(height: 30),

            /// Profile picture placeholder.
            const CircleAvatar(
              radius: 48,
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, size: 48, color: Colors.white),
            ),

            const SizedBox(height: 20),

            /// User name.
            const Center(
              child: Text(
                "Shrijal Shrestha",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            const SizedBox(height: 10),

            /// Contact details.
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "+977-9804320218",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Text(
                  "Biratnagar, Nepal",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),

            const SizedBox(height: 10),

            /// Display the entered email.
            Text(
              "Your email address is: ${emailController.text}",
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            /// Email input field.
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "Enter your email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: const Icon(Icons.email),
              ),
              onChanged: (value) {
                setState(() {}); // Update UI when text changes.
              },
            ),

            const SizedBox(height: 20),

            /// A button to update profile details.
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text("Profile updated successfully!")),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Update Profile",
                style: TextStyle(fontSize: 18),
              ),
            ),

            const SizedBox(height: 20),

            /// A divider for better UI separation.
            const Divider(),

            /// Additional information section.
            const ListTile(
              leading: Icon(Icons.info, color: Colors.blue),
              title: Text("About"),
              subtitle: Text("This is a demo profile screen in Flutter."),
            ),
          ],
        ),
      ),
    );
  }
}
