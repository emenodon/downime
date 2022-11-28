import 'package:flutter/material.dart';
import 'data/api_service.dart';
import 'data/models/home.dart';
import 'ui/complete.dart';
import 'ui/genre.dart';
import 'ui/schedule.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Downime',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/home": (context) => MyHomePage(),
        "/genre": (context) => MyGenre(),
        "/complete": (context) => MyComplete(),
        "/schedule": (context) => MySchedule()
      },
      debugShowCheckedModeBanner: false,
      initialRoute: "/home",

      //   home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Complete> complete = [];
  List<Complete> onGoing = [];
  HomeRepo repo = HomeRepo();

  getData() async {
    var hasil = await repo.getData();

    print(hasil);

    if (hasil.status == "success") {
      setState(() {
        complete = hasil.home.complete;
        onGoing = hasil.home.onGoing;
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
                complete[index].title,
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              Text(
                onGoing[index].title,
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ]),
          );
        },
        separatorBuilder: ((context, index) {
          return const Divider();
        }),
        itemCount: complete.length,
      ),
    );
  }
}
