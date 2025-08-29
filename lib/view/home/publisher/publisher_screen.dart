import 'package:flutter/material.dart';
import 'package:newzler/models/publisher_model.dart';
import 'package:newzler/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class MyPublishScreen extends StatefulWidget {
  const MyPublishScreen({super.key});
  @override
  State<MyPublishScreen> createState() => _MyPublishScreenState();
}

class _MyPublishScreenState extends State<MyPublishScreen> {
  final List<Publish> _allPublish = [
    Publish(title: 'All Publishers', image: 'assets/images/icon_p.png'),
    Publish(title: 'News Nation', image: 'assets/images/icon_p1.png'),
    Publish(title: 'Times Of India', image: 'assets/images/icon_p2.png'),
    Publish(title: 'News Nation', image: 'assets/images/icon_p3.png'),
    Publish(title: 'Gadgets Now', image: 'assets/images/icon_p4.png'),
    Publish(title: 'India Today', image: 'assets/images/icon_p5.png'),
    Publish(title: 'Swirlster', image: 'assets/images/icon_p6.png'),
  ];

  late List<Publish> _filtered;
  final Set<Publish> _selected = {};
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filtered = List.from(_allPublish);
    _searchController.addListener(_filterBookmarks);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterBookmarks() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filtered = _allPublish
          .where((pItem) => pItem.title.toLowerCase().contains(query))
          .toList();
    });
  }

  void _toggleSelection(Publish pItem) {
    setState(() {
      if (_selected.contains(pItem)) {
        _selected.remove(pItem);
      } else {
        _selected.add(pItem);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<ThemeProvider>(context).selectedTheme == 'Night';
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'My Publish',
          style: TextStyle(
            fontSize: 17,
            color: isDarkTheme ? Colors.white : Color(0xff1E1A15),
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search',
                filled: true,
                fillColor: Color(0xffF4F5F7),
                prefixIcon: const Icon(Icons.search, size: 25),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          _filterBookmarks();
                        },
                      )
                    : null,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 12,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Text(
              'Customize news across all categories',
              style: TextStyle(
                fontSize: 16,
                color: isDarkTheme ? Colors.white : Color(0xff1E1A15),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.separated(
              itemCount: _filtered.length,
              separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: const Divider(height: 1),
              ),
              itemBuilder: (context, index) {
                final pItem = _filtered[index];
                final isSelected = _selected.contains(pItem);
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(pItem.image),
                    ),
                    title: Text(
                      pItem.title,
                      style: TextStyle(
                        fontSize: 16,
                        color:isDarkTheme ? Colors.white : Color(0xff1E1A15),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    trailing: Icon(
                      isSelected
                          ? Icons.check_circle_outline_rounded
                          : Icons.radio_button_unchecked,
                      color: isSelected ? const Color(0xff209CEE) : Colors.grey,
                    ),
                    onTap: () => _toggleSelection(pItem),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
