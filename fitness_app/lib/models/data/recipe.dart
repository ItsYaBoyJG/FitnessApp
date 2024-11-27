class Recipe {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final int cookingTime; // in minutes
  final List<RecipeComponent> components;
  final List<String> steps;

  Recipe({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.cookingTime,
    required this.components,
    required this.steps,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      cookingTime: json['cookingTime'],
      components: (json['components'] as List)
          .map((item) => RecipeComponent.fromJson(item))
          .toList(),
      steps: List<String>.from(json['steps']),
    );
  }

  // Convert Recipe to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'cookingTime': cookingTime,
      'components': components.map((item) => item.toJson()).toList(),
      'steps': steps,
    };
  }
}

class RecipeComponent {
  final String name;
  final String quantity; // e.g., "1 cup", "200g"

  RecipeComponent({
    required this.name,
    required this.quantity,
  });

  factory RecipeComponent.fromJson(Map<String, dynamic> json) {
    return RecipeComponent(
      name: json['name'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'quantity': quantity,
    };
  }
}
