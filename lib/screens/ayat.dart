import 'package:flutter/material.dart';

import '../readable.dart';

class Ayat extends StatefulWidget {
  final int surahNumber, ayatNumber;
  const Ayat({Key? key, required this.surahNumber, required this.ayatNumber})
      : super(key: key);

  @override
  State<Ayat> createState() => _AyatState();
}

class _AyatState extends State<Ayat> {
  @override
  Widget build(BuildContext context) {
    var ayat = Readable.QuranData[widget.surahNumber - 1]['verses']
        [widget.ayatNumber - 1];
    var surah = Readable.QuranData[widget.surahNumber - 1];
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(200),
          child: SafeArea(
            child: Column(children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back)),
              ),
              SelectableText(
                surah['name'],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SelectableText(
                surah['transliteration'],
                textAlign: TextAlign.center,
              ),
              SelectableText(
                surah['translation'],
                textAlign: TextAlign.center,
              ),
              SelectableText(
                'Ayat - ' + ayat['id'].toString(),
                textAlign: TextAlign.center,
              ),
            ]),
          )),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          width: MediaQuery.of(context).size.width,
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: SelectableText(
                ayat['text'],
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: SelectableText(
                ayat['translation'],
                textAlign: TextAlign.start,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
