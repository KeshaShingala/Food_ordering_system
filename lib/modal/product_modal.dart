class Product{
  int id;
  String name;
  int price;
  String image;
  int Quantity;
  int dummyPrice;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.Quantity,
    required this.dummyPrice,
   });

      factory Product.fromMap({required Map data})
      {
        return Product(
           id: data["id"],
           name: data["name"],
           price: data["price"],
           image: data["image"],
           Quantity: data["Quantity"],
           dummyPrice: data["dummyPrice"],
            );
         }
}