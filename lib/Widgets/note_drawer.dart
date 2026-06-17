import 'package:flutter/material.dart';
import 'package:mypersonalnotes/Widgets/drawer_item.dart';
import 'package:mypersonalnotes/Widgets/small_circle_button.dart';

class NoteAuraDrawer extends StatelessWidget {
  final String email;
  final String name;
  final String? photoUrl;
  final VoidCallback onLogout;

  const NoteAuraDrawer({super.key, 
    required this.email,
    required this.name,
    required this.photoUrl,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 290,
      backgroundColor: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.fromLTRB(14, 45, 0, 45),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFFF8F7FF),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(34),
            bottomRight: Radius.circular(34),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.16),
              blurRadius: 30,
              offset: const Offset(8, 12),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: SmallCircleButton(
                icon: Icons.close_rounded,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),

            const SizedBox(height: 18),

            Container(
              width: 78,
              height: 78,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFFF42B3),
                    Color(0xFF6C35FF),
                    Color(0xFF1599FF),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFFF42B3).withOpacity(0.25),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(3),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage:
                    photoUrl != null ? NetworkImage(photoUrl!) : null,
                child: photoUrl == null
                    ? const Icon(
                        Icons.person_rounded,
                        size: 40,
                        color: Color(0xFF7B4DFF),
                      )
                    : null,
              ),
            ),

            const SizedBox(height: 16),

            Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Color(0xFF201B3D),
              ),
            ),

            const SizedBox(height: 6),

            Text(
              email,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 13.5,
                color: Color(0xFF7E759B),
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 28),

            DrawerItem(
              icon: Icons.notes_rounded,
              title: 'My Notes',
              onTap: () {
                Navigator.pop(context);
              },
            ),

           DrawerItem(
              icon: Icons.bookmark_rounded,
              title: 'Bookmarks',
              onTap: () {},
            ),

            DrawerItem(
              icon: Icons.notifications_rounded,
              title: 'Reminders',
              onTap: () {},
            ),

            DrawerItem(
              icon: Icons.settings_rounded,
              title: 'Settings',
              onTap: () {},
            ),

            const Spacer(),

            Container(
              width: double.infinity,
              height: 54,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFFF42B3),
                    Color(0xFF7B4DFF),
                  ],
                ),
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFFF42B3).withOpacity(0.25),
                    blurRadius: 18,
                    offset: const Offset(0, 9),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(18),
                  onTap: onLogout,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.logout_rounded,
                        color: Colors.white,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Logout',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}