import 'dart:developer';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_app/modal/product_modal.dart';
import 'package:food_app/res/container_res.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../controller/product_controller.dart';
import '../provider/db_provider.dart';
import '../res/product_res.dart';

class Nextpage extends StatefulWidget {
  const Nextpage({Key? key}) : super(key: key);

  @override
  State<Nextpage> createState() => _NextpageState();
}

class _NextpageState extends State<Nextpage> {
  TextEditingController searchController = TextEditingController();
  String search = "";

  bool a1 = true;
  bool a2 = false;
  bool a3 = false;
  bool a4 = false;
  bool a5 = false;

  late Future<RxList<Product>> productDataList;
  late Future<List<Product>> productList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productList = ProductDBHelper.productDBHelper.fetchAllData();
    log(productList.toString(), name: "Product List Data");
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    SizedBox(width: 10,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text("Hii Lenardo",style: TextStyle(fontSize: 25,color: Color(0xff8B562A),fontWeight: FontWeight.w800),),
                      SizedBox(height: 5,),
                      Text("Search and Order",style: TextStyle(fontSize: 20,color: Colors.black),),
                    ],),
                    Spacer(),
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border.all(color: Colors.white,width: 3),
                        shape: BoxShape.circle,
                        image: DecorationImage(fit: BoxFit.cover,image: AssetImage("assets/images/360_F_224869519_aRaeLneqALfPNBzg0xxMZXghtvBXkfIA.jpg"),),
                      ),
                    ),
                    SizedBox(width: 10,),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20,right: 5),
                      child: Container(
                        height: 54,
                        width: 300,
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
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5,top: 5),
                          child: TextFormField(
                            controller: searchController,
                            onSaved: (val) {
                              setState(() {
                                search = val!;
                              });
                            },
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Enter Food Name..";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search Food",
                              hintStyle: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.w500),
                              prefixIcon: Icon(Icons.search,color: Colors.black,size: 27,),
                            ),
                          ),
                        ),
                      ),
                    ),),
                  InkWell(
                    onTap: (){
                      setState((){
                       // Get.toNamed('detailpage');
                      });
                    },
                    child: Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20,left: 12),
                          child: Container(
                            alignment: Alignment.center,
                            height: 54,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(Icons.filter_list_rounded,color: Colors.white,size: 30,),
                          ),
                        )),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      SizedBox(width: 20,),
                      InkWell(
                        onTap: () async {
                          setState(() {
                            a1 = true;
                            a2 = false;
                            a3 = false;
                            a4 = false;
                            a5 = false;
                          });
                        },
                        child: Text(
                          "Pizza",
                          style: TextStyle(
                            color: (a1) ? Color(0xff8B562A) : Colors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      InkWell(
                        onTap: () async {
                          setState(() {
                            a1 = false;
                            a2 = true;
                            a3 = false;
                            a4 = false;
                            a5 = false;
                          });
                        },
                        child: Text(
                          "Burger",
                          style: TextStyle(
                            color: (a2) ? Color(0xff8B562A) : Colors.grey,
                            fontSize: 20,
                              fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      InkWell(
                        onTap: () async {
                          setState(() {
                            a1 = false;
                            a2 = false;
                            a3 = true;
                            a4 = false;
                            a5 = false;
                          });
                        },
                        child: Text(
                          "Drinks",
                          style: TextStyle(
                            color: (a3) ? Color(0xff8B562A) : Colors.grey,
                            fontSize: 20,
                              fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      InkWell(
                        onTap: () async {
                          setState(() {
                            a1 = false;
                            a2 = false;
                            a3 = false;
                            a4 = true;
                            a5 = false;
                          });
                        },
                        child: Text(
                          "Sauces",
                          style: TextStyle(
                            color: (a4) ? Color(0xff8B562A) : Colors.grey,
                            fontSize: 20,
                              fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      InkWell(
                        onTap: () async {
                          setState(() {
                            a1 = false;
                            a2 = false;
                            a3 = false;
                            a4 = false;
                            a5 = true;
                          });
                        },
                        child: Text(
                          "Combo",
                          style: TextStyle(
                            color: (a5) ? Color(0xff8B562A) : Colors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              CarouselSlider.builder(
                itemCount: 5,
                options: CarouselOptions(
                  height: 200,
                  aspectRatio: 0,
                  viewportFraction: 0.9,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayCurve: Curves.easeInOut,
                ),
                itemBuilder: (context, i, pageViewIndex) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: (i == 0)
                            ? const AssetImage("assets/images/s1 (2).jpg")
                            : (i == 1)
                            ? const AssetImage("assets/images/s2.jpg")
                            : (i == 2)
                            ? const AssetImage("assets/images/s3.webp")
                            : (i == 3)
                            ? const AssetImage("assets/images/s4.jpg")
                            : (i == 4)
                            ? const AssetImage("assets/images/s5.jpg")
                            : const AssetImage(
                            "assets/images/s6.jpg"),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 20,),
              SizedBox(
                height: 370,
                width: double.infinity,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      if(a1) ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            product(
                                context: context,
                                image: "assets/images/veggie_pizza.jpg",
                                id: 1,
                                name: "Veggie_pizza",
                                price: 1000,
                                onTap: (){
                                    Navigator.pushNamed(context, "detailpage", arguments: products[0]);
                                },
                                plus: (){
                                  Provider.of<ProductController>(context, listen: false).addProduct(food: products[0]);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Product Added To cart",style: TextStyle(color: Colors.white),),
                                      backgroundColor: Colors.brown.shade200,
                                    ),
                                  );
                                }),
                            product(
                                context: context,
                                image: "assets/images/Greek Pizza.jfif",
                                id: 2,
                                name: "Greek Pizza",
                                price: 1500,
                                onTap: (){
                                  Navigator.pushNamed(context, "detailpage", arguments: products[1]);
                                },
                                plus: (){
                                  Provider.of<ProductController>(context, listen: false).addProduct(food: products[1]);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Product Added To cart",style: TextStyle(color: Colors.white),),
                                      backgroundColor: Colors.brown.shade200,
                                    ),
                                  );
                                }),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            product(
                                context: context,
                                image: "assets/images/mushroom pizza.jpg",
                                id: 3,
                                name: "Mushroom pizza",
                                price: 1700,
                                onTap: (){
                                  Navigator.pushNamed(context, "detailpage", arguments: products[2]);
                                },
                                plus: (){ Provider.of<ProductController>(context, listen: false).addProduct(food: products[2]);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Product Added To cart",style: TextStyle(color: Colors.white),),
                                      backgroundColor: Colors.brown.shade200,
                                    ),
                                  );
                                }),
                            product(
                                context: context,
                                image: "assets/images/margherita_pizza.jpg",
                                id: 4,
                                name: "Margherita_pizza",
                                price: 2000,
                                onTap: (){
                                  Navigator.pushNamed(context, "detailpage", arguments: products[3]);
                                },
                                plus: (){ Provider.of<ProductController>(context, listen: false).addProduct(food: products[3]);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Product Added To cart",style: TextStyle(color: Colors.white),),
                                      backgroundColor: Colors.brown.shade200,
                                    ),
                                  );
                                }),
                          ],
                        ),
                      ]
                      else if(a2) ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            product(
                                context: context,
                                image: "assets/images/Supreme Veggie Burger.jpg",
                                id: 5,
                                name: "Veggie Burger",
                                price: 150,
                                onTap: (){
                                  Navigator.pushNamed(context, "detailpage", arguments: products[4]);
                                },
                                plus: (){ Provider.of<ProductController>(context, listen: false).addProduct(food: products[4]);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Product Added To cart",style: TextStyle(color: Colors.white),),
                                      backgroundColor: Colors.brown.shade200,
                                    ),
                                  );
                                }),
                            product(
                                context: context,
                                image: "assets/images/Lamb and Tomato Stuffed Burger.jpg",
                                id: 6,
                                name: "Tomato Burger",
                                price: 170,
                                onTap: (){
                                  Navigator.pushNamed(context, "detailpage", arguments: products[5]);
                                },
                                plus: (){ Provider.of<ProductController>(context, listen: false).addProduct(food: products[5]);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Product Added To cart",style: TextStyle(color: Colors.white),),
                                      backgroundColor: Colors.brown.shade200,
                                    ),
                                  );
                                }),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            product(
                                context: context,
                                image: "assets/images/Chilli burger With Pepper Relish.jpg",
                                id: 7,
                                name: "Chilli burger",
                                price: 150,
                                onTap: (){
                                  Navigator.pushNamed(context, "detailpage", arguments: products[6]);
                                },
                                plus: (){ Provider.of<ProductController>(context, listen: false).addProduct(food: products[6]);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Product Added To cart",style: TextStyle(color: Colors.white),),
                                      backgroundColor: Colors.brown.shade200,
                                    ),
                                  );
                                }),
                            product(
                                context: context,
                                image: "assets/images/pizza burger.jpg",
                                id: 8,
                                name: "pizza burger",
                                price: 200,
                                onTap: (){
                                  Navigator.pushNamed(context, "detailpage", arguments: products[7]);
                                },
                                plus: (){ Provider.of<ProductController>(context, listen: false).addProduct(food: products[7]);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Product Added To cart",style: TextStyle(color: Colors.white),),
                                      backgroundColor: Colors.brown.shade200,
                                    ),
                                  );
                                }),
                          ],
                        ),
                      ]
                      else if(a3) ...[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              product(
                                  context: context,
                                  image: "assets/images/coca cola.jfif",
                                  id: 9,
                                  name: "Coca cola",
                                  price: 60,
                                  onTap: (){
                                    Navigator.pushNamed(context, "detailpage", arguments: products[8]);
                                  },
                                  plus: (){ Provider.of<ProductController>(context, listen: false).addProduct(food: products[8]);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("Product Added To cart",style: TextStyle(color: Colors.white),),
                                        backgroundColor: Colors.brown.shade200,
                                      ),
                                    );
                                  }),
                              product(
                                  context: context,
                                  image: "assets/images/coffee.jfif",
                                  id: 10,
                                  name: "Coffee",
                                  price: 150,
                                  onTap: (){
                                    Navigator.pushNamed(context, "detailpage", arguments: products[9]);
                                  },
                                  plus: (){ Provider.of<ProductController>(context, listen: false).addProduct(food: products[9]);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("Product Added To cart",style: TextStyle(color: Colors.white),),
                                        backgroundColor: Colors.brown.shade200,
                                      ),
                                    );
                                  }),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              product(
                                  context: context,
                                  image: "assets/images/blackberry virgin mojito.jfif",
                                  id: 11,
                                  name: "Virgin mojito",
                                  price: 170,
                                  onTap: (){
                                    Navigator.pushNamed(context, "detailpage", arguments: products[10]);
                                  },
                                  plus: (){
                                     Provider.of<ProductController>(context, listen: false).addProduct(food: products[10]);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("Product Added To cart",style: TextStyle(color: Colors.white),),
                                        backgroundColor: Colors.brown.shade200,
                                      ),
                                    );
                                  }),
                              product(
                                  context: context,
                                  image: "assets/images/cold coco.jpg",
                                  id: 12,
                                  name: "Cold coco",
                                  price: 200,
                                  onTap: (){
                                    Navigator.pushNamed(context, "detailpage", arguments: products[11]);
                                  },
                                  plus: (){
                                     Provider.of<ProductController>(context, listen: false).addProduct(food: products[11]);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("Product Added To cart",style: TextStyle(color: Colors.white),),
                                        backgroundColor: Colors.brown.shade200,
                                      ),
                                    );
                                  }),
                            ],
                          ),
                        ]
                      else if(a4)...[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                product(
                                    context: context,
                                    image: "assets/images/ketchup.jpg",
                                    id: 13,
                                    name: "Ketchup",
                                    price: 40,
                                    onTap: (){
                                      Navigator.pushNamed(context, "detailpage", arguments: products[12]);
                                    },
                                    plus: (){
                                       Provider.of<ProductController>(context, listen: false).addProduct(food: products[12]);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text("Product Added To cart",style: TextStyle(color: Colors.white),),
                                          backgroundColor: Colors.brown.shade200,
                                        ),
                                      );
                                    }),
                                product(
                                    context: context,
                                    image: "assets/images/mayonnaise.jpg",
                                    id: 14,
                                    name: "Mayonnaise",
                                    price: 100,
                                    onTap: (){
                                      Navigator.pushNamed(context, "detailpage", arguments: products[13]);
                                    },
                                    plus: (){
                                       Provider.of<ProductController>(context, listen: false).addProduct(food: products[13]);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text("Product Added To cart",style: TextStyle(color: Colors.white),),
                                          backgroundColor: Colors.brown.shade200,
                                        ),
                                      );
                                    }),
                              ],
                            ),
                            SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                product(
                                    context: context,
                                    image: "assets/images/Italian dressing.jpg",
                                    id: 15,
                                    name: "Italian dressing",
                                    price: 120,
                                    onTap: (){
                                      Navigator.pushNamed(context, "detailpage", arguments: products[14]);
                                    },
                                    plus: (){
                                       Provider.of<ProductController>(context, listen: false).addProduct(food: products[14]);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text("Product Added To cart",style: TextStyle(color: Colors.white),),
                                          backgroundColor: Colors.brown.shade200,
                                        ),
                                      );
                                    }),
                                product(
                                    context: context,
                                    image: "assets/images/hot sauces.jpg",
                                    id: 16,
                                    name: "Hot sauces",
                                    price: 100,
                                    onTap: (){
                                      Navigator.pushNamed(context, "detailpage", arguments: products[15]);
                                    },
                                    plus: (){
                                       Provider.of<ProductController>(context, listen: false).addProduct(food: products[15]);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text("Product Added To cart",style: TextStyle(color: Colors.white),),
                                          backgroundColor: Colors.brown.shade200,
                                        ),
                                      );
                                    }),
                              ],
                            ),
                          ]
                      else ...[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  product(
                                      context: context,
                                      image: "assets/images/burgerand frise.jfif",
                                      id: 17,
                                      name: "Burger and frise",
                                      price: 100,
                                      onTap: (){
                                        Navigator.pushNamed(context, "detailpage", arguments: products[16]);
                                      },
                                      plus: (){
                                         Provider.of<ProductController>(context, listen: false).addProduct(food: products[16]);
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text("Product Added To cart",style: TextStyle(color: Colors.white),),
                                            backgroundColor: Colors.brown.shade200,
                                          ),
                                        );
                                      }),
                                  product(
                                      context: context,
                                      image: "assets/images/4pizza.webp",
                                      id: 18,
                                      name: "4 pizza",
                                      price: 250,
                                      onTap: (){
                                        Navigator.pushNamed(context, "detailpage", arguments: products[17]);
                                      },
                                      plus: (){
                                         Provider.of<ProductController>(context, listen: false).addProduct(food: products[17]);
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text("Product Added To cart",style: TextStyle(color: Colors.white),),
                                            backgroundColor: Colors.brown.shade200,
                                          ),
                                        );
                                      }),
                                ],
                              ),
                              SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  product(
                                      context: context,
                                      image: "assets/images/burger withfries,saucesand knife.jpg",
                                      id: 19,
                                      name: "combo 2",
                                      price: 300,
                                      onTap: (){
                                        Navigator.pushNamed(context, "detailpage", arguments: products[18]);
                                      },
                                      plus: (){
                                         Provider.of<ProductController>(context, listen: false).addProduct(food: products[18]);
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text("Product Added To cart",style: TextStyle(color: Colors.white),),
                                            backgroundColor: Colors.brown.shade200,
                                          ),
                                        );
                                      }),
                                  product(
                                      context: context,
                                      image: "assets/images/combo.jpg",
                                      id: 20,
                                      name: "Combo",
                                      price: 150,
                                      onTap: (){
                                        Navigator.pushNamed(context, "detailpage", arguments: products[19]);
                                      },
                                      plus: (){
                                         Provider.of<ProductController>(context, listen: false).addProduct(food: products[19]);
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text("Product Added To cart",style: TextStyle(color: Colors.white),),
                                            backgroundColor: Colors.brown.shade200,
                                          ),
                                        );
                                      }),
                                ],
                              ),
                            ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff8B562A),
          onPressed: (){},
          child: Center(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('cartpage');
                  },
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "${Provider.of<ProductController>(context).totalProducts}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.grey.shade200,
      ),
    );
  }
}
