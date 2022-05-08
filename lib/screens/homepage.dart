import 'package:alquranbd/readable.dart';
import 'package:alquranbd/widgets/homedrawer.dart';
import 'package:alquranbd/widgets/searchshortcut.dart';
import 'package:alquranbd/widgets/surahcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

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
                    child: AutocompleteBasicUserExample(),
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
        Text('সুরাহ সমূহ',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColorDark)),
        Container(
          margin: EdgeInsets.all(4),
          height: 3,
          width: 80,
          color: Theme.of(context).primaryColor,
        ),
        SizedBox(
          height: 20,
        ),
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

@immutable
class SearchObject {
  SearchObject({
    required this.title,
    required this.id,
    this.isayatsurah,
    this.isayatsurahid,
  });

  final String title;
  final int id;
  String? isayatsurah;
  int? isayatsurahid;

  @override
  String toString() {
    return '$title, $id';
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is SearchObject && other.title == title && other.id == id;
  }

  @override
  int get hashCode => hashValues(title, id);
}

class AutocompleteBasicUserExample extends StatelessWidget {
  const AutocompleteBasicUserExample({Key? key}) : super(key: key);

  // static const List<SearchObject> _userOptions = <SearchObject>[
  //   SearchObject(surahname: 'Alice', surahnumber: 1),
  //   SearchObject(surahname: 'Bob', surahnumber: 2),
  //   SearchObject(surahname: 'Charlie', surahnumber: 3),
  // ];
  static final List searcHMap = Readable.QuranData as List;
  static final List<SearchObject> _userOptions = searcHMap.map((e) {
    return SearchObject(title: e['transliteration'], id: e['id']);
  }).toList()
    ..add(SearchObject(
        title: 'Ayatul Kursi',
        id: 255,
        isayatsurah: 'Al-Baqarah',
        isayatsurahid: 2));

  static String _displayStringForOption(SearchObject option) => option.title;

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder _inputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Theme.of(context).primaryColor),
    );
    OutlineInputBorder _inputFocusBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 3.0),
    );
    return TypeAheadField(
      noItemsFoundBuilder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'এই নামে কিছু পাওয়া যায়নি',
            textAlign: TextAlign.center,
            style: TextStyle(color: Theme.of(context).disabledColor),
          ),
        );
      },
      minCharsForSuggestions: 1,
      textFieldConfiguration: TextFieldConfiguration(
          decoration: InputDecoration(
              labelText: 'খোঁজ করুন',
              labelStyle: TextStyle(color: Theme.of(context).primaryColorDark),
              hintText: 'ex: Al-Fatihah, Ayatul Kursi',
              hintStyle: TextStyle(color: Colors.grey),
              border: _inputBorder,
              focusedBorder: _inputFocusBorder)),
      suggestionsCallback: (pattern) {
        // return CitiesService.getSuggestions(pattern);
        return _userOptions.where((element) => element.title
            .toLowerCase()
            .trim()
            .replaceAll(' ', '')
            .replaceAll('-', '')
            .contains(pattern
                .toLowerCase()
                .trim()
                .replaceAll(' ', '')
                .replaceAll('-', '')));
      },
      itemBuilder: (context, SearchObject suggestion) {
        return ListTile(
          leading: Icon(
            Icons.read_more,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(suggestion.title),
          subtitle: Text((suggestion.isayatsurah == null)
              ? suggestion.id.toString()
              : suggestion.isayatsurah!),
        );
      },
      onSuggestionSelected: (SearchObject suggestion) {
        print(suggestion);
        if (suggestion.isayatsurah == null &&
            suggestion.isayatsurahid == null) {
          Navigator.pushNamed(context, '/quran?surah=${suggestion.id}');
        } else {
          Navigator.pushNamed(context,
              '/quran?surah=${suggestion.isayatsurahid}&&ayat=${suggestion.id}');
        }
      },
    );
  }
}
