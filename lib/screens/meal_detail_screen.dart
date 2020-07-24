import 'package:flutter/material.dart';
import 'package:flutter_meals/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static final String routeName = '/meal-detail';
  final Function toggleFavorite;
  final Function isFavorite;

  MealDetailScreen(this.toggleFavorite, this.isFavorite);

  Widget _buildSectionTitle(BuildContext ctx, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(ctx).textTheme.headline1,
      ),
    );
  }

  Widget _buildContainer(Widget listbuilder) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      height: 100,
      width: 500,
      child: listbuilder,
    );
  }

  @override
  Widget build(BuildContext context) {
    final String mealID = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealID);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 350,
              width: double.infinity,
              child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'The Meal ${selectedMeal.title}',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                            'Cook Time: ${selectedMeal.duration.toString()}mins'),
                      ],
                    ),
                  ),
                  _buildSectionTitle(context, 'Ingredients'),
                  _buildContainer(ListView.builder(
                    itemCount: selectedMeal.ingredients.length,
                    itemBuilder: (context, index) {
                      return Card(
                          elevation: 0,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(selectedMeal.ingredients[index]),
                          ));
                    },
                  )),
                  _buildSectionTitle(context, 'Steps'),
                  _buildContainer(
                    ListView.builder(
                        itemCount: selectedMeal.steps.length,
                        itemBuilder: (ctx, idx) {
                          return Column(
                            children: [
                              ListTile(
                                leading: CircleAvatar(
                                  child: Text('# ${(idx + 1)}'),
                                ),
                                title: Text(
                                  selectedMeal.steps[idx],
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                              Divider(),
                            ],
                          );
                        }),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: isFavorite(mealID) ? Icon(Icons.star) : Icon(Icons.star_border),
        onPressed: () => toggleFavorite(selectedMeal.id),
      ),
    );
  }
}
