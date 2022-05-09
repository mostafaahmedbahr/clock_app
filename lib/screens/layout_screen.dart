import 'package:clock_app/screens/alram_screen.dart';
import 'package:clock_app/screens/stop_watch_screen.dart';
import 'package:clock_app/screens/timer_screen.dart';
import 'package:clock_app/screens/watch_screen.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text("Clock App"),
          centerTitle: true,
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.watch_later),
                child: Text("Clock"),
              ),
              Tab(
                icon: Icon(Icons.alarm),
                child: Text("Alarm"),
              ),
              Tab(
                icon: Icon(Icons.timer),
                child: Text("Timer"),
              ),
              Tab(
                icon: Icon(Icons.lock_clock),
                child: Text("S-Watch"),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            WatchScreen(),
            AlarmScreen(),
            TimerScreen(),
            StopWatchScreen(),
          ],
        ),
      ),
    );
  }
}
