class FaqEvent {}

class FaqChangedEvent extends FaqEvent {
  final int index;
  final bool isExpanded;

  FaqChangedEvent(this.index, this.isExpanded);
}
