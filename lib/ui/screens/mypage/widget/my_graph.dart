class IndividualBar {
  final int x;
  final double y;

  IndividualBar({required this.x, required this.y});
}

class BarData {
  final double active;
  final double calm;
  final double creative;
  final double people;

  BarData({
    required this.active,
    required this.calm,
    required this.creative,
    required this.people,
  });
  List<IndividualBar> barData = [];

  //initialize bar Data
  void initializeBarData() {
    barData = [
      IndividualBar(x: 0, y: active),
      IndividualBar(x: 1, y: calm),
      IndividualBar(x: 2, y: creative),
      IndividualBar(x: 3, y: people),
    ];
  }
}
