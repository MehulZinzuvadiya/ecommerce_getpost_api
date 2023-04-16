import 'package:ecommerce_getpost_api/Model/product_model.dart';
import 'package:ecommerce_getpost_api/Provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtrate = TextEditingController();
  TextEditingController txtprice = TextEditingController();
  TextEditingController txtoffer = TextEditingController();
  TextEditingController txtdesc = TextEditingController();
  TextEditingController txtcategory = TextEditingController();

  HomeProvider? homeProviderT;
  HomeProvider? homeProviderF;

  List<ProductModel> myData = [];

  @override
  Widget build(BuildContext context) {
    homeProviderT = Provider.of<HomeProvider>(context, listen: true);
    homeProviderF = Provider.of<HomeProvider>(context, listen: false);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Enter Data"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: txtname,
                cursorColor: Colors.amber.shade200,
                decoration: InputDecoration(
                  hintText: 'Enter name',
                  label: Text(
                    "Name",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    borderSide: BorderSide(
                      color: Colors.grey.shade700,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: txtrate,
                cursorColor: Colors.amber.shade200,
                decoration: InputDecoration(
                  hintText: 'Enter rating',
                  label: Text(
                    "rating",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    borderSide: BorderSide(
                      color: Colors.grey.shade700,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: txtprice,
                cursorColor: Colors.amber.shade200,
                decoration: InputDecoration(
                  hintText: 'Enter Price',
                  label: Text(
                    "Price",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    borderSide: BorderSide(
                      color: Colors.grey.shade700,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: txtoffer,
                cursorColor: Colors.amber.shade200,
                decoration: InputDecoration(
                  hintText: 'Enter Offer',
                  label: Text(
                    "Offer",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    borderSide: BorderSide(
                      color: Colors.grey.shade700,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: txtdesc,
                cursorColor: Colors.amber.shade200,
                decoration: InputDecoration(
                  hintText: 'Enter Description',
                  label: Text(
                    "Describe",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    borderSide: BorderSide(
                      color: Colors.grey.shade700,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: txtcategory,
                cursorColor: Colors.amber.shade200,
                decoration: InputDecoration(
                  hintText: 'Enter Category',
                  label: Text(
                    "Category",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    borderSide: BorderSide(
                      color: Colors.grey.shade700,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple.shade700,
                  shape: OvalBorder(),
                ),
                onPressed: () {
                  ProductModel p1 = ProductModel(
                    p_name: txtname.text,
                    p_rate: txtrate.text,
                    p_price: txtprice.text,
                    p_offer: txtoffer.text,
                    p_desc: txtdesc.text,
                    p_category: txtcategory.text,
                  );
                  // myData.add(p1);
                  homeProviderF!.productPostdata(
                      txtname.text,
                      txtrate.text,
                      txtprice.text,
                      txtoffer.text,
                      txtdesc.text,
                      txtcategory.text);
                  Get.back();
                },
                child: Text(
                  "Send Data",
                  style: GoogleFonts.lato(fontSize: 16),
                )),
          ],
        ),
      ),
    ));
  }
}
