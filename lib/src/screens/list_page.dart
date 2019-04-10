import 'package:animation_list/src/models/list_details.dart';
import 'package:animation_list/src/screens/detailPage.dart';
import 'package:animation_list/src/widgets/character_list_item.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped_model/list_item_scoped_model.dart';

class ListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListPageState();
  }
}

class _ListPageState extends State<ListPage> {
  PageController _controller;

  _pageListener() {
    setState(() {});
  }

  @override
  void initState() {
    _controller = PageController(viewportFraction: 0.6);
    _controller.addListener(_pageListener);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_pageListener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedModelDescendant<ListItemScopedModel>(
        builder:
            (BuildContext context, Widget child, ListItemScopedModel model) {
          return PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: model.character.length,
            controller: _controller,
            itemBuilder: (context, index) {
              double currentPage = 0;
              try {
                currentPage = _controller.page;
              } catch (_) {}

              final resizeFactor =
                  (1 - (((currentPage - index).abs() * 0.3).clamp(0.0, 1.0)));

              return InkWell(
                child: CharacterListItem(
                  avatar: model.character[index].avatar,
                  title: model.character[index].title,
                  description: model.character[index].description,
                  color: model.character[index].color,
                  resizeFactor: resizeFactor,
                ),
                onTap: () {
                  model.selectCharacter(index);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(
                            character: model.activeCharacter,
                          ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
