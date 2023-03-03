import 'package:flutter/material.dart';

Widget  product(
     {required BuildContext context,
       required String image,
       required int id,
       required String name,
       required double price,
       required Function()? onTap,
       required Function()? plus,
      })
{
  return   InkWell(
    onTap:onTap,
    child: Container(
      height:300,
      width: 180,
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
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.favorite_border,color: Color(0xff8B562A),size: 30,),
              SizedBox(width: 10,),
            ],
          ),
          SizedBox(height: 10,),
          Image.asset(image,height: 120,width: 120,fit: BoxFit.cover,),
          SizedBox(height: 10,),
          Row(
            children: [
              SizedBox(width: 20,),
              Text(name,style: TextStyle(color: Colors.grey.shade900,fontSize: 18,fontWeight: FontWeight.w700),),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              SizedBox(width: 15,),
              Icon(Icons.star,color: Colors.yellow.shade700,),
              Icon(Icons.star,color: Colors.yellow.shade700,),
              Icon(Icons.star,color: Colors.yellow.shade700,),
              Icon(Icons.star,color: Colors.yellow.shade700,),
              Icon(Icons.star_border_purple500_sharp,color: Colors.grey,),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              SizedBox(width: 20,),
              RichText(text: TextSpan(children: [
                TextSpan(text: "Rs.",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 20)),
                TextSpan(text: "$price",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 20)),
              ]),),
              Spacer(),
              Container(
                alignment: Alignment.center,
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff8B562A),
                ),
                child: InkWell(
                  onTap: plus,
                    child: Icon(Icons.add,color: Colors.white,)),
              ),
              SizedBox(width: 10,),
            ],
          ),
        ],
      ),
    ),
  );
}