import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mypersonalnotes/Models/note_item.dart';
import 'package:mypersonalnotes/Screens/login_screen.dart';
import 'package:mypersonalnotes/Widgets/circular_icon_button.dart';
import 'package:mypersonalnotes/Widgets/note_card.dart';
import 'package:mypersonalnotes/Widgets/note_drawer.dart';
import 'dart:developer' as devtools show log;

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> _logout() async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Logging Out'),
          content: const Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop(); // Close the dialog
                await FirebaseAuth.instance.signOut();
                if (!mounted) return;
                devtools.log('Logging out...');
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Logged Out'),
                      content: const Text(
                        'You have been logged out successfully.',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            ); // Close the dialog
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Log Out'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    final notes = [
      NoteItem(
        title: 'Marketing',
        description: 'Meeting notes and campaign ideas',
        time: '10:20 PM',
        date: 'Tue, 17/6',
        color: const Color(0xFFEAF3FF),
        accentColor: const Color(0xFF2F80ED),
        isFavorite: true,
      ),
      NoteItem(
        title: 'Personal',
        description: 'Daily thoughts and reminders',
        time: '12:10 AM',
        date: '22/06/2026',
        color: const Color(0xFFFFEAF7),
        accentColor: const Color(0xFFFF42B3),
      ),
      NoteItem(
        title: 'Shopping',
        description: 'Milk, coffee, fruits...',
        time: '11:30 AM',
        date: '24/06/2026',
        color: const Color(0xFFF0EAFF),
        accentColor: const Color(0xFF7B4DFF),
      ),
      NoteItem(
        title: 'Reminder',
        description: 'Finish Firebase login setup',
        time: '07:45 AM',
        date: 'Yesterday',
        color: const Color(0xFFEFFFFB),
        accentColor: const Color(0xFF26C6A3),
      ),
    ];

    return Scaffold(
      key: _scaffoldKey,
      drawer: NoteAuraDrawer(
        email: user?.email ?? 'No email found',
        name: user?.displayName ?? 'NoteAura User',
        photoUrl: user?.photoURL,
        onLogout: _logout,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFFF42B3),
        elevation: 15,
        onPressed: () {},
        child: const Icon(Icons.add_rounded, color: Colors.white, size: 32),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF1599FF), Color(0xFF6C35FF), Color(0xFFFF2FB3)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
              decoration: BoxDecoration(
                color: const Color(0xFFF8F7FF).withOpacity(0.96),
                borderRadius: BorderRadius.circular(34),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.12),
                    blurRadius: 28,
                    offset: const Offset(0, 16),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _Header(
                    onMenuTap: () {
                      // Open the drawer
                      // We use the scaffold key to access the Scaffold's state and open the drawer
                      _scaffoldKey.currentState?.openDrawer();
                    },
                  ),
                  const SizedBox(height: 18),
                  const _SearchBox(),
                  const SizedBox(height: 18),
                  const _TabsRow(),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.separated(
                      itemCount: notes.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 13),
                      itemBuilder: (context, index) {
                        return NoteCard(note: notes[index]);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final VoidCallback onMenuTap;

  const _Header({required this.onMenuTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleIconButton(icon: Icons.menu_rounded, onTap: onMenuTap),
        const SizedBox(width: 12),
        const Expanded(
          child: Text(
            'All Notes',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: Color(0xFF201B3D),
            ),
          ),
        ),
        CircleIconButton(icon: Icons.search_rounded, onTap: () {}),
        const SizedBox(width: 10),
        CircleIconButton(icon: Icons.calendar_month_outlined, onTap: () {}),
      ],
    );
  }
}

class _SearchBox extends StatelessWidget {
  const _SearchBox();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: const Row(
        children: [
          Icon(Icons.search_rounded, color: Color(0xFF8A7FA8)),
          SizedBox(width: 10),
          Text(
            'Search your notes...',
            style: TextStyle(color: Color(0xFF9A91B3), fontSize: 15),
          ),
        ],
      ),
    );
  }
}

class _TabsRow extends StatelessWidget {
  const _TabsRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _TabChip(title: 'Notes', isSelected: true),
        SizedBox(width: 8),
        _TabChip(title: 'Bookmark'),
        SizedBox(width: 8),
        _TabChip(title: 'Reminder'),
        Spacer(),
        Icon(Icons.tune_rounded, color: Color(0xFF7E759B)),
      ],
    );
  }
}

class _TabChip extends StatelessWidget {
  final String title;
  final bool isSelected;

  const _TabChip({required this.title, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        gradient: isSelected
            ? const LinearGradient(
                colors: [Color(0xFF2F80ED), Color(0xFF7B4DFF)],
              )
            : null,
        color: isSelected ? null : Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 12.5,
          fontWeight: FontWeight.w700,
          color: isSelected ? Colors.white : const Color(0xFF7E759B),
        ),
      ),
    );
  }
}
