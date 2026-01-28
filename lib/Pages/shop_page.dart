import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_task/Components/fruit_container.dart';
import 'package:grocery_task/Core/Models/ProductModel.dart';
import 'package:grocery_task/Core/Models/cart_model.dart';
import 'package:grocery_task/Core/Rebo/Products.dart';
import 'package:grocery_task/Pages/login_page.dart';
import 'package:grocery_task/Pages/signup_page.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  List<ProductModel>ProductModelList = [];
  dynamic getAllProducts()async{
    ProductModelList = await ProductsRebo().getAllProducts();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getAllProducts();
  }

  

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
              child: ProductModelList.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : Consumer<CartModel>(
                builder: (context, value, child) {
                  return Consumer<CartModel>(
                    builder: (context, value, child){
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: ProductModelList.length > 5 ? 5 : ProductModelList.length,
                        itemBuilder: (context, index) => FruitContainer(
                          conWidth: 500.w,
                          conHeight: 100.h,
                          onTap: () {
                            Provider.of<CartModel>(context, listen: false).addItem(index);
                            popUpMessage("Sucessfully added", Colors.green,"Check Your cart");
                          }, PM: ProductModelList[index], favoriteProductIndex: index,
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
              child: ProductModelList.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : Consumer<CartModel>(
                builder: (context, value, child) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: ProductModelList.length,
                    itemBuilder: (context, index) => FruitContainer(
                      PM: ProductModelList[index],
                      favoriteProductIndex: index,
                      conWidth: 500.w,
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