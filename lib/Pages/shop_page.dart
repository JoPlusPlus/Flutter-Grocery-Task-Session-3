import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_task/Components/fruit_container.dart';
import 'package:grocery_task/Models/cart_model.dart';
import 'package:grocery_task/Pages/login_page.dart';
import 'package:grocery_task/Pages/signup_page.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  void popUpMessage(String head,Color headColor, String body){
    showDialog(
      context: context,
       builder: (context) => AlertDialog(
        title: Text(head,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.green),
        ),
        content: Text(body),
       )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 30, top: 70, bottom: 20),
              child: Image.asset("assets/images/Carrot.png"),
            ),
            // ******************************** Greeting Message **************************************
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 120, right: 10),
                  child: Icon(Icons.location_on),
                ),
                Text("Welcome, ",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                Text(userData[loggedUserId]["username"]??'',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            // ******************************** Search Store **************************************
            Container(
              width: 950.w,
              height: 51,
              child: TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  filled: true,
                  fillColor: const Color(0xfff2f3f2),
                  prefixIcon: Icon(Icons.search,size: 35,),
                  hintText: "Search Store",
                ),
              ),
            ),
            const SizedBox(height: 20,),
            // ******************************** Scroll Image **************************************
            Image.asset("assets/images/banner.png", width: 950.w,),
            // *************************** Offer and See all **************************************
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 30),
                  child: Text("Exclusive Offer", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 24, top: 30),
                  child: Text("See all", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16,
                   color: Colors.green),),
                )
              ],
            ),
            // *************************** Offer and See all List **************************************
            SizedBox(
              height: 300,
              child: Consumer<CartModel>(
                builder: (context, value, child) {
                  return Consumer<CartModel>(
                    builder: (context, value, child){
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) => FruitContainer(
                          imgPath: value.allItems[index][0],
                          name: value.allItems[index][1],
                          description: value.allItems[index][2],
                          price: value.allItems[index][3],
                          frindex: index,
                          conWidth: 470.w,
                          onTap: () {
                            Provider.of<CartModel>(context, listen: false).addItem(index);
                            popUpMessage("Sucessfully added", Colors.green,"Check Your cart");
                          },
                        ),
                      );
                    }
                  );
                },
              ),
            ),
            // *************************** Best Selling **************************************
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 30),
                  child: Text("Best Selling", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 24, top: 30),
                  child: Text("See all", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16,
                   color: Colors.green),),
                )
              ],
            ),
            // *************************** Best Selling List **************************************
            SizedBox(
              height: 300,
              child: Consumer<CartModel>(
                builder: (context, value, child) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) => FruitContainer(
                      imgPath: value.allItems[index+2][0],
                      name: value.allItems[index+2][1],
                      description: value.allItems[index+2][2],
                      price: value.allItems[index+2][3],
                      frindex: index+2,
                      conWidth: 470.w,
                      onTap: () {
                        value.addItem(index+2);
                        popUpMessage("Sucessfully added", Colors.green,"Check Your cart");
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}