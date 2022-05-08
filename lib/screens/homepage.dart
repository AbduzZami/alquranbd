import 'package:alquranbd/readable.dart';
import 'package:alquranbd/widgets/homedrawer.dart';
import 'package:alquranbd/widgets/searchshortcut.dart';
import 'package:alquranbd/widgets/surahcard.dart';
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
      drawer: HomeDrawer(),
      appBar: AppBar(
        elevation: 0,
        // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: SelectableText(
          'আল কুরআন',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        Container(
            height: 400,
            constraints: BoxConstraints(
              maxWidth: 700,
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                // mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    // child: TextFormField(
                    //   decoration: InputDecoration(
                    //     contentPadding: const EdgeInsets.all(20.0),
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(10.0),
                    //     ),
                    //     hintText: "Search Quran",
                    //   ),
                    // ),
                    child: AutocompleteBasicExample(),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      SearchShortCut(
                          onTap: (() {
                            Navigator.pushNamed(context, '/quran?surah=1');
                          }),
                          text: 'সুরাহ আল ফাতিহা'),
                      SearchShortCut(
                          onTap: (() {
                            Navigator.pushNamed(
                                context, '/quran?surah=2&&ayat=255');
                          }),
                          text: 'আয়াতুল কুরসি'),
                      SearchShortCut(
                          onTap: (() {
                            Navigator.pushNamed(context, '/quran?surah=36');
                          }),
                          text: 'সুরাহ আল ইয়াসিন'),
                      SearchShortCut(
                          onTap: (() {
                            Navigator.pushNamed(context, '/quran?surah=55');
                          }),
                          text: 'সুরাহ আর রাহমান'),
                      SearchShortCut(
                          onTap: (() {
                            Navigator.pushNamed(context, '/quran?surah=67');
                          }),
                          text: 'সুরাহ আল মুল্ক'),
                    ],
                  )
                ],
              ),
            )),
        Center(child: LayoutBuilder(builder: ((context, constraints) {
          if (constraints.maxWidth > 1010) {
            return LargeScreen();
          } else if (constraints.maxWidth > 710) {
            return MediumScreen();
          } else {
            return SmallScreen();
          }
        }))),
      ])),
    );
  }

  Widget LargeScreen() {
    return Container(
      width: 1000,
      child: GridView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          // return ListTile(
          //   leading: Text((index + 1).toString()),
          //   title: Text(Readable.QuranData[index]['name']),
          //   subtitle: Text(Readable.QuranData[index]['transliteration'] +
          //       ' (' +
          //       Readable.QuranData[index]['translation'] +
          //       ')'),
          //   onTap: () {
          //     Navigator.pushNamed(context, '/quran?surah=${index + 1}');
          //     // Navigator.push(
          //     //     context,
          //     //     MaterialPageRoute(
          //     //         builder: (context) => Surah(surahNumber: index + 1)));
          //   },
          // );
          return SurahCard(index: index);
        },
        itemCount: Readable.QuranData.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 3.5,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
      ),
    );
  }

  Widget MediumScreen() {
    return Container(
      width: 700,
      child: GridView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          // return ListTile(
          //   leading: Text((index + 1).toString()),
          //   title: Text(Readable.QuranData[index]['name']),
          //   subtitle: Text(Readable.QuranData[index]['transliteration'] +
          //       ' (' +
          //       Readable.QuranData[index]['translation'] +
          //       ')'),
          //   onTap: () {
          //     Navigator.pushNamed(context, '/quran?surah=${index + 1}');
          //     // Navigator.push(
          //     //     context,
          //     //     MaterialPageRoute(
          //     //         builder: (context) => Surah(surahNumber: index + 1)));
          //   },
          // );
          return SurahCard(index: index);
        },
        itemCount: Readable.QuranData.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3.5,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
      ),
    );
  }

  Widget SmallScreen() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: ListView.builder(
        shrinkWrap: true,

        itemBuilder: (context, index) {
          // return ListTile(
          //   leading: Text((index + 1).toString()),
          //   title: Text(Readable.QuranData[index]['name']),
          //   subtitle: Text(Readable.QuranData[index]['transliteration'] +
          //       ' (' +
          //       Readable.QuranData[index]['translation'] +
          //       ')'),
          //   onTap: () {
          //     Navigator.pushNamed(context, '/quran?surah=${index + 1}');
          //     // Navigator.push(
          //     //     context,
          //     //     MaterialPageRoute(
          //     //         builder: (context) => Surah(surahNumber: index + 1)));
          //   },
          // );
          return Padding(
            padding: const EdgeInsets.all(1.0),
            child: SurahCard(index: index),
          );
        },
        itemCount: Readable.QuranData.length,
        // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //   crossAxisCount: 1,
        //   childAspectRatio: 3.5,
        //   crossAxisSpacing: 5,
        //   mainAxisSpacing: 5,
        // ),
      ),
    );
  }
}

class AutocompleteBasicExample extends StatelessWidget {
  const AutocompleteBasicExample({Key? key}) : super(key: key);

  static final List<String> _kOptions = Readable.QuranData.map((surah) {
    debugPrint(surah['transliteration']);
    return surah['transliteration'];
  }).toList();

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return _kOptions.where((String option) {
          return option.contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (String selection) {
        debugPrint('You just selected $selection');
      },
    );
  }
}
