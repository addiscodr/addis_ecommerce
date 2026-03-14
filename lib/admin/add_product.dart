import 'package:addis_ecommerce/widgets/support_widget.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final List<String> categoryItems = ['Watch', 'Laptop', 'TV', 'Headphone'];
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
      body: Container(
        margin: EdgeInsets.only(left: 20, top: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Upload Product Image", style: AppWidget.lightTextStyle()),
            const SizedBox(height: 20),
            Center(
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(Icons.camera_alt_outlined, size: 50),
              ),
            ),
            const SizedBox(height: 20),
            Text("Product Name", style: AppWidget.lightTextStyle()),
            const SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xffececf8),
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            const SizedBox(height: 40),
            Text("Product Category", style: AppWidget.lightTextStyle()),
            const SizedBox(height: 20),
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
                  hint: Text('Select'),
                  iconSize: 36,
                  value: value,
                ),
              ),
            ),
            const SizedBox(height: 30),

            Container(
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
          ],
        ),
      ),
    );
  }
}
