import 'package:flutter/material.dart';

class NavX {
  final BuildContext context;
  NavX(this.context);

  Offset begin(String d) {
    if (d.contains('up')) {
      return const Offset(0.0, 1.0);
    } else if (d.contains('aside')) {
      return const Offset(1.0, 0.0);
    } else {
      return const Offset(1.0, 0.0);
    }
  }

  Offset end(String d) {
    if (d.contains('up')) {
      return const Offset(0.0, 0.0);
    } else if (d.contains('aside')) {
      return const Offset(0.0, 0.0);
    } else {
      return Offset.zero;
    }
  }

  to(Widget page,
      [NavXTransition? transition, int? duration, String? direction]) {
    transition == null
        ? Navigator.push(context, MaterialPageRoute(builder: (context) => page))
        : Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => page,
              transitionsBuilder: (c, anim, a2, child) {
                if (transition.transition!.toLowerCase().contains('slide')) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: begin(transition.transition!.toLowerCase()),
                      end: end(transition.transition!.toLowerCase()),
                    ).animate(anim),
                    child: child,
                  );
                } else if (transition.transition!
                    .toLowerCase()
                    .contains('fade')) {
                  return FadeTransition(
                    opacity: anim,
                    child: child,
                  );
                } else {
                  return child;
                }
              },
              transitionDuration: duration != null
                  ? Duration(milliseconds: duration)
                  : const Duration(milliseconds: 500),
            ),
          );
  }

  toEnd(Widget page, [NavXTransition? transition, int? duration]) {
    transition == null
        ? Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) => page), (route) => false)
        : Navigator.of(context).pushAndRemoveUntil(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => page,
              transitionsBuilder: (c, anim, a2, child) {
                if (transition.transition!.toLowerCase().contains('slide')) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: begin(transition.transition!.toLowerCase()),
                      end: end(transition.transition!.toLowerCase()),
                    ).animate(anim),
                    child: child,
                  );
                } else if (transition.transition!
                    .toLowerCase()
                    .contains('fade')) {
                  return FadeTransition(
                    opacity: anim,
                    child: child,
                  );
                } else {
                  return child;
                }
              },
              transitionDuration: duration != null
                  ? Duration(milliseconds: duration)
                  : const Duration(milliseconds: 500),
            ),
            (Route<dynamic> route) => false);
  }

  back() {
    Navigator.pop(context);
  }
}

class NavXTransition {
  String? transition;
  static NavXTransition slideAside() {
    NavXTransition navXTransition = NavXTransition();
    navXTransition.transition = "slideaside";
    return navXTransition;
  }

  static NavXTransition slideUp() {
    NavXTransition navXTransition = NavXTransition();
    navXTransition.transition = "slideup";
    return navXTransition;
  }

  static NavXTransition fade() {
    NavXTransition navXTransition = NavXTransition();
    navXTransition.transition = "fade";
    return navXTransition;
  }
}
