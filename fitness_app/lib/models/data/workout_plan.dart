class WorkoutPlan {
  final String id;
  final String title;
  final String description;
  final int duration; // Total duration in minutes
  final List<WorkoutComponent> exercises;
  final String image;

  WorkoutPlan({
    required this.id,
    required this.title,
    required this.description,
    required this.duration,
    required this.exercises,
    required this.image,
  });

  factory WorkoutPlan.fromJson(Map<String, dynamic> json) {
    return WorkoutPlan(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        duration: json['duration'],
        exercises: (json['exercises'] as List)
            .map((item) => WorkoutComponent.fromJson(item))
            .toList(),
        image: json['image']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'duration': duration,
      'exercises': exercises.map((item) => item.toJson()).toList(),
    };
  }
}

class WorkoutComponent {
  final String name; // Exercise name
  final String type; // e.g., Cardio, Strength, Flexibility
  final int duration; // Duration in minutes for this exercise
  final String instructions; // Optional detailed instructions

  WorkoutComponent({
    required this.name,
    required this.type,
    required this.duration,
    required this.instructions,
  });

  factory WorkoutComponent.fromJson(Map<String, dynamic> json) {
    return WorkoutComponent(
      name: json['name'],
      type: json['type'],
      duration: json['duration'],
      instructions: json['instructions'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type,
      'duration': duration,
      'instructions': instructions,
    };
  }
}
