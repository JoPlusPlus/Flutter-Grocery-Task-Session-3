import 'package:flutter/material.dart';
import 'package:grocery_task/Models/cart_model.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class FruitContainer extends StatefulWidget {
  String imgPath;
  String name;
  String description;
  double price;
  double conWidth, conHeight;
  int frindex;
  bool iconTapped;
  void Function()? onTap;
  
  FruitContainer({super.key,
    required this.imgPath,
    required this.name,
    required this.description,
    required this.price,
    this.conWidth = 0,
    this.conHeight = 0,
    required this.onTap,
    required this.frindex,
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
        cart.addToFav(widget.frindex);
      } 
      else{
        iconColor = Color(0xff49454f);
        cart.removeFromFav(widget.frindex);
      } 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.conWidth == 0 ? 0 : widget.conWidth,
      height: widget.conHeight == 0 ? 0 : widget.conHeight,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Color(0xffe2e2e2), width: 2),

        
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(widget.imgPath, width: 200, height: 100,),
            const SizedBox(height: 10,),
            Text(widget.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(widget.description, style: TextStyle(fontWeight: FontWeight.w300),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: updateIcon, icon: Icon(Icons.favorite_border,color: iconColor,)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("\$${widget.price}"),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff53b175),
                    ),
                    
                    child: Icon(Icons.add, color: Colors.white,
                    
                    ),
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