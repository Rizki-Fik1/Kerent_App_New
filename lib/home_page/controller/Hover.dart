import 'package:flutter/material.dart';

class NavBarItem {
  final IconData icon;
  final String label;
  final Widget page;

  NavBarItem({required this.icon, required this.label, required this.page});
}

class BottomNavBar extends StatefulWidget {
  final List<NavBarItem> items;

  const BottomNavBar({super.key, required this.items});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  Widget _buildNavButton({
    required IconData icon,
    required String label,
    required int index,
    required VoidCallback onPressed,
  }) {
    final isSelected = _selectedIndex == index;
    return HoverButton(
      icon: icon,
      label: label,
      isSelected: isSelected,
      onPressed: () {
        setState(() {
          _selectedIndex = index;
        });
        onPressed();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color(0xFF191919),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ...widget.items.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;
            return _buildNavButton(
              icon: item.icon,
              label: item.label,
              index: index,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => item.page,
                  ),
                );
              },
            );
          }),
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
              onPressed: () {},
              child: Container(
                width: 58.96,
                height: 58.96,
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
        ],
      ),
    );
  }
}

class HoverButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;

  const HoverButton({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  _HoverButtonState createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final color = widget.isSelected ? Colors.white : (_isHovered ? Colors.white : Colors.grey);

    return InkWell(
      onTap: widget.onPressed,
      onHover: (isHovered) {
        setState(() {
          _isHovered = isHovered;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            widget.icon,
            color: color,
          ),
          Text(
            widget.label,
            style: TextStyle(
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}