import 'package:flutter/material.dart';

import '../data/api_service.dart';
import '../data/models/complete.dart';

class MyComplete extends StatefulWidget {
  const MyComplete({
    Key? key,
  }) : super(key: key);

  @override
  State<MyComplete> createState() => _MyCompleteState();
}

class _MyCompleteState extends State<MyComplete> {
  List<AnimeList> list = [];
  CompleteAnimeRepo repo = CompleteAnimeRepo();

  getData() async {
    var hasil = await repo.getData();

    print(hasil);

    if (hasil.status == "success") {
      setState(() {
        list = hasil.animeList;
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
                list[index].title,
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
