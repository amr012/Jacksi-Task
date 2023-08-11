import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jacksi_task/cubit/products_cubit/product_cubit.dart';
import 'package:jacksi_task/screens/add_product_screen/add_product_screen.dart';
import 'package:jacksi_task/utils/colors/colors.dart';

import '../../cubit/products_cubit/product_states.dart';

class ProductsScreen extends StatelessWidget {
   ProductsScreen({Key? key}) : super(key: key);
 ProductCubit? productCubit;
   String? section;
   int sectionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>ProductCubit(),
    child: BlocConsumer<ProductCubit,ProductStates>(builder: (context,state){
      productCubit = ProductCubit.get(context);
      section = productCubit!.section;
      sectionIndex = productCubit!.sectionIndex;
      return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AddProductScreen()));
              },),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("التصنيفات",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap :(){
                        productCubit!.changeSection("تصنيف 3", 3);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: sectionIndex == 3 ? mainColor : Colors.white
                            )
                        ),
                        child: Column(
                          children: [
                            Image.asset("assets/images/section3.png"),
                            SizedBox(height: 5,),
                            Text("تصنيف 3",textAlign: TextAlign.center,)
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap :(){
                        productCubit!.changeSection("تصنيف 2", 2);

                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: sectionIndex == 2 ? mainColor : Colors.white
                            )
                        ),
                        child: Column(
                          children: [
                            Image.asset("assets/images/section2.png"),
                            SizedBox(height: 5,),
                            Text("تصنيف 2",textAlign: TextAlign.center,)
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap :(){
                        productCubit!.changeSection("تصنيف 1", 1);

                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: sectionIndex == 1 ? mainColor : Colors.white
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
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap :(){
                        productCubit!.changeSection("", 0);

                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: sectionIndex == 0 ? mainColor : Colors.white
                            )
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: mainColor,
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                width: double.infinity,
                                child: SvgPicture.asset("assets/icons/element4.svg")),
                            SizedBox(height: 5,),
                            Text("عرض الكل",textAlign: TextAlign.center,)
                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: GestureDetector(
                  onTap: (){
                    productCubit!.changeStyleDirection();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(  "تغيير عرض المنتجات الى " + "${productCubit!.isVertical == true ? "أفقى" : "رأسى"}",style: TextStyle(fontSize: 12,color: redColor),),
                      SizedBox(width: 5,),
                      SvgPicture.asset("assets/icons/icon_row.svg")

                    ],
                  ),
                ),
              ),
              StreamBuilder<QuerySnapshot>(
                stream: sectionIndex == 0 ? productCubit!.getAllProducts() :productCubit!.getAllProductsBySection(section!) ,
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Padding(
                      padding:  EdgeInsets.only(top: 100.0),
                      child: CircularProgressIndicator(color: mainColor,),
                    );
                  }

                  return productCubit!.isVertical ? Expanded(
                    child: ListView(

                      children: snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: SizedBox(
                            height: 120,
                            child: Row(
                              mainAxisAlignment:MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Expanded(child: Text(data["productName"],style: TextStyle(fontSize: 18,color: Colors.black),)),
                                      Expanded(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text("دولار",style: TextStyle(fontSize: 14,color: Colors.black),),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 8.0),
                                                child: Text(data["Price"],style: TextStyle(fontSize: 20,color: mainColor),),
                                              ),
                                            ],
                                          )),
                                      SizedBox(height: 5,),
                                      Container(
                                          padding: EdgeInsets.all(7),
                                          decoration: BoxDecoration(
                                              color: lightGreyColor,
                                              borderRadius: BorderRadius.circular(10)
                                          ),
                                          child: Text(data["shopName"],style: TextStyle(fontSize: 10,color: darkGreyColor),)),
                                    ],
                                  ),
                                ),
                                Image.network(data["imageURL"],height: 115,width: 115,),

                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ) :
                  SizedBox(
                    height: 120,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0,),
                          child: SizedBox(
                            height: 120,
                            child: Row(
                              mainAxisAlignment:MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Expanded(child: Text(data["productName"],style: TextStyle(fontSize: 18,color: Colors.black),)),
                                      Expanded(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text("دولار",style: TextStyle(fontSize: 14,color: Colors.black),),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 8.0),
                                                child: Text(data["Price"],style: TextStyle(fontSize: 20,color: mainColor),),
                                              ),
                                            ],
                                          )),
                                      SizedBox(height: 5,),
                                      Container(
                                          padding: EdgeInsets.all(7),
                                          decoration: BoxDecoration(
                                              color: lightGreyColor,
                                              borderRadius: BorderRadius.circular(10)
                                          ),
                                          child: Text(data["shopName"],style: TextStyle(fontSize: 10,color: darkGreyColor),)),
                                    ],
                                  ),
                                ),
                                Image.network(data["imageURL"],height: 115,width: 115,),

                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  );
                },
              ),

            ],
          ),
        ),
      );
    }, listener: (context,state){}),);
  }
}
