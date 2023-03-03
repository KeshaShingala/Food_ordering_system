import 'package:flutter/material.dart';
import 'package:food_app/modal/product_modal.dart';


class  ProductController extends ChangeNotifier{
  List<Product> addedProducts =[];

  get totalQuantity => addedProducts.length;

  get totalPrice{
    int  totalPrice = 0;
    for(Product  food in addedProducts)
    {
      totalPrice = (totalPrice + (food.price * food.Quantity));
    }
    return totalPrice;
  }
  get totalProducts{
    int products = 0;
    for(Product  food in addedProducts){
      products += food.Quantity;
    }
    return  products;
  }


  void addProduct({required Product food})
  {
    int flag = 0;
    for (Product addProduct in addedProducts) {
      if (addProduct.id == food.id) {
        food.Quantity = food.Quantity + 1;
        addProduct.dummyPrice = addProduct.price * food.Quantity;
        flag = 1;
        notifyListeners();
      }
      notifyListeners();
    }
    if (flag == 0) {
      addedProducts.add(food);
      notifyListeners();
    }
  }

  void removeProduct({required Product food})
  {
    if (food.Quantity > 1) {
      food.Quantity = food.Quantity - 1;
      food.dummyPrice = food.price * food.Quantity;
      notifyListeners();
    } else {
      addedProducts.remove(food);
      notifyListeners();
    }
  }
}

