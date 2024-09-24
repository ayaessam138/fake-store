import 'package:flutter/material.dart';
import 'package:uitraning/Core/widghts/Apabtivelayout.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: (BuildContext context) {
        return SizedBox();
      },
      tabletLayout: (BuildContext context) {

        return SizedBox();
      },
      desktopLayout: (BuildContext context) {
        return SizedBox();
      },
    );
  }
}
