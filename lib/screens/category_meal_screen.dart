import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meals_project/dummy_data.dart';
import 'package:meals_project/widget/meal_item.dart';

import '../model/meals.dart';

class CategoryMealItem extends StatefulWidget {
//   final String categoryTitle;
//   final String categoryid;
//   const CategoryMealItem({
//     Key? key,
//     required this.categoryTitle,
// required this.categoryid
//   }) : super(key: key);
  static const routeName = '/category-meals';
  final List<Meal> _availableMeals;
  CategoryMealItem(this._availableMeals);
  @override
  State<CategoryMealItem> createState() => _CategoryMealItemState();
}

class _CategoryMealItemState extends State<CategoryMealItem> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = widget._availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle!),
        ),
        body: ListView.builder(
          itemBuilder: ((context, index) {
            // return Text(categoryMeals[index].title);
            return MealItem(
                id: categoryMeals[index].id,
                title: categoryMeals[index].title,
                imageUrl: categoryMeals[index].imageUrl,
                duration: categoryMeals[index].duration,
                complexity: categoryMeals[index].complexity,
                affordability: categoryMeals[index].affordability);
          }),
          itemCount: categoryMeals.length,
        ));
  }
}
