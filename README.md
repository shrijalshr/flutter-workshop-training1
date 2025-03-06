# Flutter Training - Day 1

## Introduction
This document serves as a guide for the first day of Flutter training. It includes an overview of the topics covered, possible questions with answers, and necessary commands or instructions.

---

## Topics Covered
- Setting up a Flutter project
- Understanding the `main.dart` file
- Widgets (Stateless & Stateful)
- AppBar with icons
- Buttons (Elevated, Text, Outlined, Icon Buttons)
- Containers and styling
- ListView and basic layout widgets
- Floating Action Button (FAB)
- Displaying images from the internet

---

## Frequently Asked Questions (FAQs)

### 1. **How do I set up a new Flutter project?**
Run the following command in your terminal or command prompt:
```sh
flutter create my_project_name
```
Then, navigate into the project folder:
```sh
cd my_project_name
```

### 2. **How do I run the Flutter app?**
Make sure you have a device/emulator running, then execute:
```sh
flutter run
```

### 3. **What is the purpose of `main.dart`?**
- The `main.dart` file is the entry point of a Flutter application.
- It contains the `main()` function, which calls `runApp()` to start the app.
- `MyApp` (a `StatelessWidget`) defines the app’s theme and the home screen.

### 4. **What is the difference between Stateless and Stateful widgets?**
- **StatelessWidget**: Does not change over time (e.g., a simple text display).
- **StatefulWidget**: Can change dynamically (e.g., a counter that increments when a button is clicked).


### 5. **What is the purpose of `Scaffold`?**
- `Scaffold` provides a framework for UI components like `AppBar`, `FloatingActionButton`, `Drawer`, etc.

### 6. **How do I add an AppBar with icons?**
Use the `AppBar` widget inside `Scaffold`:
```dart
appBar: AppBar(
  title: Text("My App"),
  actions: [
    IconButton(
      icon: Icon(Icons.notifications),
      onPressed: () {
        print("Notification clicked");
      },
    ),
  ],
)
```

### 7. **How do I add different types of buttons?**
```dart
ElevatedButton(
  onPressed: () {
    print("Elevated button clicked");
  },
  child: Text("Elevated Button"),
),
```
Other types:
- `TextButton` for minimal styling.
- `OutlinedButton` for a bordered look.
- `ElevatedButton.icon()` for buttons with icons.

### 8. **How do I create a `ListView`?**
Use `ListView` to display multiple widgets in a scrollable format:
```dart
ListView(
  padding: EdgeInsets.all(16),
  children: [
    Text("Hello, Flutter!"),
    Icon(Icons.star, size: 50, color: Colors.yellow),
    ElevatedButton(onPressed: () {}, child: Text("Click Me")),
  ],
)
```

### 9. **How do I display an image from the internet?**
```dart
Image.network(
  "https://example.com/image.jpg",
)
```

### 10. **How do I add a Floating Action Button (FAB)?**
```dart
floatingActionButton: FloatingActionButton(
  onPressed: _incrementCounter,
  child: Icon(Icons.add),
),
```

---

## Additional Commands & Instructions

### Check if Flutter is installed properly
```sh
flutter doctor
```

### Get all dependencies
```sh
flutter pub get
```

### Hot reload (faster updates)
Press `r` in the terminal while running the app or click the **Hot Reload** button in your IDE.

### Stop the running application
Press `Ctrl + C` in the terminal.

---

