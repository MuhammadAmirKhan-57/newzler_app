import 'package:flutter/material.dart';
import 'package:newzler_app/provider/theme_provider.dart';
import 'package:provider/provider.dart';



class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool breakingNews = false;
  bool cricketUpdates = false;

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<ThemeProvider>(context).selectedTheme == 'Night';
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notification',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          const Divider(thickness: 1),
          const SizedBox(height: 10),
          _buildToggleRow(
            label: 'Breaking News',
            value: breakingNews,
            onChanged: (val) => setState(() => breakingNews = val), isDarkTheme: isDarkTheme,
          ),
          const SizedBox(height: 10),
          const Divider(thickness: 1),
          const SizedBox(height: 10),
          _buildToggleRow(
            label: 'Cricket Score Update',
            value: cricketUpdates,
            onChanged: (val) {
              setState(() => cricketUpdates = val);
              if (val) { 
                // Cricket Screen
              }
            }, isDarkTheme: isDarkTheme,
          ),
          const Divider(thickness: 1),
        ],
      ),
    );
  }

 Widget _buildToggleRow({
  required String label,
  required bool value,
  required ValueChanged<bool> onChanged,
  required bool isDarkTheme,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: isDarkTheme ? Colors.white : Colors.grey,
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
        // CustomSwitch(value: value, onChanged: onChanged),
      ],
    ),
  );
}

}