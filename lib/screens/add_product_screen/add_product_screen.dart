import 'package:flutter/material.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "اضافه منتجات",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        leading: SizedBox(),
        actions: [Padding(
          padding: const EdgeInsets.only(top: 8.0,left: 15,bottom: 8,right: 15),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(color: Colors.black.withOpacity(.1))
            ),
            child: IconButton(icon: Icon(Icons.arrow_forward_ios,size: 18,),onPressed: (){
              Navigator.pop(context);
              },),
          ),
        )] ,
      ),

      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("صور المنتج",style: TextStyle(fontSize: 16),),
            ],
          ),

        ],
      ),
    );
  }
}
