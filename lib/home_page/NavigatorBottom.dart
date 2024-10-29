// File: lib/widgets/custom_scaffold.dart
import 'package:flutter/material.dart';
import 'package:kerent_app/home_page/cobahome.dart';
import 'package:kerent_app/home_page/add-product.dart';
import 'package:kerent_app/chat_page/chat.dart';

class CustomScaffold extends StatefulWidget {
  final Widget body;
  final bool showBottomNav;
  final Color backgroundColor;
  final bool resizeToAvoidBottomInset;
  final int currentIndex;

  const CustomScaffold({
    Key? key,
    required this.body,
    this.showBottomNav = true,
    this.backgroundColor = Colors.black87,
    this.resizeToAvoidBottomInset = true,
    required this.currentIndex,
  }) : super(key: key);

  @override
  _CustomScaffoldState createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.body,
      backgroundColor: widget.backgroundColor,
      bottomNavigationBar: widget.showBottomNav ? _buildBottomNavBar(context) : null,
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return BottomAppBar(
      color: const Color(0xFF191919),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildNavButton(
            context,
            Icons.home_filled,
            'Home',
            0,
            () => _navigateTo(context, HomePage()),
          ),
          Transform(
            transform: Matrix4.translationValues(0, -20, 0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                minimumSize: const Size(90, 58.96),
                padding: EdgeInsets.zero,
                elevation: 0,
                overlayColor: Colors.transparent,
              ),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AddProductWidget())),
              child: Container(
                width: 58.58,
                height: 58.58,
                decoration: const ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.00, -1.00),
                    end: Alignment(0, 1),
                    colors: [Color(0xFFFF8225), Color(0xFFB43F3F)],
                  ),
                  shape: OvalBorder(),
                  shadows: [
                    BoxShadow(
                      color: Color(0xFFFFFFFF),
                      blurRadius: 0,
                      offset: Offset(0, 0),
                      spreadRadius: 4,
                    ),
                    BoxShadow(
                      color: Color(0x4CB43F3F),
                      blurRadius: 0,
                      offset: Offset(0, 0),
                      spreadRadius: 5,
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage('lib/assets/plus_icon.png'),
                  ),
                ),
              ),
            ),
          ),
          _buildNavButton(
            context,
            Icons.chat_bubble,
            'Chat',
            1,
            () => _navigateTo(context, ChatListPage()),
          ),
        ],
      ),
    );
  }

  Widget _buildNavButton(BuildContext context, IconData icon, String label, int index, VoidCallback onPressed) {
    bool isSelected = selectedIndex == index;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
        overlayColor: Colors.transparent,
      ),
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 30,
            color: isSelected ? Colors.orange : Colors.white,
          ),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.orange : Colors.white,
              fontSize: 12,
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  void _navigateTo(BuildContext context, Widget page) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }
}