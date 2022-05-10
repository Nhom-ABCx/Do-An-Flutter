abstract class BaseModel<E> {
  E fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();
}
