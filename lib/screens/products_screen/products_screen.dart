import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jacksi_task/screens/add_product_screen/add_product_screen.dart';
import 'package:jacksi_task/utils/colors/colors.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                Text("التصنيفات",style: TextStyle(fontSize: 16),),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap :(){},
                    child: Container(
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
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap :(){},
                    child: Container(
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
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap :(){},
                    child: Container(
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
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap :(){},
                    child: Container(
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
                  ),
                ),

              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("تغيير عرض المنتجات الى أفقى",style: TextStyle(fontSize: 12,color: redColor),),
                  SizedBox(width: 5,),
                  SvgPicture.asset("assets/icons/icon_row.svg")

                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context,index){
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
                              Expanded(child: Text("تغيير عرض المنتجات الى أفقى",style: TextStyle(fontSize: 18,color: Colors.black),)),
                              Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("دولار",style: TextStyle(fontSize: 14,color: Colors.black),),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Text("120",style: TextStyle(fontSize: 20,color: mainColor),),
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
                                  child: Text("اسم المتجر",style: TextStyle(fontSize: 10,color: darkGreyColor),)),
                            ],
                          ),
                        ),
                        Image.asset("assets/images/test_image.png",height: 115,width: 115,),

                      ],
                    ),
                  ),
                );
              }),
            )

          ],
        ),
      ),
    );
  }
}
