import 'package:design_1/utils/scroll/default_behavior.dart';
import 'package:design_1/widgets/search_response_list_item.dart';
import 'package:flutter/material.dart';

class SearchreponseList extends StatelessWidget {
  const SearchreponseList({
    Key key,
    @required this.searchText,
    this.responseList,
    this.historyList,
  }) : super(key: key);

  final String searchText;
  final List<String> responseList;
  final List<String> historyList;

  @override
  Widget build(BuildContext context) {
    List<Widget> searchList = [];

    if (responseList != null) {
      searchList.addAll(responseList
          .map((text) => SearchResponseListItem(
                searchText: searchText,
                value: text,
              ))
          .toList());
    }
    if (historyList != null) {
      searchList.addAll(historyList
          .map((text) => SearchResponseListItem(
                searchText: searchText,
                value: text,
                history: true,
              ))
          .toList());
    }

    return ScrollConfiguration(
      behavior: DefaultBehavior(),
      child: ListView(
        children: searchList,
      ),
    );
  }
}
