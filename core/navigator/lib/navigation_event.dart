import 'package:navigator/navigation_types.dart';

abstract class NavigationEvent {}

class NavigateToMain extends NavigationEvent {}

class NavigateToLogin extends NavigationEvent {}

class NavigateToRoute extends NavigationEvent {
  final String route;
  final NavigationType navigationType;

  NavigateToRoute(this.route, this.navigationType);
}
