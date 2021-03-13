import 'package:flutter/material.dart';

import 'dart:html' as html;

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black26,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                  child: Text(
                    'Hi, I`m ',
                    style: TextStyle(
                        color: Theme.of(context).accentColor, fontSize: 45),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                FittedBox(
                  child: Text(
                    'Mohammad Molaei',
                    style: TextStyle(
                        color: Theme.of(context).accentColor, fontSize: 45),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                FittedBox(
                  child: Text(
                    'I`M Flutter Developer',
                    style: TextStyle(
                        color: Theme.of(context).accentColor, fontSize: 45),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                FittedBox(
                  child: Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: Image.asset(
                            'lib/asset/insta.png',
                            color: Theme.of(context).accentColor,
                          ),
                          onPressed: () {
                            html.window.location.href =
                                "https://www.google.com";
                          },
                          iconSize: 75,
                        ),
                        IconButton(
                          iconSize: 75,
                          icon: Image.asset(
                            'lib/asset/github.png',
                            color: Theme.of(context).accentColor,
                            fit: BoxFit.cover,
                          ),
                          onPressed: () {
                            html.window.location.href =
                                "https://www.google.com";
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
          Expanded(
            child: CircleAvatar(
              radius: 160,
              backgroundImage: AssetImage('lib/asset/me.jpg'),
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }
}
