import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class WatchScreen extends StatelessWidget {
  const WatchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Text(TimeOfDay.now().hour<12?"Good Morning":"Good Evening",
              style: const TextStyle(
                fontSize: 45,
                color: Colors.teal,
                fontWeight: FontWeight.w700,
              ),),
            // Text(TimeOfDay.now().toString()),
            Text(TimeOfDay.now().hour>12?"${DateTime.now().hour-12} : ${DateTime.now().minute} PM "
            : "${DateTime.now().hour-12} : ${DateTime.now().minute} AM",
            style: const TextStyle(
              fontSize: 40,
              color: Colors.teal,
              fontWeight: FontWeight.w700,
            ),),

          ],
        ),
      ),
    );
  }
}
