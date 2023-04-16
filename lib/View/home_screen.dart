import 'package:ecommerce_getpost_api/Model/product_model.dart';
import 'package:ecommerce_getpost_api/Provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? homeProviderT;
  HomeProvider? homeProviderF;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<HomeProvider>(context, listen: false).getProduct();
  }

  @override
  Widget build(BuildContext context) {
    homeProviderT = Provider.of<HomeProvider>(context, listen: true);
    homeProviderF = Provider.of<HomeProvider>(context, listen: false);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Product App"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: homeProviderF!.getProduct(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.hasData) {
            List<dynamic>? productModelList = snapshot.data;
            return Stack(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: productModelList!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Text(
                              "${homeProviderF!.productList[index].p_offer}"),
                          title: Text(
                            "${homeProviderF!.productList[index].p_name}",
                          ),
                          subtitle: Text(
                              "price  :${homeProviderF!.productList[index].p_rate}"),
                          trailing: Text(
                              "${homeProviderF!.productList[index].p_desc}"),
                        ),
                      );
                    },
                  ),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: FloatingActionButton(
                          onPressed: () {
                            Get.toNamed('second');
                          },
                          child: Icon(Icons.add)),
                    )),
              ],
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    ));
  }
}
