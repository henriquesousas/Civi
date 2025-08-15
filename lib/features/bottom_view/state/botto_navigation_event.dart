abstract class BottomNavigationEvent {}

class ChangePageEvent extends BottomNavigationEvent {
  final int index;
  ChangePageEvent(this.index);
}
