import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.lightBlueAccent, Colors.lightGreenAccent],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(18.0),
                alignment: Alignment.center,
                child: TextField(
                  onChanged: (String? val) {
                    setState(() {
                      text = val!;
                    });
                  },
                  style: TextStyle(fontFamily: 'Montserrat', fontSize: 16.0),
                  decoration: InputDecoration(
                    labelText: 'Enter text here',
                    labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                    ),
                    hintText: 'Type something',
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white.withOpacity(0.7),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.3),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 15.0),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                color: Colors.white.withOpacity(0.5),
                child: Center(
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 300),
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: text.isNotEmpty ? 20.0 : 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    child: Text(text.isNotEmpty ? 'You entered: $text' : ''),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  text = '';
                });
              },
              child: Text(
                'Clear Text',
                style: TextStyle(fontFamily: 'Montserrat'),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
