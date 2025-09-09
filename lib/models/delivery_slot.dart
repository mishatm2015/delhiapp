class DeliverySlot {
  final String id;
  final String date;
  final String day;
  final String timeRange;
  final bool isSelected;

  DeliverySlot({
    required this.id,
    required this.date,
    required this.day,
    required this.timeRange,
    this.isSelected = false,
  });

  DeliverySlot copyWith({
    String? id,
    String? date,
    String? day,
    String? timeRange,
    bool? isSelected,
  }) {
    return DeliverySlot(
      id: id ?? this.id,
      date: date ?? this.date,
      day: day ?? this.day,
      timeRange: timeRange ?? this.timeRange,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
