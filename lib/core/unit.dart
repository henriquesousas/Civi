class Unit {
  const Unit();

  // static const Unit instance = Unit._();

  @override
  bool operator ==(Object other) => other is Unit;

  @override
  int get hashCode => 0;

  @override
  String toString() => 'Unit()';
}
