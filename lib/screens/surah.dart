import 'package:alquranbd/readable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Surah extends StatefulWidget {
  // final surah;
  final int surahNumber;
  const Surah({Key? key, required this.surahNumber}) : super(key: key);

  @override
  State<Surah> createState() => _SurahState();
}

class _SurahState extends State<Surah> {
  @override
  Widget build(BuildContext context) {
    var surah = Readable.QuranData[widget.surahNumber - 1];
    // SystemChrome.setApplicationSwitcherDescription(
    //     ApplicationSwitcherDescription(
    //   label: 'QuranBD | Surah | $widget.surahNumber',
    //   primaryColor: Theme.of(context).primaryColor.value,
    // ));
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
                surah['type'],
                textAlign: TextAlign.center,
              ),
              SelectableText(
                surah['total_verses'].toString(),
                textAlign: TextAlign.center,
              ),
            ]),
          )),
      // title: Text(widget.surah['name']),

      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            leading: SelectableText((index + 1).toString()),
            title: Text(
              surah['verses'][index]['text'],
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.normal,
              ),
            ),
            subtitle: Text(
              surah['verses'][index]['translation'],
              textAlign: TextAlign.start,
            ),
            onTap: () {
              Navigator.pushNamed(
                  context, '/quran?surah=${surah["id"]}&&ayat=${index + 1}');
            },
          );
        },
        itemCount: surah['verses'].length,
      ),
    );
  }
}
