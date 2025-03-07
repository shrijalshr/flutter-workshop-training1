import 'package:flutter/material.dart';
import 'package:training_1/login_screen.dart';
import 'package:training_1/profile_screen.dart';

// Entry point of the application
void main() {
  runApp(const MyApp());
}

// Root widget of the app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hides debug banner
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true, // Enables Material 3 design
      ),
      home: LoginScreen(), // Setting ProfileScreen as the home screen
    );
  }
}

// Stateful widget for the home page
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0; // Counter variable

  // Function to increment the counter value
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // Centers the title
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title), // Displays the title
        leading: IconButton(
          onPressed: () {
            print("Pressed menu button");
          },
          icon: Icon(Icons.menu), // Menu button
        ),
        actions: [
          IconButton(
            onPressed: () {
              print("Pressed notification bell.");
            },
            icon: Icon(Icons.notifications_active), // Notification icon
          ),
          Icon(Icons.search), // Search icon (static, no function)
        ],
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: <Widget>[
            // Basic widgets
            Text(
              "Hello, Flutter!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Icon(Icons.star, size: 50, color: Colors.yellow), // Star icon
            Divider(), // Horizontal line
            SizedBox(height: 20), // Adds spacing

            // Counter display text
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            // Different types of buttons
            ElevatedButton(
              onPressed: () {
                print("Pressed elevated button");
              },
              child: Text("Elevated Button"),
            ),
            TextButton(
              onPressed: () {
                print("Pressed text button");
              },
              child: Text("Text Button"),
            ),
            OutlinedButton(
              onPressed: () {
                print("Pressed outline button");
              },
              child: Text("Outline Button"),
            ),
            ElevatedButton.icon(
              onPressed: () {
                print("Pressed elevated button with icon");
              },
              icon: Icon(Icons.add),
              label: Text("With Icon"),
            ),

            // Custom styled text
            Text(
              "Styled Text Example",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 20,
                color: Colors.green,
              ),
            ),

            // Basic container example
            Container(
              color: Colors.black,
              height: 200,
              width: 200,
            ),

            // Nested containers with padding, margin, and styling
            Container(
              color: Colors.amber,
              child: Container(
                margin: const EdgeInsets.only(
                    bottom: 40, right: 30, top: 50, left: 20),
                padding: const EdgeInsets.all(20),
                height: 600,
                width: 300,
                color: Colors.green,
                child: Container(
                  color: Colors.blueAccent,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("This is a container.",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.red,
                          )),
                    ),
                  ),
                ),
              ),
            ),

            // Displaying an image from the internet
            Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRx0w8Fb0eL5EB7kNviLUOUTxXfFtUxnVNHfA&s",
            ),

            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRx0w8Fb0eL5EB7kNviLUOUTxXfFtUxnVNHfA&s",
              ),
            )
          ],
        ),
      ),

      // Floating action button to increment counter
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}
