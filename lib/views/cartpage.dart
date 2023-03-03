import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../controller/product_controller.dart';

class cartpage extends StatefulWidget {
  const cartpage({Key? key}) : super(key: key);

  @override
  State<cartpage> createState() => _cartpageState();
}

class _cartpageState extends State<cartpage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back,size: 30,color: Colors.black,),
        ),
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.menu,size: 30,color: Colors.black,),
          ),
        ],
        title: Text("My Cart",style: TextStyle(color: Colors.brown.shade900,fontSize: 25,fontWeight: FontWeight.w600),),
      ),
      body: Column(
        children: [
          Container(
            height: 449,
            width: double.infinity,
            child: ListView.builder(
                itemCount: Provider.of<ProductController>(context).addedProducts.length,
                itemBuilder: (context,i){
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      height: 130,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300,
                              offset: Offset(4,4),
                              blurRadius: 3
                          ),
                          BoxShadow(
                              color: Colors.grey.shade300,
                              offset: Offset(-4,-4),
                              blurRadius: 3
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 10,),
                          Image.asset(Provider.of<ProductController>(context).addedProducts[i].image,height: 75,width: 75,),
                          SizedBox(width: 10,),
                          Column(
                            children: [
                              SizedBox(height: 20,),
                              Text("${Provider.of<ProductController>(context).addedProducts[i].name}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black),),
                              Spacer(),
                              Container(
                                height: 45,
                                width: 163,
                                decoration: BoxDecoration(
                                  color: Color(0xff8B562A),
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade300,
                                        offset: Offset(4,4),
                                        blurRadius: 3
                                    ),
                                    BoxShadow(
                                        color: Colors.grey.shade300,
                                        offset: Offset(-4,-4),
                                        blurRadius: 3
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(width: 7,),
                                    IconButton(onPressed: (){
                                      Provider.of<ProductController>(context,
                                          listen: false)
                                          .removeProduct(
                                          food: Provider.of<ProductController>(
                                              context,
                                              listen: false)
                                              .addedProducts[i]);
                                    }, icon:  Icon(Icons.remove,size: 30,color: Colors.white,),),
                                    SizedBox(width: 6,),
                                    Container(
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Text("${Provider.of<ProductController>(context).addedProducts[i].Quantity}",style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w600),),
                                    ),
                                    SizedBox(width: 6,),
                                    IconButton(onPressed: (){
                                      Provider.of<ProductController>(context,
                                          listen: false)
                                          .addProduct(
                                          food: Provider.of<ProductController>(
                                              context,
                                              listen: false)
                                              .addedProducts[i]);
                                    }, icon:  Icon(Icons.add,size: 30,color: Colors.white,),),
                                    SizedBox(width: 7,),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20,),
                            ],
                          ),
                          Spacer(),
                          Text("Rs.${Provider.of<ProductController>(context).addedProducts[i].price}",style: TextStyle(color: Colors.brown.shade800,fontWeight: FontWeight.w700,fontSize: 20),),
                          SizedBox(width: 10,),
                        ],
                      ),
                    ),
                  );
                }
            ),

          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              height: 160,
              width: double.infinity,
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(15),
                 boxShadow: [
                   BoxShadow(
                       color: Colors.grey.shade300,
                       offset: Offset(4,4),
                       blurRadius: 3
                   ),
                   BoxShadow(
                       color: Colors.grey.shade300,
                       offset: Offset(-4,-4),
                       blurRadius: 3
                   ),
                 ],
               ),
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      SizedBox(width: 20,),
                      Text("Item Quantity:",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600),),
                     Spacer(),
                      Text("${Provider.of<ProductController>(context).totalProducts}",style: TextStyle(color: Colors.grey.shade500,fontSize: 20,fontWeight: FontWeight.w600),),
                      SizedBox(width: 20,),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      SizedBox(width: 20,),
                      Text("Delivery Services:",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600),),
                      Spacer(),
                      Text("Free",style: TextStyle(color: Colors.grey.shade500,fontSize: 20,fontWeight: FontWeight.w600),),
                      SizedBox(width: 20,),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(width: 20,),
                      Text("Total:",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w600),),
                      Spacer(),
                      Text("Rs. ${Provider.of<ProductController>(context).totalPrice}",style: TextStyle(color: Colors.grey.shade500,fontSize: 20,fontWeight: FontWeight.w600),),
                      SizedBox(width: 20,),
                    ],
                  ),
                  SizedBox(height: 10,),
                ],
              ),
              ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              height: 60,
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xff8B562A),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: Colors.brown.shade100,
                      offset: Offset(4,4),
                      blurRadius: 3
                  ),
                  BoxShadow(
                      color: Colors.brown.shade100,
                      offset: Offset(-4,-4),
                      blurRadius: 3
                  ),
                ],
              ),
              child: Text("Checkout",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800,fontSize: 22),),
            ),
          ),
          SizedBox(height: 20,),
        ],
      ),
      backgroundColor: Colors.grey.shade200,
    );
  }
}
