import 'package:flutter/material.dart';
import 'package:newzler_app/models/category_model.dart';
import 'package:newzler_app/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class MyCategoryScreen extends StatefulWidget {
  const MyCategoryScreen({super.key});

  @override
  State<MyCategoryScreen> createState() => _MyCategoryScreenState();
}

class _MyCategoryScreenState extends State<MyCategoryScreen> {
  List<CategoryModel> categorylist = [
    CategoryModel(image: 'assets/images/1.png', title: 'All'),
    CategoryModel(image: 'assets/images/2.png', title: 'Weather'),
    CategoryModel(image: 'assets/images/3.png', title: 'Business'),
    CategoryModel(image: 'assets/images/4.png', title: 'Entmt'),
    CategoryModel(image: 'assets/images/5.png', title: 'General'),
    CategoryModel(image: 'assets/images/6.png', title: 'Health'),
    CategoryModel(image: 'assets/images/7.png', title: 'Lifestyle'),
    CategoryModel(image: 'assets/images/8.png', title: 'Science'),
    CategoryModel(image: 'assets/images/9.png', title: 'Sports'),
    CategoryModel(image: 'assets/images/10.png', title: 'Tech'),
    CategoryModel(image: 'assets/images/11.png', title: 'World'),
    CategoryModel(image: 'assets/images/12.png', title: 'Food'),
    CategoryModel(image: 'assets/images/13.png', title: 'Travel'),
    CategoryModel(image: 'assets/images/14.png', title: 'Gamimg'),
    CategoryModel(image: 'assets/images/15.png', title: 'Agriculture'),
    CategoryModel(image: 'assets/images/16.png', title: 'Weird'),
  ];

  final Set<int> selectedIndices = {};

  @override
  Widget build(BuildContext context) {
    final isDarkTheme =
        Provider.of<ThemeProvider>(context).selectedTheme == 'Night';
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'My category',
          style: TextStyle(
            fontSize: 20,
            color: isDarkTheme ? Colors.white : Color(0xff0E0E0E),
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: Icon(
          Icons.arrow_back,
          size: 25,
          color: isDarkTheme ? Colors.white : Color(0xff282828),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(color: Colors.grey),
            const SizedBox(height: 10),
            Text(
              'Customize “My news” category',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: isDarkTheme ? Colors.white : Color(0xff000000),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: categorylist.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 3,
                ),
                itemBuilder: (context, i) {
                  final isSelected = selectedIndices.contains(i);
                  return Container(
                    width: 168,
                    height: 42,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            categorylist[i].image,
                            width: 30,
                            height: 30,
                            color: isSelected
                                ? Colors.lightBlue
                                : Color(0xff505050),
                          ),
                          Text(
                            categorylist[i].title,
                            style: TextStyle(
                              fontSize: 15,
                              color: isSelected
                                  ? Colors.lightBlue
                                  : Color(0xff505050),
                            ),
                          ),
                          IconButton(
                            isSelected: isSelected,
                            icon: Icon(
                              isSelected ? Icons.star : Icons.star_border,
                              color: isSelected
                                  ? Colors.lightBlue
                                  : Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                if (isSelected) {
                                  selectedIndices.remove(i);
                                } else {
                                  selectedIndices.add(i);
                                }
                              });
                            },
                            tooltip: isSelected ? 'Deselect' : 'Select',
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
