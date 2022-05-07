import 'package:flutter/material.dart';

class ThisPageIsNotAvailable extends StatefulWidget {
  const ThisPageIsNotAvailable({Key? key}) : super(key: key);

  @override
  State<ThisPageIsNotAvailable> createState() => _ThisPageIsNotAvailableState();
}

class _ThisPageIsNotAvailableState extends State<ThisPageIsNotAvailable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectableText(
              'This page is not available',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Back to Home'),
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            ),
          ],
        ),
      )),
    );
  }
}
