import 'package:flutter/material.dart';

class Download extends StatefulWidget {
  const Download({super.key});

  @override
  State<Download> createState() => _DownloadState();
}

class _DownloadState extends State<Download> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'Downlord',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
