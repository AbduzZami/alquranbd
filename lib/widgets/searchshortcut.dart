import 'package:flutter/material.dart';

class SearchShortCut extends StatefulWidget {
  final void Function() onTap;
  final String text;
  const SearchShortCut({Key? key, required this.onTap, required this.text})
      : super(key: key);

  @override
  State<SearchShortCut> createState() => _SearchShortCutState();
}

class _SearchShortCutState extends State<SearchShortCut> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(10.0)),
        child: Text(widget.text),
      ),
    );
  }
}
