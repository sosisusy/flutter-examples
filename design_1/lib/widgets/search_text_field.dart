import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key key,
    this.controller,
    this.margin,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.onEditingComplete,
  }) : super(key: key);

  final TextEditingController controller;
  final EdgeInsets margin;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSubmitted;
  final GestureTapCallback onTap;
  final VoidCallback onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xfff6f6f6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller ?? null,
              onChanged: onChanged ?? null,
              onSubmitted: onSubmitted ?? null,
              onTap: onTap ?? null,
              onEditingComplete: onEditingComplete ?? null,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 0,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                hintText: "Search",
              ),
              style: TextStyle(fontSize: 17),
              textInputAction: TextInputAction.search,
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.search,
              size: 30,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
