import 'package:flutter/material.dart';
import 'package:grocery_task/Core/Models/ProductModel.dart';
import 'package:grocery_task/Core/Models/cart_model.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class FruitContainer extends StatefulWidget {
  ProductModel PM;
  double conWidth, conHeight;
  int favoriteProductIndex;
  bool iconTapped;
  void Function()? onTap;
  
  FruitContainer({super.key,
    required this.PM,
    this.conWidth = 0,
    this.conHeight = 0,
    required this.onTap,
    required this.favoriteProductIndex,
    this.iconTapped = false,

  });



  @override
  State<FruitContainer> createState() => _FruitContainerState();
}

class _FruitContainerState extends State<FruitContainer> {
  
  Color? iconColor;
  void updateIcon(){
    final cart = Provider.of<CartModel>(context, listen: false);
    widget.iconTapped = !widget.iconTapped;
    setState(() {
      if (widget.iconTapped == true){
        iconColor = Colors.green; 
        cart.addToFav(widget.favoriteProductIndex);
      } 
      else{
        iconColor = Color(0xff49454f);
        cart.removeFromFav(widget.favoriteProductIndex);
      } 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.conWidth == 0 ? 0 : widget.conWidth,
      height: widget.conHeight == 0 ? 0 : widget.conHeight,
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.PM.imgPath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 130,
            ),
            const SizedBox(height: 10),
            // Product Name
            Text(
              widget.PM.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            // Product Description
            Text(
              widget.PM.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 11,
                color: Colors.grey[900]
              ),
            ),
            
            // Price and Add Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${widget.PM.price.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                // Favorite Button
                IconButton(
                  onPressed: updateIcon,
                  icon: Icon(
                    Icons.favorite_border,
                    color: iconColor,
                  ),
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff53b175),
                    ),
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      ),

    );
  }
}