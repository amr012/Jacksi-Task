import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jacksi_task/cubit/products_cubit/product_states.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit() : super(ProductInitialState());

  static ProductCubit get(context) => BlocProvider.of(context);

  final fireStore = FirebaseFirestore.instance;
  String? section;
  int sectionIndex = 0;
  bool isVertical = true;

  addProduct(File image, String productName, String shopName, String price,
      String section,String code) async {
    try {
      emit(LoadingState());
      final imageURL = await uploadImage(image, code);
      await fireStore.collection("products").add({
        "imageURL": imageURL,
        "productName": productName,
        "shopName": shopName,
        "Price": price,
        "section": section,
      });
      emit(AddProductSuccess());
    } catch (e) {
      emit(AddProductError());
    }
  }

  Future<String> uploadImage(File image, String code) async {
    final ref = FirebaseStorage.instance.ref().child("users_images/$code");
    final uploadTask = ref.putFile(image);
    final url = (await (await uploadTask).ref.getDownloadURL()).toString();

    return url;
  }

  Stream<QuerySnapshot> getAllProducts(){
    return  FirebaseFirestore.instance.collection('products').snapshots();
  }

  Stream<QuerySnapshot> getAllProductsBySection(String section){
    return  FirebaseFirestore.instance.collection('products').where("section",isEqualTo: section).snapshots();
  }

  changeSection(String currentSection,int currentSectionIndex){
    section = currentSection;
    sectionIndex = currentSectionIndex;
    emit(ChangeSectionState());
  }

  changeStyleDirection(){
    isVertical = !isVertical;
    emit(ChangeStyleState());
  }
}
