import 'package:flutter/material.dart';

class DefaultPage extends StatefulWidget {
  const DefaultPage({super.key});

  @override
  State<DefaultPage> createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/userhomepage');
                },
                child: Text("user View")),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/adminhomepage');
                },
                child: Text('Admin View'))
          ],
        ),
      ),
    );
  }
}
