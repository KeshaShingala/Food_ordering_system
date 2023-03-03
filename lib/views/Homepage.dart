import 'package:flutter/material.dart';


class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50,),
            Image.asset("assets/images/man.png",height: 450,width: 350,),
            SizedBox(height: 20,),
            Text("  The Fastest  \n Food Delivery",style: TextStyle(color: Color(0xff010101),fontSize: 37,fontWeight: FontWeight.w800
            ),),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Text("Lorem ipsum dolor sit amet consetetur sadipscing eirer,set diam nonumy.",
                style: TextStyle(color: Color(0xff010101),fontSize: 18,fontWeight: FontWeight.w700
              ),),
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, "Nextpage");
              },
              child: Container(
                alignment: Alignment.center,
                height: 65,
                width: 230,
                decoration: BoxDecoration(
                    color: Color(0xff8B562A),
                  borderRadius: BorderRadius.circular(40),
                ),
                child:Text("Get Started",style: TextStyle(color: Colors.grey.shade200,fontSize: 20,fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey.shade200,
    );
  }
}
