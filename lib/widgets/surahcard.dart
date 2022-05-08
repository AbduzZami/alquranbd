import 'package:flutter/material.dart';

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
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(Readable.QuranData[widget.index]['name']),
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
