import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:sample/model/receipe_model.dart';
import 'package:sample/respository/recipes_repository.dart';
import 'package:sample/utils/api_state.dart';

class ReceipeViewModel extends ChangeNotifier {
  ApiState apiState = ApiState.loading;

  RecipesRepository recipesRepository = RecipesRepository();

  // Loading, Sucess, Error

  // Loading
  bool isRecipesDataLoading = false;

  // Success
  RecipesModel? _recipesData;
  RecipesModel? get recipesData => _recipesData;

  void setRecipesData(RecipesModel? recipesData) {
    _recipesData = recipesData;
  }

  // Error

  String errorApiRecipes = '';
  // String get errorApiRecipes => _errorApiRecipes;

  // setErrorApiRecipes(String msg) {
  //   _errorApiRecipes = msg;
  // }

  void getReceipe() async {
    try {
      // isRecipesDataLoading = true;
      final data = await recipesRepository.getRecipes();
      if (data.errorMessage != null) {
        errorApiRecipes = data.errorMessage ?? "";
        apiState = ApiState.error;
        // setErrorApiRecipes(data.errorMessage ?? "");
      } else {
        setRecipesData(data);
        apiState = ApiState.success;
      }
      notifyListeners();
    } on SocketException catch (_) {
      apiState = ApiState.nointernet;
    } catch (e) {
      errorApiRecipes = e.toString();
      apiState = ApiState.error;
      // setErrorApiRecipes(e.toString());
    } finally {
      // setRecipesDataLoading(false);
      isRecipesDataLoading = false;
      notifyListeners();
    }
  }
}
