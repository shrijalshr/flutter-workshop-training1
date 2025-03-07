import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = "";
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");
  bool isRememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(
          24,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 12,
          children: [
            SizedBox(height: 100),
            Image.asset(
              "assets/images/logo.png",
              height: 100,
              width: 100,
            ),
            Text(
              "Login",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            Text(
              "Welcome, Let's log you in.",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            CustomTextField(
              controller: emailController,
              label: 'Email',
              keyboardType: TextInputType.emailAddress,
              prefixIcon: Icon(
                Icons.email_outlined,
                size: 24,
              ),
              onSubmitted: (s) {},
            ),
            CustomTextField(
              controller: passwordController,
              label: 'Password',
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              prefixIcon: Icon(
                Icons.lock_outline_rounded,
                size: 24,
              ),
              onSubmitted: (s) {},
            ),
            Row(
              children: [
                Checkbox(
                  value: isRememberMe,
                  activeColor: Colors.black,
                  onChanged: (value) {
                    setState(() {
                      isRememberMe = value ?? false;
                    });
                  },
                ),
                Text(
                  "Remember me",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    print("Pressed Forgot Password");
                  },
                  child: Text(
                    "Forgot your password?",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            CustomButton(
              label: "Login",
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Login Pressed!")),
                );
              },
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                SizedBox(
                  width: 8,
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Container(
                                color: Colors.white,
                                height: 100,
                                width: 100,
                                child: CircularProgressIndicator()),
                          );
                        });
                  },
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        decoration: TextDecoration.underline),
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

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    this.onPressed,
  });

  final String label;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 48,
      child: ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Sign up Pressed!")),
          );
        },
        style: ElevatedButton.styleFrom(
          shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(4)),
          backgroundColor: Colors.black,
        ),
        child: Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    this.obscureText = false,
    required this.keyboardType,
    required this.prefixIcon,
    this.onSubmitted,
  });

  final TextEditingController controller;
  final String label;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget prefixIcon;
  final Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        label: Text(label),
        filled: true,
        fillColor: Color(0xffD9D9D9),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      onSubmitted: onSubmitted,
    );
  }
}
