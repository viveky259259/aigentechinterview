class AdModel {
  int id;
  String name;
  String description;
  String imageUrl;
  double price;
  bool isFavorite;
  bool isSelf;
  String location;
  AdModel(this.id,this.name,this.description,this.imageUrl,this.price,this.location,{this.isFavorite=false,this.isSelf=false});
}
