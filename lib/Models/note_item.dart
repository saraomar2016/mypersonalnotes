import 'dart:ui';

class NoteItem {
  final String title;
  final String description;
  final String time;
  final String date;
  final Color color;
  final Color accentColor;
  final bool isFavorite;

  const NoteItem({
    required this.title,
    required this.description,
    required this.time,
    required this.date,
    required this.color,
    required this.accentColor,
    this.isFavorite = false,
  });
}
