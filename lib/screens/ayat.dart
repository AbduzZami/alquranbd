import 'dart:convert';

import 'package:alquranbd/models/ayataudio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../readable.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:http/http.dart' as http;

class Ayat extends StatefulWidget {
  final int surahNumber, ayatNumber;
  const Ayat({Key? key, required this.surahNumber, required this.ayatNumber})
      : super(key: key);

  @override
  State<Ayat> createState() => _AyatState();
}

class _AyatState extends State<Ayat> {
  final ayatAudioPlayer = AssetsAudioPlayer();
  bool isPlayingAudio = false;
  bool isPlayable = false;

  @override
  void initState() {
    // TODO: implement initState

    _getAudio();
    ayatAudioPlayer.isPlaying.listen((isPlaying) {
      if (mounted) {
        setState(() {
          isPlayingAudio = isPlaying;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    ayatAudioPlayer.stop();
    super.dispose();
  }

  Future<AyatAudio> fetchAlbum() async {
    String surahNumber = widget.surahNumber.toString();
    String ayatNumber = widget.ayatNumber.toString();
    String url =
        'https://api.alquran.cloud/v1/ayah/$surahNumber:$ayatNumber/ar.alafasy';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return AyatAudio.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  _getAudio() async {
    await fetchAlbum().then((value) async {
      try {
        await ayatAudioPlayer
            .open(Audio.network(value.audioUrl), autoStart: false)
            .then((value) {
          setState(() {
            isPlayable = true;
          });
        });

        // assetsAudioPlayer.play();
      } catch (t) {
        //mp3 unreachable
      }
    });
  }

  _playorPauseAudio() async {
    if (isPlayable) {
      if (!isPlayingAudio) {
        ayatAudioPlayer.play();
        setState(() {
          isPlayingAudio = true;
        });
      } else {
        // assetsAudioPlayer.stop();
        ayatAudioPlayer.pause();

        setState(() {
          isPlayingAudio = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var ayat = Readable.QuranData[widget.surahNumber - 1]['verses']
        [widget.ayatNumber - 1];
    var surah = Readable.QuranData[widget.surahNumber - 1];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // leading: IconButton(
        //     onPressed: () {
        //       Navigator.pushNamed(
        //           context, '/quran?surah=${widget.surahNumber}');
        //     },
        //     icon: Icon(
        //       // Icons.arrow_back_ios_new,
        //       // size: 18,
        //       Icons.arrow_back,
        //     )),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              surah['name'],
              style: GoogleFonts.lateef(
                textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              // style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
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
        actions: [
          IconButton(
            icon:
                (isPlayingAudio) ? Icon(Icons.pause) : Icon(Icons.play_circle),
            onPressed: () {
              _playorPauseAudio();
            },
          ),
          IconButton(
              onPressed: () {
                String url =
                    'https://quran-bd.web.app/quran?surah=${widget.surahNumber}&&ayat=${widget.ayatNumber}';
                Clipboard.setData(ClipboardData(text: url)).then((_) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Link copied to clipboard")));
                });
              },
              icon: Icon(CupertinoIcons.link_circle_fill)),
        ],
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
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 45),
                ),
                // style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
              ),
              SelectableText(
                'بسم الله الرحمن الرحيم',
                textAlign: TextAlign.center,
                style: GoogleFonts.lateef(
                  textStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 45),
                ),
                // style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
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
                        fontSize: 60,
                      ),
                    ),
                    // style: TextStyle(
                    //   fontWeight: FontWeight.normal,
                    //   fontSize: 45,
                    // ),
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
            ]),
      ),
    );
  }
}
