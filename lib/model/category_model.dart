class CategoryModel {
  String? name, image;
  CategoryModel({this.name, this.image});
  CategoryModel.fromjson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
  }
  tojson() {
    return {'name': name, 'image': image};
  }
}
