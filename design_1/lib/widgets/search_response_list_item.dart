import 'package:flutter/material.dart';

class SearchResponseListItem extends StatelessWidget {
  const SearchResponseListItem({
    Key key,
    @required this.searchText,
    @required this.value,
    bool history,
  })  : this.history = history ?? false,
        super(key: key);

  final String searchText;
  final String value;
  final bool history;

  List<TextSpan> _highliteText() {
    List<TextSpan> highliteText = [];

    var chk = value.toLowerCase().contains(searchText.toLowerCase());

    if (chk) {
      highliteText.add(
        TextSpan(
          text: value.substring(0, searchText.length),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      );
      highliteText.add(TextSpan(text: value.substring(searchText.length)));
    } else {
      highliteText.add(TextSpan(text: value));
    }

    return highliteText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.grey[300],
          ),
        ),
      ),
      child: Row(
        children: [
          // 히스토리 아이콘
          history
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Icon(
                    Icons.history,
                    color: Colors.grey[400],
                  ),
                )
              : Container(),
          RichText(
            text: TextSpan(
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
              ),
              children: _highliteText(),
            ),
          ),
        ],
      ),
    );
  }
}
