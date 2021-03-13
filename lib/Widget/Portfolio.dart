import 'package:flutter/material.dart';

class Portfolio extends StatelessWidget {
  final List<String> images;
  final List<String> descriptions;
  Portfolio({this.images, this.descriptions});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [...descriptions.map((e) => Texts(e)).toList()],
          ),
        ),
        Expanded(
          flex: 1,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            itemBuilder: (ctx, i) => GridTile(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      Color(0xff3d5afe).withOpacity(0.2), BlendMode.lighten),
                  child: Image.network(
                    images[i],
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Texts extends StatelessWidget {
  final String text;
  Texts(this.text);
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
