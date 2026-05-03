import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sample/model/receipe_model.dart';
import 'package:sample/utils/api_endpoints.dart';

class RecipesRepository {
  Future<RecipesModel> getRecipes() async {
    try {
      final response = await http.get(Uri.parse(ApiEndpoints.recipesUrl));
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = jsonDecode(response.body);
        // List<dynamic> recipes = jsonData['recipes'];
        return RecipesModel.fromJson(jsonData);
        // recipes.map((item) => Recipes.fromJson(item));
      } else {
        return RecipesModel(errorMessage: 'Something went wrong!');
      }
    } catch (e) {
      rethrow;
      // return RecipesModel(errorMessage: e.toString());
    }
  }
}

// throw - New Exception
// rethrow - return exception without lossing it stack
