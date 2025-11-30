import 'package:flutter/material.dart';
import 'package:grocery_task/Components/down_button.dart';
import 'package:grocery_task/Models/cart_model.dart';
import 'package:provider/provider.dart';

class FavoritePages extends StatefulWidget {
  const FavoritePages({super.key});

  @override
  State<FavoritePages> createState() => _FavoritePagesState();
}

class _FavoritePagesState extends State<FavoritePages> {
  @override
  Widget build(BuildContext context) {
        return Consumer<CartModel>(builder: (context, value, child) => Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 55,bottom: 30),
              child: Text("Favorites", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),),
            ),
            const Divider(height: 0,),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index)  {return Divider();},
                itemCount: value.favoriteItems.length > 5 ? 5 : value.favoriteItems.length,
                itemBuilder: (context,index) => Container(
                  margin: EdgeInsets.symmetric(horizontal:  10),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                  ),
                  
                  child: ListTile(
                    // image
                    leading: Image.asset(value.favoriteItems[index][0], alignment: AlignmentGeometry.centerLeft,),
                    title: Padding(
                      padding: const EdgeInsets.only(left: 20,),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // name
                          Text(value.favoriteItems[index][1],
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          // description
                          Text(value.favoriteItems[index][2], style: TextStyle(color: Color(0xff7c7c7c)),),
                          const SizedBox(height: 20,),
                        ],
                      ),
                    ),
                    trailing: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("\$${value.favoriteItems[index][3].toString()}",style: TextStyle(color: Color(0xff181725),fontSize: 16),),
                        const SizedBox(width: 20,),
                        Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                    
                     
                  ),
                ),
              ),
            ),
            downButton(Message: "Add All To Cart", onTap: () {
              
            },),
            const SizedBox(height: 20,)
          ],
        ),
      )
    );
  }
}