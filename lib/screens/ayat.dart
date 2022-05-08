import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      appBar: AppBar(
        elevation: 0,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              surah['name'],
              style: GoogleFonts.lateef(
                textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              width: 3,
              height: 25,
              color: Theme.of(context).highlightColor,
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    surah['transliteration'],
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'আয়াত ' + ayat['id'].toString(),
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SelectableText(
                surah['name'],
                textAlign: TextAlign.center,
                style: GoogleFonts.lateef(
                  textStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
              ),
              SelectableText(
                'بسم الله الرحمن الرحيم',
                textAlign: TextAlign.center,
                style: GoogleFonts.lateef(
                  textStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SelectableText(
                        surah['transliteration'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SelectableText(
                        surah['translation'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    width: 2,
                    height: 40,
                    color: Theme.of(context).highlightColor,
                  ),
                  Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SelectableText(
                          'আয়াত ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SelectableText(
                          ayat['id'].toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: SelectableText(
                    ayat['text'],
                    textAlign: TextAlign.end,
                    style: GoogleFonts.lateef(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 50,
                          letterSpacing: 0.5),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: SelectableText(
                    ayat['translation'],
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
