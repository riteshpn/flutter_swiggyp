import 'package:flutter/material.dart';

class Search1 extends SearchDelegate {
  List<String> data_Rest_Food = [
    "Chicken curry, Fish fry,Tandori chicken, Chicken masala,Butter Chicken"
  ];
  List<String> recent_Search = ['Chicken', ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query != null && data_Rest_Food.contains(query.toLowerCase())) {
      return ListTile(
        title: Text(query),
      );
    } else if (query == "") {
      return Text("");
    } else {
      return ListTile(
        title: Text("No result found"),
        onTap: () {},
      );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return ListView.builder(
      itemCount: recent_Search.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(recent_Search[index]),
          trailing: CircleAvatar(),
        );
      },
    );
  }
}
