import 'package:openfoodfacts/openfoodfacts.dart';

class OffFunctions {
  static const String _email = '';
  static const String _password = '';
  static const _user = User(userId: _email, password: _password);

  void setUserAgent() {
    OpenFoodAPIConfiguration.userAgent = UserAgent(name: 'fitnessapp');
  }

  Future<List<Product>?>? searchProduct(String name) async {
    ProductSearchQueryConfiguration configuration =
        ProductSearchQueryConfiguration(
            parametersList: [
          SearchTerms(terms: [name])
        ],
            version: ProductQueryVersion.v3,
            country: OpenFoodFactsCountry.USA,
            language: OpenFoodFactsLanguage.ENGLISH);

    SearchResult result =
        await OpenFoodAPIClient.searchProducts(_user, configuration);

    return result.products;
  }

//  getItemSuggestions(String input) async {
  // await OpenFoodAPIClient.getpro
//  }

  Future<String?>? extractIngredients(String barcode) async {
    OcrIngredientsResult result = await OpenFoodAPIClient.extractIngredients(
        _user, barcode, OpenFoodFactsLanguage.ENGLISH);

    if (result.status != 0) {
      //TODO: add error handling
      throw Exception('Cannot be extracted.');
    }
    return result.ingredientsTextFromImage;
  }
}
