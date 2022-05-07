import 'package:alquranbd/readable.dart';
import 'package:alquranbd/screens/surah.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: SelectableText(
          'Al Quran BD',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              leading: Title(
                color: Colors.green,
                child: Text((index + 1).toString()),
              ),
              title: Text(Readable.QuranData[index]['name']),
              subtitle: Text(Readable.QuranData[index]['transliteration'] +
                  ' (' +
                  Readable.QuranData[index]['translation'] +
                  ')'),
              onTap: () {
                Navigator.pushNamed(context, '/quran?surah=${index + 1}');
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => Surah(surahNumber: index + 1)));
              },
            );
          },
          itemCount: Readable.QuranData.length,
        ),
      ),
    );
  }
}
