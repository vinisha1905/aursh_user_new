import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchInputWidget extends StatefulWidget {
  final String hint;
  final Function(String text) onTextChanged;

  SearchInputWidget(this.hint, this.onTextChanged);

  @override
  SearchInputWidgetState createState() {
    return SearchInputWidgetState();
  }
}

class SearchInputWidgetState extends State<SearchInputWidget> {
  late Timer _timer;
  late TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      widget.onTextChanged(_textEditingController.text.trim());
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      width: double.infinity,
      height: 70,
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 16),
                  child: Icon(Icons.arrow_back_rounded,
                      color: Colors.black54, size: 20),
                )),
            Expanded(
                child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                  hintText: widget.hint),
              style: TextStyle(fontSize: 14, color: Colors.grey),
            )),
            SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
