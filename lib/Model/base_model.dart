abstract class BaseModel<R> {
  R fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();
}
