class NotificationAlert {
  final String time;
  final String title;
  final String description;
  final String? image;

  NotificationAlert({
    required this.time,
    required this.title,
    required this.description,
    this.image,
  });

  static List<NotificationAlert> getFakeNotification() {
    return [
      NotificationAlert(
        time: '4 days',
        title: 'Offset Shooter At Large',
        description:
            'The FBI has released photos of suspects who attempted to rob the rapper before shooting him in the leg outside a Florida casino on April 6.',
      ),
      NotificationAlert(
        time: '5 days',
        title: 'One Dead in Airport Shooting',
        description:
            'A juvenile victim was hurt and the suspect is dead after gunfire inside the terminal at Elko Regional Airport in Nevada this afternoon.',
      ),
      NotificationAlert(
        time: '6 days',
        title: '🐐 Un-baaa-lievable Goats',
        description:
            'A large herd of goats was seen running along an LA County hillside and into the road after briefly escaping containment.',
        image:
            'https://images.unsplash.com/photo-1500595046743-cd271d694d30?q=80&w=300',
      ),
      NotificationAlert(
        time: '6 days',
        title: 'Shooting at NJ Chick-fil-A',
        description:
            'One person was killed and six others hurt in last night\'s shooting at a Chick-fil-A in Union, New Jersey.',
      ),
      NotificationAlert(
        time: '8 days',
        title: '🚀 Historic Mission Concludes',
        description:
            'The astronauts have returned home after traveling farther from Earth than anyone in human history.',
        image:
            'https://images.unsplash.com/photo-1446776811953-b23d57bd21aa?q=80&w=300',
      ),
    ];
  }
}
