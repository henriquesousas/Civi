class IncidentItem {
  final String distance;
  final String place;
  final String title;
  final String description;
  final String updatedAt;
  final String views;
  final String icon;

  IncidentItem({
    required this.distance,
    required this.place,
    required this.title,
    required this.description,
    required this.updatedAt,
    required this.views,
    required this.icon,
  });

  static final List<IncidentItem> incidents = [
    IncidentItem(
      distance: '4770.1 mi',
      place: 'Times Square - 42 St Station',
      title: 'Report of Man Armed With Knife at Times Square Station',
      description:
          'Police have received a report of a man possibly armed with a knife at Times Square Station on the northbound 1, 2, and 3 lines.',
      updatedAt: 'Updated 1h ago',
      views: '237 views',
      icon: '🔪',
    ),
    IncidentItem(
      distance: '4770.1 mi',
      place: 'Times Square-42 St Station',
      title: 'Person Dropped Phone on Train Tracks',
      description:
          'Transit staff responded after a passenger reported dropping a phone onto the tracks near the platform edge.',
      updatedAt: 'Updated 2h ago',
      views: '102 views',
      icon: '📱',
    ),
    IncidentItem(
      distance: '4771.0 mi',
      place: 'Garment District',
      title: 'Fire Reported Near Intersection',
      description:
          'Crews were dispatched to investigate smoke seen coming from a commercial building in the Garment District.',
      updatedAt: 'Updated 3h ago',
      views: '421 views',
      icon: '🔥',
    ),
    IncidentItem(
      distance: '4769.8 mi',
      place: 'Penn Station',
      title: 'Suspicious Activity Report',
      description:
          'Police are investigating suspicious behavior reported by commuters near an entrance to Penn Station.',
      updatedAt: 'Updated 4h ago',
      views: '188 views',
      icon: '⚠️',
    ),
  ];
}
