import 'package:addis_ecommerce/pages/product_detail.dart';
import 'package:addis_ecommerce/services/database.dart';
import 'package:addis_ecommerce/widgets/support_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductCategory extends StatefulWidget {
  String category;
  ProductCategory({super.key, required this.category});

  @override
  State<ProductCategory> createState() => _ProductCategoryState();
}

class _ProductCategoryState extends State<ProductCategory> {
  Stream? categoryStream;

  void getOnTheLoad() async {
    categoryStream = await DatabaseMethods().getProducts(widget.category);
    setState(() {});
  }

  @override
  initState() {
    getOnTheLoad();
    super.initState();
  }

  Widget allProducts() {
    return StreamBuilder(
      stream: categoryStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.6,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Image.network(
                          ds["Image"],
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 10),
                        Text(ds["Name"], style: AppWidget.semiBoldTextStyle()),
                        Spacer(),
                        Row(
                          children: [
                            Text(
                              // ignore: prefer_interpolation_to_compose_strings
                              "\$" + ds["Price"],
                              style: TextStyle(
                                color: const Color(0xfffd6f3e),
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetail(
                                      detail: ds["Detail"],
                                      image: ds["Image"],
                                      name: ds["Name"],
                                      price: ds["Price"],
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: const Color(0xfffd6f3e),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Icon(Icons.add, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              )
            : Container();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      appBar: AppBar(backgroundColor: Color(0xfff2f2f2)),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Column(children: [Expanded(child: allProducts())]),
      ),
    );
  }
}
