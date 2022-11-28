import 'package:flutter/material.dart';
import '../data/api_service.dart';
import '../data/models/schedule.dart';

class MySchedule extends StatefulWidget {
  const MySchedule({
    Key? key,
  }) : super(key: key);

  @override
  State<MySchedule> createState() => _MyScheduleState();
}

class _MyScheduleState extends State<MySchedule> {
  List<ScheduleData> list = [];
  ScheduleListRepo repo = ScheduleListRepo();

  getData() async {
    var hasil = await repo.getData();

    print(hasil);

    if (hasil == true) {
      setState(() {
        list = hasil.scheduleList;
      });
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Downime"),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                list[index].day,
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ]),
          );
        },
        separatorBuilder: ((context, index) {
          return const Divider();
        }),
        itemCount: list.length,
      ),
    );
  }
}
