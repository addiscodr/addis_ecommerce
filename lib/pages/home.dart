import 'package:addis_ecommerce/pages/product_category.dart';
import 'package:addis_ecommerce/services/shared_pref.dart';
import '../widgets/support_widget.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> categories = [
    "images/headphone_icon.png",
    "images/laptop_icon.png",
    "images/tv_icon.png",
    "images/watch_icon.png",
  ];

  List categoryName = ["Headphone", "Laptop", "TV", "Watch"];

  String? name;

  getSharedPref() async {
    name = await SharedPreferenceHelper().getUserName();

    setState(() {});
  }

  onTheLoad() async {
    await getSharedPref();
    setState(() {});
  }

  void initState() {
    super.initState();
    onTheLoad();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 50, left: 15, bottom: 15),
            child: name == null
                ? Center(child: CircularProgressIndicator())
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hey, " + name!, style: AppWidget.boldTextStyle()),
                      Text("Good Morning", style: AppWidget.lightTextStyle()),
                      SizedBox(height: 30),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: EdgeInsets.only(right: 15),
                        width: MediaQuery.of(context).size.width,
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search for products...",
                            hintStyle: AppWidget.lightTextStyle(),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        margin: EdgeInsets.only(right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Categories",
                              style: AppWidget.semiBoldTextStyle(),
                            ),
                            Text(
                              "See all",
                              style: TextStyle(
                                color: const Color(0xfffd6f3e),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Container(
                            height: 130,
                            padding: EdgeInsets.all(20),
                            margin: EdgeInsets.only(right: 20),
                            decoration: BoxDecoration(
                              color: Color(0xfffd6f3e),
                              borderRadius: BorderRadius.circular(10),
                            ),

                            child: Center(
                              child: Text(
                                "All",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),

                          Expanded(
                            child: Container(
                              height: 130,
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: categories.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return CategoryTile(
                                    image: categories[index],
                                    name: categoryName[index],
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        margin: EdgeInsets.only(right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "All Products",
                              style: AppWidget.semiBoldTextStyle(),
                            ),
                            Text(
                              "See all",
                              style: TextStyle(
                                color: const Color(0xfffd6f3e),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: 220,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 20),
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                    "images/headphone_icon2.png",
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "Headphone",
                                    style: AppWidget.semiBoldTextStyle(),
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Text(
                                        "\$100.00",
                                        style: TextStyle(
                                          color: const Color(0xfffd6f3e),
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(width: 40),
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: const Color(0xfffd6f3e),
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.only(right: 20),
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                    "images/watch2.jpg",
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "Watch",
                                    style: AppWidget.semiBoldTextStyle(),
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Text(
                                        "\$80.00",
                                        style: TextStyle(
                                          color: const Color(0xfffd6f3e),
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(width: 40),
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: const Color(0xfffd6f3e),
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 20),
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                    "images/laptop_icon.png",
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "Laptop",
                                    style: AppWidget.semiBoldTextStyle(),
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Text(
                                        "\$590.00",
                                        style: TextStyle(
                                          color: const Color(0xfffd6f3e),
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(width: 40),
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: const Color(0xfffd6f3e),
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CategoryTile extends StatelessWidget {
  String image;
  String name;
  CategoryTile({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductCategory(category: name),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(image, height: 30, width: 30, fit: BoxFit.cover),
            Icon(Icons.arrow_forward),
          ],
        ),
      ),
    );
  }
}
