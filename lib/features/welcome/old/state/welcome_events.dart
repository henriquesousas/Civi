class WelcomeEvents {}

class PageChangedEvent extends WelcomeEvents {
  final int newPage;
  PageChangedEvent(this.newPage);
}
