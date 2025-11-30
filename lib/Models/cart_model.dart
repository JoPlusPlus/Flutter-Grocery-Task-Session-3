import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier{
  // all items
    List allItems = [
    ["assets/images/Banana2.png","Banana","1kg, Priceg",4.99,0],
    ["assets/images/Apple.png","Red Apple","1kg, Priceg",4.99,0],
    ["assets/images/Grapes.png","Grapes","1kg, Priceg",7.99,0],
    ["assets/images/orange.png","Orange","1kg, Priceg",3.99,0],
    ["assets/images/Watermelon.png","Watermelon","1kg, Priceg",5.99,0],
    // 0 -> path , 1 -> name, 2 -> des, 3 -> price, 4 -> quantity
  ];



  // user items
  List cartItems = [];
  List favoriteItems = [];



  // add item
  void addItem(int index){
    bool found = false;
    for (var item in cartItems){
      if (item == allItems[index]){
        found = true;
        cartItems[index][4] += 1;
        break;
      }
    }
    if (found == false){
      allItems[index][4] += 1;
      cartItems.add(allItems[index]);
    }
    notifyListeners();
  }

  // remove item
  void removeItem(int index){
    allItems[index][4] = 0;
    cartItems[index][4] = 0;
    cartItems.removeAt(index);
    notifyListeners();
  }
  void minusOne(int index){
    if (cartItems[index][4] > 0){
      cartItems[index][4] -=1;
    }
    notifyListeners();
  }
  void addOne(int index){
    cartItems[index][4] +=1;
    notifyListeners();
  }

  // total price
  String calcPrice(){
    double price=0;
    for (int i=0; i<cartItems.length; i++){
      price += cartItems[i][3] * cartItems[i][4];
    }
    return price.toStringAsFixed(2);
  }

  // favorite item
  void addToFav(int index){
    bool found = false;
    for (var item in favoriteItems){
      if (item == allItems[index]){
        found = true;
        break;
      }
    }
    if (found == false){
      favoriteItems.add(allItems[index]);
    }
    notifyListeners();
  }
    void removeFromFav(int index){
    favoriteItems.removeAt(index);
    notifyListeners();
  }

  void clearCart(){
    cartItems.clear();
    for (int i=0;i<allItems.length;i++){
      allItems[i][4]=0;
    }
    notifyListeners();
  }
}
