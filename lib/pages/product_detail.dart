import 'package:addis_ecommerce/widgets/support_widget.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  ProductDetail({
    super.key,
    required this.detail,
    required this.image,
    required this.name,
    required this.price,
  });

  String image;
  String name;
  String detail;
  String price;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffef5f1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Top Section
              Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 20, top: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Icon(Icons.arrow_back_ios_new_outlined),
                    ),
                  ),

                  /// Product Image
                  Center(
                    child: Image.network(
                      widget.image,
                      height: 320, // reduced from 400
                    ),
                  ),
                ],
              ),

              /// Bottom White Section
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 25,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Product Title + Price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            widget.name,
                            style: AppWidget.boldTextStyle(),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          "\$" + widget.price,
                          style: const TextStyle(
                            color: Color(0xfffd6f3e),
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    /// Description Title
                    Text("Description", style: AppWidget.semiBoldTextStyle()),

                    const SizedBox(height: 10),

                    /// Description Text
                    Text(widget.detail),

                    const SizedBox(height: 40),

                    /// Buy Button
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      decoration: BoxDecoration(
                        color: const Color(0xfffd6f3e),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: double.infinity,
                      child: const Center(
                        child: Text(
                          "Buy Now",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
