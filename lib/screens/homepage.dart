import 'package:alquranbd/readable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setApplicationSwitcherDescription(
    //     ApplicationSwitcherDescription(
    //   label: 'QuranBD | Home',
    //   primaryColor: Theme.of(context).primaryColor.value,
    // ));
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
              leading: Text((index + 1).toString()),
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
