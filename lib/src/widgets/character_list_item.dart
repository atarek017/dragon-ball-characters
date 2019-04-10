import 'package:flutter/material.dart';

class CharacterListItem extends StatelessWidget {
  final String avatar;
  final String title;
  final String description;
  final int color;
  final double resizeFactor;

  CharacterListItem(
      {@required this.avatar,
      @required this.title,
      @required this.description,
      @required this.color,
      this.resizeFactor});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.4;
    double width = MediaQuery.of(context).size.width * 0.85;
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
          width: width * resizeFactor,
          height: height * resizeFactor,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                top: height / 4,
                bottom: 0,
                child: Hero(
                  tag: "background_${title}",
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                            Color(color),
                            Colors.white,
                          ],
                              stops: [
                            0.4,
                            1.0,
                          ])),
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        margin: EdgeInsets.only(
                          left: 20,
                          bottom: 10,
                        ),
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 24 * resizeFactor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Hero(
                  tag: "image_${title}",
                  child: Image.asset(
                    avatar,
                    width: width / 2,
                    height: height,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
