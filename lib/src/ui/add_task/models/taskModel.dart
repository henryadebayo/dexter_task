class GeneralTaskModel {
  String? task;
  String? id;
  String? title;

  GeneralTaskModel({
    this.task,
    this.id,
    this.title,
  });
  Map<String, dynamic> toJson() => {
        'id': id,
        'task': task,
        'title': title,
      };

  static GeneralTaskModel fromJson(Map<String, dynamic> json) =>
      GeneralTaskModel(
        id: json['id'],
        task: json['task'],
        title: json['title'],
      );
}
