class HistoryItem {
  String date;
  String time;
  String location;
  double price;
  String drinkName;
  String drinkImage;

  HistoryItem({
    required this.date,
    required this.time,
    required this.drinkName,
    required this.price,
    required this.location,
    required this.drinkImage,
  });
}