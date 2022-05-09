import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
class TimerScreen extends StatefulWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  final CustomTimerController _controller = CustomTimerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTimer(
                controller: _controller,
                begin: const Duration(days: 1),
                end: const Duration(),
                builder: (time) {
                  return Text(
                      "${time.hours}:${time.minutes}:${time.seconds}.${time.milliseconds}",
                      style: const TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold)
                  );
                }
            ),
            const SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RoundedButton(
                  text: "Start",
                  color: Colors.green,
                  onPressed: () => _controller.start(),
                ),
                RoundedButton(
                  text: "Pause",
                  color: Colors.blue,
                  onPressed: () => _controller.pause(),
                ),
                RoundedButton(
                  text: "Reset",
                  color: Colors.red,
                  onPressed: () => _controller.reset(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

}
class RoundedButton extends StatelessWidget {
  final String text;
  final Color color;
  final void Function()? onPressed;

  RoundedButton({required this.text, required this.color, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(text, style: const TextStyle(color: Colors.white)),
      style: TextButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      ),
      onPressed: onPressed,
    );
  }
}
