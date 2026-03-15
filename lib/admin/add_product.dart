import 'dart:io';

import 'package:addis_ecommerce/services/database.dart';
import 'package:addis_ecommerce/widgets/support_widget.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final ImagePicker _imagePicker = ImagePicker();
  File? selectedImage;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _detailController = TextEditingController();

  Future getImage() async {
    var image = await _imagePicker.pickImage(source: ImageSource.gallery);
    selectedImage = File(image!.path);
    setState(() {});
  }

  void uploadItem() async {
    if (selectedImage != null && _nameController.text != "") {
      String addId = randomAlphaNumeric(10);
      Reference firebaseStorageRef = FirebaseStorage.instance
          .ref()
          .child("blogImage")
          .child(addId);

      final UploadTask task = firebaseStorageRef.putFile(selectedImage!);
      var downloadUrl = await (await task).ref.getDownloadURL();

      Map<String, dynamic> addProduct = {
        "Name": _nameController.text.trim(),
        "Image": downloadUrl,
        "Price": _priceController.text.trim(),
        "Detail": _detailController.text.trim(),
      };
      await DatabaseMethods().addProduct(addProduct, value!).then((value) {
        selectedImage = null;
        _nameController.text = "";
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Product has been uploaded successfully!",
              style: TextStyle(color: Colors.green, fontSize: 16),
            ),
          ),
        );
      });
    }
  }

  final List<String> categoryItems = ['Headphone', 'Laptop', 'TV', 'Watch'];
  String? value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios_new_outlined),
        ),
        centerTitle: true,
        title: Text("Add Product", style: AppWidget.semiBoldTextStyle()),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Upload Product Image", style: AppWidget.lightTextStyle()),
              const SizedBox(height: 20),
              selectedImage == null
                  ? GestureDetector(
                      onTap: () => getImage(),
                      child: Center(
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1.5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(Icons.camera_alt_outlined, size: 50),
                        ),
                      ),
                    )
                  : Center(
                      child: Material(
                        elevation: 4.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1.5),
                            borderRadius: BorderRadius.circular(20),
                          ),

                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.file(
                              selectedImage!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
              const SizedBox(height: 20),
              Text("Product Name", style: AppWidget.lightTextStyle()),
              const SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xffececf8),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ),
              const SizedBox(height: 20),
              Text("Product Price", style: AppWidget.lightTextStyle()),
              const SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xffececf8),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                  controller: _priceController,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ),
              const SizedBox(height: 20),
              Text("Product Detail", style: AppWidget.lightTextStyle()),
              const SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xffececf8),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                  maxLines: 4,
                  controller: _detailController,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ),
              const SizedBox(height: 20),
              Text("Product Category", style: AppWidget.lightTextStyle()),
              const SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xffececf8),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    onChanged: ((value) => setState(() {
                      this.value = value;
                    })),
                    items: categoryItems
                        .map(
                          (item) => DropdownMenuItem(
                            value: item,
                            child: Text(
                              item,
                              style: AppWidget.semiBoldTextStyle(),
                            ),
                          ),
                        )
                        .toList(),
                    dropdownColor: Colors.white,
                    hint: Text(
                      'Select',
                      style: AppWidget.lightSmallTextStyle(),
                    ),
                    iconSize: 36,
                    value: value,
                  ),
                ),
              ),
              const SizedBox(height: 40),

              GestureDetector(
                onTap: uploadItem,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: const Color(0xfffd6f3e),
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: const Center(
                    child: Text(
                      "Add Product",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
