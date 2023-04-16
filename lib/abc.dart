import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../Provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtjob = TextEditingController();

  HomeProvider? homeProviderT;
  HomeProvider? homeProviderF;

  @override
  Widget build(BuildContext context) {
    homeProviderT = Provider.of<HomeProvider>(context, listen: true);
    homeProviderF = Provider.of<HomeProvider>(context, listen: false);
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "PostApi",
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.amber.shade500,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: txtname,
                  cursorColor: Colors.amber.shade200,
                  decoration: InputDecoration(
                    hintText: 'Enter your name',
                    label: Text(
                      "Name",
                      style: TextStyle(
                        color: Colors.green,
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
                        color: Colors.amber.shade500,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: txtjob,
                  cursorColor: Colors.amber.shade200,
                  decoration: InputDecoration(
                    hintText: 'Enter Job Details',
                    label: Text(
                      "Job",
                      style: TextStyle(
                        color: Colors.green,
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
                        color: Colors.amber.shade500,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: StadiumBorder(),
                      backgroundColor: Colors.green.shade700),
                  onPressed: () async {
                    String name = txtname.text;
                    String job = txtjob.text;

                    String? msg = await homeProviderT!.postApi(name, job);

                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('${msg}')));
                    txtname.clear();
                    txtjob.clear();
                  },
                  child: Text(
                    "Send",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                    ),
                  ))
            ],
          ),
        ));
  }
}