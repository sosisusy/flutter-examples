import 'package:design_1/widgets/search_response_list.dart';
import 'package:design_1/widgets/search_text_field.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _controller;
  final List<String> responseList = [
    "Lipgloss",
    "Lipstick",
    "Lipgloss",
    "Lipgloss",
    "LipgLipLip",
  ];
  final List<String> historyList = [
    "Counter",
    "Eyeshadow",
    "Lipgloss",
    "Lip Primer",
  ];

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: SearchTextField(
                controller: _controller,
                onChanged: (value) {
                  setState(() {});
                },
                backgroundColor: Colors.white,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SearchreponseList(
                  searchText: _controller.text,
                  responseList: responseList,
                  historyList: historyList,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
