<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

sk_utils contains NavX class that helps you to easily navigate to other pages without writing long boilerplate code.It also adds transitions including slide and fade and you can also add custom duration as per your need.

```dart
NavX(context).to(const Second(), NavXTransition.slideUp(), 1000); //slides up

NavX(context).to(const Second(), NavXTransition.slideAside(), 1000); //slides aside

NavX(context).to(const Second(), NavXTransition.fade(), 1000); //fades

NavX(context).toEnd(const Second(), NavXTransition.slideUp(), 1000); //slides up and remove all previous routes

NavX(context).toEnd(const Second(), NavXTransition.slideAside(), 1000);//slides aside and remove all previous routes

NavX(context).toEnd(const Second(), NavXTransition.fade(), 1000); //fades and remove all previous routes

NavX.back(context); //goes back

NavX(context).to(const Second());

NavX(context).toEnd(const Second())
```