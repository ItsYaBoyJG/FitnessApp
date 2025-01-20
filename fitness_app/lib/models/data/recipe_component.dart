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
