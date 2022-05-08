import 'package:alquranbd/readable.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

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
        appBar: AppBar(
          elevation: 0,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                surah['name'],
                style: GoogleFonts.lateef(
                  textStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
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
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      surah['transliteration'],
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      surah['translation'],
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
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
                          surah['type'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SelectableText(
                          surah['total_verses'].toString(),
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
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: SelectableText((index + 1).toString()),
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        surah['verses'][index]['text'],
                        textAlign: TextAlign.end,
                        style: GoogleFonts.lateef(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 40),
                        ),
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        surah['verses'][index]['translation'],
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context,
                          '/quran?surah=${surah["id"]}&&ayat=${index + 1}');
                    },
                  );
                },
                itemCount: surah['verses'].length,
              ),
              Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('কপিরাইট ©'),
                      TextButton(
                          onPressed: () {
                            launchUrl(
                                Uri.parse('https://facebook.com/abduzzami'));
                          },
                          child:
                              Text('আব্দুজ জামি', textAlign: TextAlign.center))
                    ],
                  )),
            ],
          ),
        ));
  }
}
