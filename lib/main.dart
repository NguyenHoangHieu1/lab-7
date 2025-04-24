import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.red,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _storyIndex = 0;

  // List of story paths (with decisions)
  final List<Map<String, dynamic>> _storyData = [
    {
      'storyText': 'You are at a crossroads. Do you want to go left or right?',
      'choice1': {'text': 'Go left', 'nextStory': 2},
      'choice2': {'text': 'Go right', 'nextStory': 1},
    },
    {
      'storyText': 'You encounter a scary beast! Do you fight or run?',
      'choice1': {'text': 'Fight', 'nextStory': 3},
      'choice2': {'text': 'Run', 'nextStory': 4},
    },
    {
      'storyText': 'You find a treasure chest. Do you open it?',
      'choice1': {'text': 'Open it', 'nextStory': 5},
      'choice2': {'text': 'Leave it', 'nextStory': 6},
    },
    {
      'storyText': 'You have defeated the beast! You win!',
      'choice1': {'text': 'Play again', 'nextStory': 0},
      'choice2': {'text': 'Play again', 'nextStory': 0},
    },
    {
      'storyText': 'You ran away safely. You win!',
      'choice1': {'text': 'Play again', 'nextStory': 0},
      'choice2': {'text': 'Play again', 'nextStory': 0},
    },
    {
      'storyText': 'You opened the chest and found gold! You win!',
      'choice1': {'text': 'Play again', 'nextStory': 0},
      'choice2': {'text': 'Play again', 'nextStory': 0},
    },
    {
      'storyText': 'You left the chest. You lose!',
      'choice1': {'text': 'Play again', 'nextStory': 0},
      'choice2': {'text': 'Play again', 'nextStory': 0},
    },
  ];

  // Function to update the story index
  void _nextStory(int choice) {
    setState(() {
      _storyIndex =
          _storyData[_storyIndex]['choice$choice']['nextStory'] as int;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentStory = _storyData[_storyIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Destini - Choose Your Story'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Display story text
            Text(
              currentStory['storyText'] as String,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0),
            ),
            SizedBox(height: 20.0),
            // Display first choice button (if it's a valid choice)
            ElevatedButton(
              onPressed: () {
                _nextStory(1); // Choice 1
              },
              child: Text(currentStory['choice1']['text'] as String),
            ),
            SizedBox(height: 10.0),
            // Display second choice button (if it's a valid choice)
            ElevatedButton(
              onPressed: () {
                _nextStory(2); // Choice 2
              },
              child: Text(currentStory['choice2']['text'] as String),
            ),
          ],
        ),
      ),
    );
  }
}
