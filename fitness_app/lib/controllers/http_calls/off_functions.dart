import 'package:openfoodfacts/openfoodfacts.dart';

class OffFunctions {
  static const String _email = 'bigopenfoodfactsmail@gmail.com';
  static const String _password = 'OpenFoodFacts';
  static const _user = User(userId: _email, password: _password);

  void setUserAgent() {
    OpenFoodAPIConfiguration.userAgent = UserAgent(name: 'abettermeapp');
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

  Future getItemSuggestions(String input) async {
    print(input);
    try {
      await OpenFoodAPIClient.getSuggestions(TagType.CATEGORIES,
          language: OpenFoodFactsLanguage.ENGLISH, input: input);
    } catch (e) {
      print(e);
    }
  }

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