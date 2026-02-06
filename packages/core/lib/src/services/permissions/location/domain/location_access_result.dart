enum LocationAccessIssue {
  serviceDisabled,
  denied,
  deniedPermanently,
}

class LocationAccessResult {
  final bool isGranted;
  final LocationAccessIssue? issue;

  const LocationAccessResult._(this.isGranted, this.issue);

  const LocationAccessResult.granted() : this._(true, null);

  const LocationAccessResult.failed(LocationAccessIssue issue)
      : this._(false, issue);
}
