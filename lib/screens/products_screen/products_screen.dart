import 'package:flutter/material.dart';
import 'package:jacksi_task/utils/colors/colors.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "المنتجات",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(top: 8.0,left: 15,bottom: 8),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(color: Colors.black.withOpacity(.1))
            ),
            child: IconButton(icon: Icon(Icons.add),onPressed: (){

            },),
          ),
        ),
      ),
      body: Column(
        children: [

          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: mainColor
                  )
                ),
                child: Column(
                  children: [
                    Image.asset("assets/images/section1.png"),
                    SizedBox(height: 5,),
                    Text("تصنيف 1",textAlign: TextAlign.center,)
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
