import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posttest7/pages/add_widget/add_widget_page.dart';
import 'package:posttest7/pages/dashboard/dashboard_page.dart';
import 'package:posttest7/pages/details/details_page.dart';
import 'package:posttest7/pages/mainpage/mainpage_controller.dart';
import 'package:posttest7/pages/mainpage/widget_card.dart';

class MainPage extends GetView<MainpageController> {

  final MainpageController gt = Get.find();
  final MainpageController tc = Get.put(MainpageController());
  @override

  Future<dynamic> UpdateAlert(BuildContext context){
    return showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(
          title: Text("Update Menu"),
          backgroundColor: Colors.white,
          content : Column(children: [Inputtextfield(context, "Nama Baru Widget", tc.namaCtrl),
          Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {CreateDoc(name: gt.namaCtrl.text);
                Navigator.of(context).pop();},
               child: Text("OK")),
            ),
          ],
          ),
        );
      },
    );
  }

 Widget build(BuildContext context) {
   FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference datawidget = firestore.collection("widget");
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Positioned(
                  top: 20,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: MediaQuery.of(context).size.height / 5,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromARGB(255, 0, 162, 255),
                              Color.fromARGB(255, 66, 45, 255),
                            ]),
                         boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 0),
                            blurRadius: 10,
                            spreadRadius: 0.2,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                              top: MediaQuery.of(context).size.height / 17,
                              left: MediaQuery.of(context).size.width / 7,
                              child: Image.asset("assets/smarthome.png")),
                          Positioned(
                            width: MediaQuery.of(context).size.width / 1.2,
                            top: MediaQuery.of(context).size.height / 17,
                            child: Center(
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                width: MediaQuery.of(context).size.width / 200,
                                height: MediaQuery.of(context).size.height / 11,
                              ),
                            ),
                          ),
                          Positioned(
                            top: MediaQuery.of(context).size.height / 15,
                            left: MediaQuery.of(context).size.width / 1.9,
                            child: const Text(
                              "All Devices",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ),
                          Positioned(
                            top: MediaQuery.of(context).size.height / 9,
                            left: MediaQuery.of(context).size.width / 1.9,
                            child: const Text(
                              "69 devices",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 150,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 250,
                    padding: EdgeInsets.all(18),
                    child: ListView(
                        scrollDirection: Axis.vertical,
                        padding: EdgeInsets.all(30),
                        children: [
                          StreamBuilder<QuerySnapshot>(
                            stream: datawidget.snapshots(),
                            builder: (_, snapshot) {
                              return (snapshot.hasData) 
                                ? Column(
                                  children: snapshot.data!.docs
                                  .map(
                                    (e) => ItemCard(e.get('name'),
                                    onUpdate: () {datawidget.doc(e.id).delete();
                                    UpdateAlert(context);},
                                    onDelete: () { datawidget.doc(e.id).delete();},)
                                )
                                .toList()
                                )
                                : Text("Loading....");
                            }
                            ),
                            ElevatedButton(
                          child: Icon(Icons.add_circle_outlined),
                          onPressed: () => Get.to(AddWidgetPage()),
                        ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



