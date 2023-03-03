import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../controller/product_controller.dart';
import '../modal/product_modal.dart';

class detailpage extends StatefulWidget {
  const detailpage({Key? key}) : super(key: key);

  @override
  State<detailpage> createState() => _detailpageState();
}

class _detailpageState extends State<detailpage> {
  @override
  Widget build(BuildContext context) {
    Product product = ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
            icon: Icon(Icons.favorite_border,size: 30,color: Colors.brown,),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 400,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade300,
                    offset: Offset(4,4),
                    blurRadius: 3
                ),
              ],
            ),
            child: Image.asset("${product.image}",fit: BoxFit.fill,),
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              SizedBox(width: 15,),
              Icon(Icons.star,color: Colors.yellow.shade700,),
              Icon(Icons.star,color: Colors.yellow.shade700,),
              Icon(Icons.star,color: Colors.yellow.shade700,),
              Icon(Icons.star,color: Colors.yellow.shade700,),
              Icon(Icons.star_border_purple500_sharp,color: Colors.grey,),
              Spacer(),
              Text("Rs.${product.price}",style: TextStyle(color: Colors.black,fontSize: 23,fontWeight: FontWeight.w800),),
              SizedBox(width: 15,),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              SizedBox(width: 15,),
              Text("${product.name}",style: TextStyle(color: Colors.brown,fontSize: 25,fontWeight: FontWeight.w800),),
            ],
          ),
          SizedBox(height: 17,),
          Row(
            children: [
              SizedBox(width: 15,),
              Text("Lorem ipsum dolor sit amet,consetetur\nsading eilter,sed diam nanumy eirmod\ntempor.",style: TextStyle(color: Colors.black54,fontSize: 18,fontWeight: FontWeight.w600),),
            ],
          ),
          SizedBox(height: 12,),
          Row(
            children: [
              SizedBox(width: 15,),
              Icon(Icons.access_time_outlined,size: 36,color: Colors.black87,),
              SizedBox(width: 15,),
              Text("Delivery Time:",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w800),),
              SizedBox(width: 15,),
              Text("30 Mint",style: TextStyle(color: Colors.grey.shade400,fontSize: 18,fontWeight: FontWeight.w800),),
            ],
          ),
          Spacer(),
          Container(
            height: 130,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade300,
                    offset: Offset(-4,-4),
                    blurRadius: 3
                ),
              ],
            ),
            child: Row(
              children: [
                SizedBox(width: 20,
                ),
                InkWell(
                  onTap: (){
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade100,
                            offset: Offset(4,4),
                            blurRadius: 2
                        ),
                        BoxShadow(
                            color: Colors.grey.shade100,
                            offset: Offset(-4,-4),
                            blurRadius: 2
                        ),
                      ],
                    ),
                    child: Icon(Icons.remove,size: 30,color: Colors.white,),
                  ),
                ),
                SizedBox(width: 20,),
                Text("0",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w800),),
                SizedBox(width: 20,),
                InkWell(
                  onTap: (){
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff8B562A),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade100,
                            offset: Offset(4,4),
                            blurRadius: 2
                        ),
                        BoxShadow(
                            color: Colors.grey.shade100,
                            offset: Offset(-4,-4),
                            blurRadius: 2
                        ),
                      ],
                    ),
                    child: Icon(Icons.add,size: 30,color: Colors.white),
                  ),
                ),

                Spacer(),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, "Nextpage");
                    Provider.of<ProductController>(context, listen: false).addProduct(food: product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Product Added To cart"),
                        backgroundColor: Colors.brown.shade500,
                      ),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Color(0xff8B562A),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text("Add to Cart",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600),),
                  ),
                ),
                SizedBox(width: 20,),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade100,
    );
  }
}
