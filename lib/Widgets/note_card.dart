import 'package:flutter/material.dart';
import 'package:mypersonalnotes/Models/note_item.dart';

class NoteCard extends StatelessWidget {
  final NoteItem note;

  const NoteCard({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 96),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: note.color,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          Container(
            width: 5,
            height: 54,
            decoration: BoxDecoration(
              color: note.accentColor,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  note.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF201B3D),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  note.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    height: 1.3,
                    color: Color(0xFF6F6686),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      size: 14,
                      color: note.accentColor,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      note.date,
                      style: const TextStyle(
                        fontSize: 11.5,
                        color: Color(0xFF7D748E),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                note.time,
                style: const TextStyle(
                  fontSize: 11.5,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF7D748E),
                ),
              ),
              const SizedBox(height: 16),
              Icon(
                note.isFavorite ? Icons.star_rounded : Icons.more_vert_rounded,
                color: note.isFavorite
                    ? const Color(0xFFFFB84D)
                    : const Color(0xFF8A7FA8),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
