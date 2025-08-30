import 'package:flutter/material.dart';
import 'package:newzler_app/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class BookmarkNewsItem extends StatefulWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  const BookmarkNewsItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  @override
  _BookmarkNewsItemState createState() => _BookmarkNewsItemState();
}

class _BookmarkNewsItemState extends State<BookmarkNewsItem> {
  bool _isLongPressed = false;
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<ThemeProvider>(context).selectedTheme == 'Night';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: GestureDetector(
        onLongPress: () {
          setState(() {
            _isLongPressed = true;
          });
        },
        onTap: () {
          if (_isLongPressed) {
            setState(() {
              _isSelected = !_isSelected;
            });
          }
        },
        child: Row(
          children: [
            if (_isLongPressed)
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.check_circle_outline,
                  color: _isSelected ? Colors.blue : Colors.grey,
                  size: 24,
                ),
              ),
            SizedBox(
              width: 140,
              height: 80,
              child: Image.asset(widget.imagePath),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style:  TextStyle(
                      fontSize: 12,
                      color: isDarkTheme ? Colors.white : Color(0xff1E1A15),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    widget.subtitle,
                    style:  TextStyle(
                      fontSize: 10,
                      color: isDarkTheme ? Colors.white : Color(0xff1E1A15),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
