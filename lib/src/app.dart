import 'package:animation_list/src/screens/list_page.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'scoped_model/list_item_scoped_model.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<ListItemScopedModel>(
        model: ListItemScopedModel(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Influencer recommender',
          theme: ThemeData(
              primaryColor: Color(0xff15A8F6),
              primaryColorDark: Color(0xff1FA6D1),
              primaryColorLight: Color(0xff15D3EF),
              primaryColorBrightness: Brightness.light),
          home: ListPage(),
        ));
  }
}
