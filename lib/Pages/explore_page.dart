import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ExplorePage extends StatelessWidget {
  ExplorePage({super.key});

  List<Image>categories = [
    Image.asset("assets/images/fruits.png"),
    Image.asset("assets/images/cookingOil.png"),
    Image.asset("assets/images/bakery.png"),
    Image.asset("assets/images/chipsy.png"),
    Image.asset("assets/images/fruits.png"),
    Image.asset("assets/images/cookingOil.png"),
    Image.asset("assets/images/bakery.png"),
    Image.asset("assets/images/chipsy.png"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Find Products",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),),backgroundColor: Colors.white10,),
      
      body: SizedBox(
        height: 1000,
        child: GridView.builder(
          itemCount: categories.length,
          scrollDirection: Axis.vertical,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisExtent: 250),
           itemBuilder: (context, index) => Image(image: categories[index].image),
        ),
      ),


    );
  }
}

