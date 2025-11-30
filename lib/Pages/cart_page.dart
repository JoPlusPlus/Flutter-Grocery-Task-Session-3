import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_task/Components/down_button.dart';
import 'package:grocery_task/Models/cart_model.dart';
import 'package:grocery_task/Pages/checkout_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(builder: (context, value, child) => Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 55,bottom: 30),
              child: Text("My Cart", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),),
            ),
            const Divider(height: 0,),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index)  {return Divider();},
                itemCount: value.cartItems.length > 5 ? 5 : value.cartItems.length,
                itemBuilder: (context,index) => Container(
                  margin: EdgeInsets.symmetric(horizontal:  10),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                  ),
                  
                  child: ListTile(
                    // image
                    leading: Image.asset(value.cartItems[index][0], alignment: AlignmentGeometry.centerLeft,),
                    title: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // name
                          Text(value.cartItems[index][1],
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          // description
                          Text(value.cartItems[index][2], style: TextStyle(color: Color(0xff7c7c7c)),),
                          const SizedBox(height: 20,),
                          // buttons
                          Row(
                            // minus button
                            children: [
                              GestureDetector(
                                onTap: () {
                                  value.minusOne(index);
                                },
                                child: Container(
                                  width: 45,
                                  height: 45  ,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(width: 3, color: Color.fromARGB(255, 200, 193, 193)),
                                  ),
                                  child: Icon(Icons.remove),
                                ),
                              ),
                              const SizedBox(width: 15,),
                              // quantity
                              Text(value.cartItems[index][4].toString()),
                              const SizedBox(width: 15,),
                              // add button
                              GestureDetector(
                                onTap: () {
                                  value.addOne(index);
                                },
                                child: Container(
                                  width: 45,
                                  height: 45  ,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(width: 3, color: Color.fromARGB(255, 200, 193, 193)),
                                  ),
                                  child: Icon(Icons.add,color: Colors.green,),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    subtitle: Text(value.cartItems[index][3].toString()),
                    trailing: IconButton(onPressed: () {value.removeItem(index);},
                    icon: Icon(Icons.delete)),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                showBottomSheet(
                  context: context,
                  builder: (context){
                    return Container(
                      height: 500,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(25),
                                child: Text("Checkout",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                              ),
                              IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.close)),
                            ],
                          ),
                          const Divider(height: 0,),
                          const SizedBox(height: 20,),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text("Delivery", style: TextStyle(fontSize: 18,color: Color(0xff7c7c7c)),),
                              ), 
                              Padding(
                                padding:  EdgeInsets.only(left: 350.w),
                                child: Text("Select Method", style: TextStyle(fontSize: 16,color: Color(0xff181725)),),
                              ),SizedBox(width: 10,),Icon(Icons.arrow_forward_ios_rounded)],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: const Divider(height: 10,),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text("Payment", style: TextStyle(fontSize: 18,color: Color(0xff7c7c7c)),),
                              ), 
                              Padding(
                                padding:  EdgeInsets.only(left: 570.w),
                                child: Image.asset("assets/images/card.png"),
                              ),SizedBox(width: 10,),Icon(Icons.arrow_forward_ios_rounded)
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: const Divider(height: 10,),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text("Promo Code", style: TextStyle(fontSize: 18,color: Color(0xff7c7c7c)),),
                              ), 
                              Padding(
                                padding:  EdgeInsets.only(left: 230.w),
                                child: Text("Pick discount", style: TextStyle(fontSize: 16,color: Color(0xff181725)),),
                              ),SizedBox(width: 10,),Icon(Icons.arrow_forward_ios_rounded)
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: const Divider(height: 10,),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text("Total Cost", style: TextStyle(fontSize: 18,color: Color(0xff7c7c7c)),),
                              ), 
                              Padding(
                                padding: EdgeInsets.only(left: 440.w),
                                child: Text(value.calcPrice(), style: TextStyle(fontSize: 16,color: Color(0xff181725)),),
                              ),SizedBox(width: 10,),Icon(Icons.arrow_forward_ios_rounded)],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: const Divider(height: 10,),
                          ),
                          const SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("By placing an order you agree to our",style: TextStyle(color: Color(0xff7c7c7c),),),
                                Row(
                                  children: [
                                    Text("Terms ", style: TextStyle(color: Color(0xff181725),)),
                                    Text("and ", style: TextStyle(color: Color(0xff7c7c7c),)),
                                    Text("Conditions", style: TextStyle(color: Color(0xff181725),))
                                  ],
                                ),
                              ],
                            ),
                          ),
                          downButton(Message: "Place Order",
                            onTap: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CheckoutPage(),));
                            },
                          ),
                          
                        ],
                      ),
                    );
                  }
                );
              },
              child: Container(
                width: 353,
                height: 67,
                decoration: BoxDecoration(
                  color: Color(0xff53b175),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 125),
                      child: Text("Go to Checkout",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Text("\$${value.calcPrice()}"),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}