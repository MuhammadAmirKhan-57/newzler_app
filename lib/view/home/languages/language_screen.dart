import 'package:flutter/material.dart';
import 'package:newzler_app/models/language_model.dart';
import 'package:newzler_app/provider/theme_provider.dart';
import 'package:provider/provider.dart';



class MyLanguageScreen extends StatefulWidget {
  const MyLanguageScreen({super.key});
  @override
  State<MyLanguageScreen> createState() => _MyLanguageScreenState();
}

class _MyLanguageScreenState extends State<MyLanguageScreen> {
  final List<Language> _allLanguages = [
    Language('English'),
    Language('বাংলা'),
    Language('ગુજરાતી'),
    Language('हिन्दी'),
    Language('ಕನ್ನಡ'),
    Language('മലയാളം'),
    Language('मराठी'),
    Language('தமிழ்'),
    Language('తెలుగు'),
  ];

  late List<Language> _filtered;
  final Set<Language> _selected = {};
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filtered = List.from(_allLanguages);
    _searchController.addListener(_filterLanguages);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterLanguages() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filtered = _allLanguages
          .where((lang) => lang.name.toLowerCase().contains(query))
          .toList();
    });
  }

  void _toggleSelection(Language lang) {
    setState(() {
      if (_selected.contains(lang)) {
        _selected.remove(lang);
      } else {
        _selected.add(lang);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<ThemeProvider>(context).selectedTheme == 'Night';
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text(
          'My Language',
          style: TextStyle(
            fontSize: 17,
            color:isDarkTheme ? Colors.white : Color(0xff1E1A15),
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search',
                filled: true,
                fillColor: Color(0xffF4F5F7),
                prefixIcon: const Icon(Icons.search, size: 25,),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          _filterLanguages();
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
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Divider(thickness: 1),
          ),
      
          Expanded(
            child: ListView.separated(
              itemCount: _filtered.length,
              separatorBuilder: (_, __) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: const Divider(height: 1),
              ),
              itemBuilder: (context, index) {
                final lang = _filtered[index];
                final isSelected = _selected.contains(lang);
                return ListTile(
                  title: Text(
                    lang.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: isSelected ? const Color(0xff209CEE) : null,
                    ),
                  ),
                  trailing: Icon(
                    isSelected
                        ? Icons.check_circle_outline_rounded
                        : Icons.radio_button_unchecked,
                    color: isSelected ? const Color(0xff209CEE) : Colors.grey,
                  ),
                  onTap: () => _toggleSelection(lang),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
