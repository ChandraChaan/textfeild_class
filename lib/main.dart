import "package:flutter/material.dart";

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.lightGreen,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: TextField(
                      onChanged: (String? val) {
                        setState(() {
                          text = val!;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Yedoti enter cheyyandi',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(color: Colors.blue),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(color: Colors.blue),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 15.0),
                      ),
                    ),
                  ),
                ),
              )),
          Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Center(child: Text('You enterted: $text')),
              )),
        ],
      ),
    );
  }
}
