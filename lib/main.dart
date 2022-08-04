import 'package:flutter/material.dart';
import 'package:meals_project/dummy_data.dart';
import 'package:meals_project/model/meals.dart';
import 'package:meals_project/screens/category_meal_screen.dart';
import 'package:meals_project/screens/filter.dart';
import 'package:meals_project/screens/meal_detail_screen.dart';
import 'package:meals_project/screens/tabs_screen.dart';

import 'screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
  }
  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      // _availableMeals = DUMMY_MEALS.where((meal) => if(_filters['gluten'] && !meal.));
      // _availableMeals = DUMMY_MEALS.where((Meal) => if(_filters['gluten']&& !Meal.isGluten))
      // .whereType((meal) {
      //   if (_filters['gluten'] && !meal.isGlutenFree) {
      //     return false;
      //   }
      // }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        // accentColor: Colors.amber,
        // canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            subtitle1: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      // home: CityMax(),

      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(_favouriteMeals),
        CategoryMealItem.routeName: (context) =>
            CategoryMealItem(_availableMeals),
        MealDetail.routename: (context) => MealDetail(),
        FilterScreen.routename: (context) => FilterScreen(_setFilters)
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: ((context) => CategoriesScreen()));
      },
    );
  }
}
