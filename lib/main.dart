import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

import 'bitcoin_list.dart';
import 'constants.dart';
import 'constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Portfolio",
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: Theme.of(context).copyWith(
        platform: TargetPlatform.android,
        scaffoldBackgroundColor: kWhiteColor,
        primaryColor: kBlueColor,
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget),
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(450, name: MOBILE),
          ResponsiveBreakpoint.resize(800, name: TABLET),
          ResponsiveBreakpoint.resize(1000, name: TABLET),
          ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          ResponsiveBreakpoint.resize(2460, name: "4K"),
        ],
        background: Scaffold(),
        // background: Scaffold(
        //   body: Container(
        //       // color: kBlackColor,
        //       ),
        // ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: ScreenHelper(
          mobile: _buildUi(MediaQuery.of(context).size.width * .9),
        ),
      ),
    );
  }

  Widget _buildUi(double width) {
    return Container(
        child: ResponsiveWrapper(
            maxWidth: width,
            minWidth: width,
            defaultScale: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LayoutBuilder(builder: (context, constraints) {
                  return Container(
                      child: Wrap(
                    runSpacing: 20.0,
                    children: bitcoinList
                        .map(
                          (bitcoin) => GestureDetector(
                            child: Container(
                              // color: Colors.red,
                              width: constraints.maxWidth,
                              height: 100.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0.0, 1.0), //(x,y)
                                    blurRadius: 6.0,
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Row(children: [
                                      Container(
                                        height: 60.0,
                                        width: 60.0,
                                        decoration: BoxDecoration(
                                          color: bitcoin.color,
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            bitcoin.imagePath,
                                            width: 50.0,
                                            height: 50.0,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 20.0),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(bitcoin.btcone,
                                              style: GoogleFonts.oswald(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w700,
                                                color: kBlackColor,
                                                decoration: TextDecoration.none,
                                              )),
                                          SizedBox(height: 5.0),
                                          Text(
                                            bitcoin.btcsec,
                                            style: TextStyle(
                                              color: kBlackColor,
                                              height: 1.5,
                                              fontSize: 16.0,
                                              decoration: TextDecoration.none,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ]),
                                  ),
                                  SizedBox(width: 45.0),
                                  Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          bitcoin.dollor,
                                          style: TextStyle(
                                            color: kBlackColor,
                                            fontSize: 18.0,
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                        SizedBox(height: 1.0),
                                        Text(
                                          bitcoin.percentage,
                                          style: TextStyle(
                                            color: bitcoin.textcolor,
                                            fontSize: 16.0,
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ));
                })
              ],
            )));
  }
}

class ScreenHelper extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  ScreenHelper({Key key, this.mobile, this.tablet, this.desktop})
      : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 800.0;
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 800.0 &&
      MediaQuery.of(context).size.width < 1200.0;
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth >= 1200.0) {
        return desktop;
      } else if (constraints.maxWidth >= 800 && constraints.maxWidth < 1200.0) {
        return desktop;
      } else {
        return mobile;
      }
    });
  }
}
