import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Olopsc Alumni Tracking System (OATS)',
          ),
        ),
      ),
      body: Center(
        child: Text('Profile Page'),
      ),
    );
  }
}
