import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../readable.dart';

class SurahCard extends StatefulWidget {
  final int index;
  const SurahCard({Key? key, required this.index}) : super(key: key);

  @override
  State<SurahCard> createState() => _SurahCardState();
}

class _SurahCardState extends State<SurahCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        Navigator.pushNamed(context, '/quran?surah=${widget.index + 1}');
        // Navigator.popAndPushNamed(context, '/quran?surah=${widget.index + 1}');
      }),
      child: Card(
        child: Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text((widget.index + 1).toString()),
                SizedBox(
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(Readable.QuranData[widget.index]['transliteration']),
                    SizedBox(
                      height: 10,
                    ),
                    Text(Readable.QuranData[widget.index]['translation']),
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Readable.QuranData[widget.index]['name'],
                      style: GoogleFonts.lateef(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 25),
                      ),
                      // style: TextStyle(
                      //     fontWeight: FontWeight.normal, fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    Text(Readable.QuranData[widget.index]['total_verses']
                        .toString()),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
