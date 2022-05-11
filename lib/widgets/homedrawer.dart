import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Text(
                  'আল কুরআন',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColorDark,
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: (() {
                    Navigator.pop(context);
                  }),
                  child: Icon(
                    Icons.close,
                    color: Theme.of(context).primaryColorDark,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          Column(
            children: [
              Text('ডেভেলপার'),
              SizedBox(height: 10),
              Text(
                'আব্দুজ জামি',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text('Founder & CEO'),
              SizedBox(height: 2),
              InkWell(
                onTap: () {
                  launchUrl(Uri.parse('https://niharon.com'));
                },
                child: Text(
                  'Niharon Technologies',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Wrap(alignment: WrapAlignment.center, spacing: 10, children: [
                InkWell(
                    onTap: () {
                      launchUrl(Uri.parse('https://facebook.com/abduzzami'));
                    },
                    child: FaIcon(
                      FontAwesomeIcons.facebook,
                      color: Theme.of(context).primaryColorDark,
                    )),
                InkWell(
                    onTap: () {
                      launchUrl(Uri.parse('https://linkedin.com/in/abduzzami'));
                    },
                    child: FaIcon(
                      FontAwesomeIcons.linkedin,
                      color: Theme.of(context).primaryColorDark,
                    )),
                InkWell(
                    onTap: () {
                      launchUrl(Uri.parse('https://github.com/AbduzZami'));
                    },
                    child: FaIcon(
                      FontAwesomeIcons.github,
                      color: Theme.of(context).primaryColorDark,
                    )),
              ]),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SelectableText(
                  'Link to third party resources used in this website',
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextButton(
                    onPressed: () {
                      launchUrl(Uri.parse(
                          'https://www.npmjs.com/package/quran-json'));
                    },
                    child: Text(
                      'Quran with Bangla translation Json File',
                      textAlign: TextAlign.center,
                    )),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextButton(
                    onPressed: () {
                      launchUrl(Uri.parse('https://alquran.cloud/api'));
                    },
                    child: Text(
                      'Quran recitation of Mishary bin Rashid Alafasy',
                      textAlign: TextAlign.center,
                    )),
              ),
              SizedBox(height: 20),
            ],
          )
        ],
      ),
    );
  }
}
