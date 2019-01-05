import 'package:flutter/material.dart';
import 'package:gdm/src/ui/home_page.dart';
import 'package:gdm/src/utility/route_observer.dart';


class GdmApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GdmHome(),
      navigatorObservers: [routeObserver],
    );
  }
}


