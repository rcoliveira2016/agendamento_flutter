abstract class Entidade {
  int id;

  bool get isNew => id == null || id < 1;

  Entidade({this.id});

  Map<String, dynamic> toJson();

  Map<String, dynamic> toMapWithoutId();

  Entidade.fromJson(Map<String, dynamic> json);
}