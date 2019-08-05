import 'package:flutter/material.dart';

class HomePageRoute<T> extends MaterialPageRoute<T> {
  final String currentTab;
  final String newTab;
  final Widget child;

  HomePageRoute(this.currentTab, this.newTab, this.child) : super(builder: (BuildContext context) => child);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    if (currentTab == null) {
      // First scene of the nested Navigator, use the theme
      return super.buildTransitions(context, animation, secondaryAnimation, child);
    }

    Offset startPosition;
    switch ('$currentTab-->$newTab') {
      case '/-->/tvshow':
      case '/-->/movie':
      case '/tvshow-->/movie':
        // If the button is on the right in the tab bar, the scene will come from the bottom
        startPosition = Offset(0.0, 1.0);
        break;
      case '/tvshow-->/':
      case '/movie-->/':
      case '/movie-->/tvshow':
        // If the button is on the left in the tab bar, the scene will come from the top
        startPosition = Offset(0.0, -1.0);
        break;
      default:
        startPosition = Offset.zero;
    }

    return SlideTransition(
      position: Tween<Offset>(
        begin: startPosition,
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }
}
