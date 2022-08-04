import 'package:flutter/material.dart';

import '../model/meals.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> _favouriteMeals;
  FavoritesScreen(this._favouriteMeals);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('The Favorites'),
    );
  }
}
