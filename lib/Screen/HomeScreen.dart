import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/Widget/Portfolio.dart';
import 'package:flutter_bloc_example/bloc/navbarbloc_bloc.dart';
import 'package:flutter/material.dart';
import 'Footer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var isOpa = false;
  var isClick = false;
  var isClick2 = false;
  var showButtons = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        isOpa = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: deviceSize.width,
              height: deviceSize.height,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'lib/asset/newback.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 150,
                    right: 90,
                    width: 250,
                    child: Column(
                      children: [
                        AnimatedContainer(
                          height: isClick ? 110 : 0,
                          color: Colors.white,
                          width: 2,
                          duration: Duration(seconds: 1),
                        ),
                        AnimatedContainer(
                          height: 2,
                          color: Colors.white,
                          width: isClick2 ? 310 : 0,
                          duration: Duration(seconds: 1),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 105,
                    top: 270,
                    child: AnimatedOpacity(
                      opacity: showButtons ? 1.0 : 0.0,
                      duration: Duration(seconds: 1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              BlocProvider.of<NavbarblocBloc>(context)
                                  .add(NavabarblocEvent1());
                            },
                            child: Text('1'),
                          ),
                          TextButton(
                            onPressed: () {
                              BlocProvider.of<NavbarblocBloc>(context)
                                  .add(NavabarblocEvent2());
                            },
                            child: Text('2'),
                          ),
                          TextButton(
                            onPressed: () {
                              BlocProvider.of<NavbarblocBloc>(context)
                                  .add(NavabarblocEvent3());
                            },
                            child: Text('3'),
                          ),
                          TextButton(
                            onPressed: () {
                              BlocProvider.of<NavbarblocBloc>(context)
                                  .add(NavabarblocEvent4());
                            },
                            child: Text('4'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 120,
                    width: deviceSize.width / 3,
                    right: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AnimatedOpacity(
                          duration: Duration(seconds: 1),
                          opacity: isOpa ? 1.0 : 0.0,
                          child: TextButton(
                            child: Text('About Me'),
                            onPressed: () {
                              setState(() {
                                showButtons = false;
                                isClick2 = false;
                                isClick = false;
                              });
                              BlocProvider.of<NavbarblocBloc>(context)
                                  .add(NavabarblocEventShowAboutMe());
                            },
                          ),
                        ),
                        AnimatedOpacity(
                          duration: Duration(seconds: 1),
                          opacity: isOpa ? 1.0 : 0.0,
                          child: TextButton(
                            child: Text('Portfolio'),
                            onPressed: () {
                              setState(() {
                                isClick = true;
                              });
                              Future.delayed(Duration(seconds: 1), () {
                                setState(() {
                                  isClick2 = true;
                                });
                              });
                              Future.delayed(Duration(seconds: 1), () {
                                setState(() {
                                  showButtons = true;
                                });
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 80,
                    left: 80,
                    height: deviceSize.height / 3 + 80,
                    child: Card(
                      color: Colors.black26,
                      child: BlocBuilder<NavbarblocBloc, NavbarblocState>(
                        builder: (ctx, state) {
                          if (state is NavbarblocState1) {
                            return Portfolio(
                              descriptions: [
                                'Movie App',
                                'StateManagment : BLoC Pattern with RxDart',
                                'JsonDecoding : Serializing JSON inside model classes',
                                'Features : Caching, RestApi, Sqflite',
                              ],
                              images: [
                                'https://user-images.githubusercontent.com/79679398/109254821-055d3c80-7808-11eb-9ebd-a278cce5d1c5.jpg',
                                'https://user-images.githubusercontent.com/79679398/109254878-2756bf00-7808-11eb-8e65-a5224f36f10a.jpg',
                                'https://user-images.githubusercontent.com/79679398/109254881-29208280-7808-11eb-8c2d-d7fed13ab484.jpg',
                                'https://user-images.githubusercontent.com/79679398/109254884-2a51af80-7808-11eb-935f-9fd20ac10f48.jpg',
                                'https://user-images.githubusercontent.com/79679398/109254886-2aea4600-7808-11eb-93ba-117d57da56da.jpg',
                                'https://user-images.githubusercontent.com/79679398/109254887-2b82dc80-7808-11eb-90ce-43f08516667a.jpg'
                              ],
                            );
                          } else if (state is NavbarblocState2) {
                            return Portfolio(
                              descriptions: [
                                'WeatherAppFlutter',
                                'StateManagment : BLoC Pattern with RxDart',
                                'JsonDecoding : Serializing JSON using code generation libraries',
                                'Features : Location, Rest APi',
                              ],
                              images: [
                                'https://user-images.githubusercontent.com/79679398/109419108-01384700-79e1-11eb-9567-aad345f45917.gif',
                              ],
                            );
                          } else if (state is NavbarblocState3) {
                            return Portfolio(
                              descriptions: [
                                'News App Flutter',
                                'StateManagment : Provider',
                                'JsonDecoding : Serializing JSON inline',
                                'Features : Localization, Sqflite, Push Notification, RestApi',
                              ],
                              images: [
                                'https://user-images.githubusercontent.com/79679398/109267508-e918ca00-781e-11eb-9434-fae693e67026.jpg',
                                'https://user-images.githubusercontent.com/79679398/109267507-e8803380-781e-11eb-826a-15ed43c92077.jpg',
                                'https://user-images.githubusercontent.com/79679398/109267501-e6b67000-781e-11eb-8b73-f28801e43380.jpg',
                                'https://user-images.githubusercontent.com/79679398/109267511-e9b16080-781e-11eb-9391-27122ecc3f30.jpg',
                              ],
                            );
                          } else if (state is NavbarblocState4) {
                            return Portfolio(
                              descriptions: [
                                'Game App',
                                'StateManagment : BLoC Pattern with RxDart',
                                'JsonDecoding : Serializing JSON using code generation libraries',
                                'Dependency Injection : get_it',
                                'Features : Authentication, DarkMode, Favorites, Lottie Animation',
                                'Save & retrieve Favorites with FireBase RTDB',
                                'Authentication using FireBase Rest APi',
                                'Auto Login User With SharedPreferences',
                              ],
                              images: [
                                'https://user-images.githubusercontent.com/79679398/110239254-461d2a00-7f5b-11eb-9787-3013f9954275.jpg',
                                'https://user-images.githubusercontent.com/79679398/110239256-47e6ed80-7f5b-11eb-8aae-e3923d45f971.jpg',
                                'https://user-images.githubusercontent.com/79679398/110239257-487f8400-7f5b-11eb-8360-d950cef46513.jpg',
                                'https://user-images.githubusercontent.com/79679398/110239259-487f8400-7f5b-11eb-8d8e-6a44ecb719c3.jpg',
                                'https://user-images.githubusercontent.com/79679398/110239260-49b0b100-7f5b-11eb-86d7-bcf5a3d3e017.jpg',
                                'https://user-images.githubusercontent.com/79679398/110239261-49b0b100-7f5b-11eb-9e91-d50d5fceabaf.jpg',
                                'https://user-images.githubusercontent.com/79679398/110239262-4a494780-7f5b-11eb-8cb9-81f77d0b2d87.jpg',
                                'https://user-images.githubusercontent.com/79679398/110239445-1cb0ce00-7f5c-11eb-8ca9-42a48331f106.jpg',
                              ],
                            );
                          } else if (state is NavbarblocStateShowAboutMe) {
                            return Footer();
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
