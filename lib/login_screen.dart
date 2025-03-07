import 'package:flutter/material.dart';

// LoginScreen is a StatefulWidget since it contains mutable state (e.g., email input and checkbox state)
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controllers are used to retrieve user input from TextFields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Boolean variable to store the state of the "Remember Me" checkbox
  bool isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24), // Adds padding to the entire screen for better UI spacing
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centers the column content vertically
          crossAxisAlignment: CrossAxisAlignment.center, // Centers the column content horizontally
          children: [
            const SizedBox(height: 100), // Adds vertical space before the logo
            // Displays the application logo
            Image.asset(
              "assets/images/logo.png",
              height: 100,
              width: 100,
            ),
            // Heading for the Login Screen
            const Text(
              "Login",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            // Subtitle for the login screen
            const Text(
              "Welcome, Let's log you in.",
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 24), // Adds spacing before the input fields
            // Email Input Field
            CustomTextField(
              controller: emailController,
              label: 'Email',
              keyboardType: TextInputType.emailAddress, // Ensures the correct keyboard is shown
              prefixIcon: const Icon(Icons.email_outlined, size: 24),
            ),
            // Password Input Field
            CustomTextField(
              controller: passwordController,
              label: 'Password',
              obscureText: true, // Hides password input for security
              keyboardType: TextInputType.visiblePassword, // Shows password-specific keyboard
              prefixIcon: const Icon(Icons.lock_outline_rounded, size: 24),
            ),
            Row(
              children: [
                // Remember Me Checkbox
                Checkbox(
                  value: isRememberMe,
                  activeColor: Colors.black,
                  onChanged: (value) {
                    setState(() {
                      isRememberMe = value ?? false;
                    });
                  },
                ),
                const Text(
                  "Remember me",
                  style: TextStyle(fontSize: 12),
                ),
                const Spacer(), // Pushes "Forgot your password?" text to the right
                // Forgot Password Gesture
                GestureDetector(
                  onTap: () {
                    // Placeholder action for forgot password functionality
                    print("Pressed Forgot Password");
                  },
                  child: const Text(
                    "Forgot your password?",
                    style: TextStyle(fontSize: 12, color: Colors.blue),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12), // Spacing before the login button
            // Login Button
            CustomButton(
              label: "Login",
              onPressed: () {
                // Displays a temporary message when the login button is pressed
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Login Pressed!")),
                );
              },
            ),
            const SizedBox(height: 8), // Spacing before the sign-up prompt
            // Sign Up Prompt
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                const SizedBox(width: 8), // Small gap between text and link
                GestureDetector(
                  onTap: () {
                    // Shows a loading dialog when "Sign up" is clicked (temporary UI feedback)
                    showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            content: SizedBox(
                                height: 100,
                                width: 100,
                                child: Center(child: CircularProgressIndicator())),
                          );
                        });
                  },
                  child: const Text(
                    "Sign up",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        decoration: TextDecoration.underline,
                        color: Colors.blue),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Button Widget
class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Makes the button full-width
      height: 48, // Standard button height
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), // Rounded button corners
          backgroundColor: Colors.black, // Button background color
        ),
        child: Text(
          label,
          style: const TextStyle(color: Colors.white), // Button text color
        ),
      ),
    );
  }
}

// Custom Text Field Widget
class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    this.obscureText = false,
    required this.keyboardType,
    required this.prefixIcon,
  });

  final TextEditingController controller;
  final String label;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText, // Determines whether text should be hidden (for passwords)
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          labelText: label, // Adds a label to the input field
          filled: true,
          fillColor: Colors.grey.shade200, // Light gray background for better UI contrast
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8), // Rounded corners for better aesthetics
            borderSide: BorderSide.none, // Removes the border
          ),
        ),
      ),
    );
  }
}
