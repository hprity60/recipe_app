import 'package:dio/dio.dart';
import 'package:recipe_app/features/home/data/models/recipes_response_model.dart';

import '../../../../../core/network/dio_client.dart';
import '../../../../../core/values/app_strings.dart';
import 'get_recipes_remote_data_source.dart';

class GetRecipesRemoteDataSourceImpl implements GetRecipesRemoteDataSource {
  DioProvider dio;
  GetRecipesRemoteDataSourceImpl({
    required this.dio,
  });
  @override
  Future<RecipesResponseModel> searchRecipe({required String query}) async {
    try {
      final options = Options(
        headers: {
          'X-RapidAPI-Key':
              "f162daa98amshf3ee577c5a00053p14c26cjsn2525170b7c64",
        },
      );
      print("DataSource Query >> $query");

      print("Search url >> ${AppStrings.searchUrl}");
      print("Base url >> ${AppStrings.baseUrl}");
      Response response = await dio.client.get(AppStrings.searchUrl,
          queryParameters: {'q': query}, options: options);
      final responseBody = response.data;
      final RecipesResponseModel recipesResponseModel =
          RecipesResponseModel.fromJson(responseBody);
      return recipesResponseModel;
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
