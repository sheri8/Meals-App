import 'package:flutter/material.dart';
import 'package:meals_project/screens/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;

  CategoryItem(this.title, this.color, this.id);
  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(CategoryMealItem.routeName,
        arguments: {'id': id, 'title': title});
    // Navigator.of(context)
    //     .pushNamed('//category-meals', arguments: {'id': id, 'title': title});
    // Navigator.push(context, MaterialPageRoute(builder: (_) {
    // return CategoryMealItem.routeName
    // CategoryMealItem(categoryTitle: title, categoryid: id);
    // }));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.5),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
