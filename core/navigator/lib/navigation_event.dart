import 'package:navigator/navigation_types.dart';

abstract class NavigationEvent {}

class NavigateToHome extends NavigationEvent {}

class NavigateToLogin extends NavigationEvent {}

class NavigateToRoute extends NavigationEvent {
  final String route;
  final NavigationTypes navigationType;

  NavigateToRoute(this.route, this.navigationType);
}
