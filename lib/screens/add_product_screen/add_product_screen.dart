import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jacksi_task/cubit/products_cubit/product_cubit.dart';
import 'package:jacksi_task/cubit/products_cubit/product_states.dart';
import 'package:jacksi_task/custom_widgets/custom_dialog.dart';
import 'package:jacksi_task/custom_widgets/custom_round_button.dart';
import 'package:jacksi_task/custom_widgets/custom_text_from_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../utils/colors/colors.dart';

class AddProductScreen extends StatefulWidget {
   AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
   TextEditingController productNameController = TextEditingController();

   TextEditingController shopNameController = TextEditingController();

   TextEditingController priceController = TextEditingController();

   List<String> sectionList = ["تصنيف 1","تصنيف 2", "تصنيف 3"];

   String? section;
   ProductCubit? productCubit;
   final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>ProductCubit(),
    child: BlocConsumer<ProductCubit,ProductStates>(
        listener: (context,state){
          if(state is AddProductSuccess){
            images = [];
            productNameController.clear();
            shopNameController.clear();
            priceController.clear();
            customDialog(
               context: context,
              buttonTitle: "اغلاق",
                message: "تم اضافه المنتج بنجاح",
              onTap: (){
                 Navigator.pop(context);
              }

            );
          } else if(state is AddProductError){
            customDialog(
                context: context,
                buttonTitle: "اغلاق",
                message: "خطأ بالانترنت",
                onTap: (){
                  Navigator.pop(context);
                }

            );
          }
        },
       builder: (context,state){
          productCubit = ProductCubit.get(context);
      return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          title: const Text(
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

        body: ModalProgressHUD(
          inAsyncCall:  state is LoadingState,
          progressIndicator: CircularProgressIndicator(color: mainColor,),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
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
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(

                          children: [
                            pickedImage!.isEmpty  ? GestureDetector(
                                onTap: () async {
                                  await _openImagePicker();
                                },
                                child: Container(color:  Colors.white,
                                height: 100,
                                width: 100,
                                child: Icon(Icons.add),)) :
                            SizedBox(
                              height: 100,
                              width: 300,
                              child: ListView.builder(
                                itemCount: pickedImage!.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context,index){
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                  child: Stack(
                                    children: [
                                      Image.file(File(pickedImage![index]!.path),height: 100,width: 100,),
                                      Positioned(
                                         left: 12,
                                      top: 8,
                                          child: GestureDetector(
                                            onTap : (){
                                              setState(() {
                                                pickedImage!.removeAt(index);

                                              });
                                            } ,
                                            child: Container(
                                              decoration :BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.red.withOpacity(.4)
                                              ),
                                                child: Icon(Icons.close,color: Colors.white,size: 20,)),
                                          ))
                                    ],
                                  ),
                                );
                              }),
                            ),

                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0,bottom: 15),
                      child: CustomRoundedButton(title: "اضغط لاضافه الصور", onPressed: (){

                      }),
                    ),
                    CustomTextFormField(label: "اسم المنتج", controller: productNameController,title: "اسم المنتج",
                    validator: (value){
                      if(value!.isEmpty){
                        return "مطلوب" ;
                      }
                    },
                    ),
                    CustomTextFormField(label: "اسم المتجر", controller: shopNameController,title: "اسم المتجر",
                      validator: (value){
                        if(value!.isEmpty){
                          return "مطلوب" ;
                        }
                      },),
                    CustomTextFormField(label: "السعر", controller: priceController,title: "السعر",
                      keyboardType: TextInputType.number,
                      validator: (value){
                        if(value!.isEmpty){
                          return "مطلوب" ;
                        }
                      },),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
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

                              hint: const Text("اسم التصنيف",style: TextStyle(
                                  fontSize: 15,color: blueColor
                              ),),
                              icon: const Padding(
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
                                setState(() {
                                  section = newValue;

                                });
       
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
                        if(formKey.currentState!.validate()){
                          if(_image == null ){
                            customDialog(
                                context: context,
                                buttonTitle: "اغلاق",
                                message: "يجب عليك اضافه صورة للمنتج",
                                onTap: (){
                                  Navigator.pop(context);
                                }

                            );
                          }else{
                            if(section == null){
                              customDialog(
                                  context: context,
                                  buttonTitle: "اغلاق",
                                  message: "يجب عليك اختيار تصنيف للمنتج",
                                  onTap: (){
                                    Navigator.pop(context);
                                  }

                              );
                            }
                            else{
                              productCubit!.addProduct(_image!, productNameController.text
                                  , shopNameController.text, priceController.text, section!);
                            }
                          }

                        }

                      }),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }, ),);
  }

   final _picker = ImagePicker();

   File? _image;
   List images =[];
    List<XFile?>?  pickedImage;
   Future<void> _openImagePicker() async {
      pickedImage =
     await _picker.pickMultiImage(maxHeight: 2000,maxWidth: 2000);
     if (pickedImage != null) {
       setState(() {
         _image = File(pickedImage!.first!.path);

         // addImageDialog(context);
       });
     }
   }

   Future<bool> requestFilePermission() async {
     PermissionStatus result;
     // In Android we need to request the storage permission,
     // while in iOS is the photos permission
       result = await Permission.storage.request();

     if (result.isGranted) {
       _openImagePicker();
       return true;
     }
     // else if (Platform.isIOS || result.isPermanentlyDenied) {
     //   imageSection = ImageSection.noStoragePermissionPermanent;
     // } else {
     //   imageSection = ImageSection.noStoragePermission;
     // }
     print(result);
     return false;
   }
}
