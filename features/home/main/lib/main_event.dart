abstract class MainScreenEvent {}

class ChangeTab extends MainScreenEvent {
  final int index;

  ChangeTab(this.index);
}
