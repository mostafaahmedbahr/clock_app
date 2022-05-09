import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
class StopWatchScreen extends StatefulWidget {
  const StopWatchScreen({Key? key}) : super(key: key);

  @override
  State<StopWatchScreen> createState() => _StopWatchScreenState();
}

class _StopWatchScreenState extends State<StopWatchScreen> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  final _isHours = true;
  @override
  void dispose() {
     super.dispose();
     _stopWatchTimer.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<int>(
              stream: _stopWatchTimer.rawTime,
              initialData: _stopWatchTimer.rawTime.value,
              builder: (context,snapshot)
            {
              final value = snapshot.data;
              final displayTime = StopWatchTimer.getDisplayTime(value!,hours: _isHours);

              return Text(displayTime,style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),);
            },),
            const SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RoundedButton(
                  text: "Start",
                  color: Colors.green,
                  onPressed: () => _stopWatchTimer.onExecute.add(StopWatchExecute.start),
                ),
                RoundedButton(
                  text: "Pause",
                  color: Colors.blue,
                  onPressed: () =>  _stopWatchTimer.onExecute.add(StopWatchExecute.stop),
                ),
                RoundedButton(
                  text: "Reset",
                  color: Colors.red,
                  onPressed: () =>  _stopWatchTimer.onExecute.add(StopWatchExecute.reset),
                )
              ],
            ),
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
