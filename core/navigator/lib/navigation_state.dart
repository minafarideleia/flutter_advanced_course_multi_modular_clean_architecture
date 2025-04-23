import 'package:navigator/navigation_types.dart';

class NavigationState {
  final String route;
  final NavigationType navigationType;

  NavigationState(this.route, this.navigationType);
}
