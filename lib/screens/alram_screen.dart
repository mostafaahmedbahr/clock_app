 import 'package:flutter/material.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({Key? key}) : super(key: key);

  @override
  State<AlarmScreen> createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {

  String? time;
  String? date;
  List listDate = [];
  List listTime = [];
  void addToList()
  {
    listDate.add(date);
    listTime.add(time);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:listDate.isEmpty?const Center(child: Text("Empty",
      style: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),)) :ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: listDate.length ,
        itemBuilder: (context, index) => buildAlarmItem(listDate[index],listTime[index]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: ()  {
         shoTimeDialog(context).then((value)
         {
           setState(() {
             time=value;
           });
           addToList();
         });
         showDateDialog(context).then((value) {
           setState(() {
             date = value;
           });

         });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildAlarmItem(String date, String time) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(Icons.label_outline_rounded),
                    SizedBox(width: 5,),
                    Text("Alarm",
                      style: TextStyle(
                        color: Colors.teal,
                      ),),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: Text(date,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(time,
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),),
                Switch(
                  inactiveThumbColor: Colors.teal,
                  activeColor: Colors.teal,
                  activeTrackColor: Colors.teal[300],
                  inactiveTrackColor: Colors.grey,
                  value: true,
                  onChanged: (bool change) {},
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }

  Future showDateDialog(BuildContext context) async {
    var date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2001),
      lastDate: DateTime(2030),
    );
    print(date);
    return date.toString().substring(0,10);
  }

  Future shoTimeDialog(BuildContext context) async {
    var time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
    );
    var localization =  MaterialLocalizations.of(context);
    localization.formatTimeOfDay(time!).toString();
        print(localization.formatTimeOfDay(time).toString());
    return localization.formatTimeOfDay(time).toString();
  }
}

