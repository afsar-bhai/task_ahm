class Task {
  int? id;
  String name; // New field
  String email; // New field
  String title;
  String description;
  bool isCompleted;
  DateTime date;

  Task({
    this.id,
    required this.name, // New field
    required this.email, // New field
    required this.title,
    required this.description,
    this.isCompleted = false,
    required this.date,
  });

  Task copyWith({
    int? id,
    String? name,
    String? email,
    String? title,
    String? description,
    bool? isCompleted,
    DateTime? date,
  }) {
    return Task(
      id: id ?? this.id,
      name: name ?? this.name, // New field
      email: email ?? this.email, // New field
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name, // New field
      'email': email, // New field
      'title': title,
      'description': description,
      'isCompleted': isCompleted ? 1 : 0,
      'date': date.toIso8601String(),
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      name: map['name'], // New field
      email: map['email'], // New field
      title: map['title'],
      description: map['description'],
      isCompleted: map['isCompleted'] == 1,
      date: DateTime.parse(map['date']),
    );
  }
}