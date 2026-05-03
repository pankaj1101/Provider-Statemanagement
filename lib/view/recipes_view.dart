import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/utils/api_state.dart';
import 'package:sample/view_model/receipe_view_model.dart';

class RecipesView extends StatefulWidget {
  const RecipesView({super.key});

  @override
  State<RecipesView> createState() => _RecipesViewState();
}

class _RecipesViewState extends State<RecipesView> {
  late ReceipeViewModel provider;

  @override
  void initState() {
    super.initState();
    provider = Provider.of<ReceipeViewModel>(context, listen: false);
    fetchRecipe();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Using getter setter
      /* body: Consumer<ReceipeViewModel>(
        builder: (_, controller, _) {
          if (controller.isRecipesDataLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (controller.errorApiRecipes.isNotEmpty) {
            return Center(child: Text(controller.errorApiRecipes));
          } else {
            final receipsList = controller.recipesData?.recipes ?? [];

            return ListView.builder(
              itemCount: receipsList.length,
              itemBuilder: (BuildContext context, int index) {
                final receipeItem = receipsList[index];

                final imageUrl = receipeItem.image ?? "";
                final name = receipeItem.name ?? "";
                final rating = receipeItem.rating ?? 0;
                final level = receipeItem.difficulty ?? "";

                return SizedBox(
                  height: 200,
                  child: Card(
                    child: Row(
                      children: [
                        Image.network(imageUrl),
                        Expanded(
                          child: Column(children: [Text(name), Text(level)]),
                        ),
                        Text('$rating'),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ), */

      // Using Enums State
      body: Consumer<ReceipeViewModel>(
        builder: (_, controller, _) {
          if (controller.apiState == ApiState.nointernet) {
            return Center(child: Text('No internet'));
          } else if (controller.apiState == ApiState.loading) {
            return Center(child: CircularProgressIndicator());
          } else if (controller.apiState == ApiState.error) {
            return Center(child: Text(controller.errorApiRecipes));
          } else {
            final receipsList = controller.recipesData?.recipes ?? [];

            return ListView.builder(
              itemCount: receipsList.length,
              itemBuilder: (BuildContext context, int index) {
                final receipeItem = receipsList[index];

                final imageUrl = receipeItem.image ?? "";
                final name = receipeItem.name ?? "";
                final rating = receipeItem.rating ?? 0;
                final level = receipeItem.difficulty ?? "";

                return SizedBox(
                  height: 200,
                  child: Card(
                    child: Row(
                      children: [
                        Image.network(imageUrl),
                        Expanded(
                          child: Column(children: [Text(name), Text(level)]),
                        ),
                        Text('$rating'),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  Future<void> fetchRecipe() async {
    provider.getReceipe();
  }
}
