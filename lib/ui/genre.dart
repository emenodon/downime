import 'package:flutter/material.dart';
import '../data/models/genre.dart';
import '../data/api_service.dart';

class MyGenre extends StatefulWidget {
  const MyGenre({
    Key? key,
  }) : super(key: key);

  @override
  State<MyGenre> createState() => _MyGenreState();
}

class _MyGenreState extends State<MyGenre> {
  List<Data> list = [];
  GenreListRepo repo = GenreListRepo();

  getData() async {
    var hasil = await repo.getData();

    print(hasil);

    if (hasil.status == "success") {
      setState(() {
        list = hasil.data;
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
                list[index].genreName,
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
