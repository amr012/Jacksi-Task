import 'package:flutter/material.dart';
import 'package:jacksi_task/custom_widgets/custom_round_button.dart';
import 'package:jacksi_task/custom_widgets/custom_text_from_field.dart';

import '../../utils/colors/colors.dart';

class AddProductScreen extends StatelessWidget {
   AddProductScreen({Key? key}) : super(key: key);

   TextEditingController productNameController = TextEditingController();
   TextEditingController shopNameController = TextEditingController();
   TextEditingController priceController = TextEditingController();
   List<String> sectionList = ["تصنيف 1","تصنيف 2", "تصنيف 3"];
   String? section;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
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

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
            const  Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("صور المنتج",style: TextStyle(fontSize: 16),),
                  ],
                ),
              ),
              SizedBox(
                height: 100,
                child: Row(
                  children: [
                    Expanded(child: Image.asset("assets/images/test_image.png")),
                    SizedBox(width: 2,),
                    Expanded(child: Image.asset("assets/images/test_image.png")),
                    SizedBox(width: 2,),
                    Expanded(child: Image.asset("assets/images/test_image.png")),
                    SizedBox(width: 2,),
                    Expanded(child: Image.asset("assets/images/test_image.png")),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0,bottom: 15),
                child: CustomRoundedButton(title: "اضغط لاضافه الصور", onPressed: (){

                }),
              ),
              CustomTextFormField(label: "اسم المنتج", controller: productNameController,title: "اسم المنتج",),
              CustomTextFormField(label: "اسم المتجر", controller: productNameController,title: "اسم المتجر",),
              CustomTextFormField(label: "السعر", controller: productNameController,title: "السعر",),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  "التصنيف",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),

              SizedBox(
                height: 60,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    border: Border.all(color: lightGreyColor)
                  ),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        //hint:'',
                        dropdownColor: Colors.white,
                        isExpanded: true,
                        alignment: Alignment.centerRight,

                        hint: Text("اسم التصنيف",style: TextStyle(
                            fontSize: 15,color: blueColor
                        ),),
                        icon: Padding(
                          padding: EdgeInsetsDirectional.only(start: 20),
                          child: Icon(
                            Icons.arrow_drop_down_circle_outlined,
                            color: blueColor,
                          ),
                        ),value: section,
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                        ),

                        // value: isSignLang,
                        onChanged: (newValue) {
                          section = newValue;
                          // setState(() {
                          //   isSignLang = newValue!;
                          //   print(signLang.indexOf(newValue));
                          //   signLangValue = signLang.indexOf(newValue)  ;
                          //   print(signLangValue);
                          //
                          // });
                        },
                        items:
                        sectionList.map<DropdownMenuItem<String>>((valueItem) {
                          return DropdownMenuItem(
                            value: valueItem,
                            child: Text(
                              valueItem,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: darkGreyColor
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: CustomRoundedButton(title: "اضافة المنتج", onPressed: (){

                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
