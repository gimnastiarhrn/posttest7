import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posttest7/pages/add_widget/add_widget_controller.dart';
import 'package:posttest7/pages/dashboard/dashboard_page.dart';
import 'package:posttest7/pages/details/details_page.dart';
import 'package:posttest7/pages/home/home_page.dart';
import 'package:posttest7/pages/mainpage/mainpage_page.dart';

class AddWidgetPage extends GetView<AddWidgetController> {
  @override
  final AddWidgetController gt = Get.find();
  final AddWidgetController tc = Get.put(AddWidgetController());

  Future<dynamic> CustomAlert(BuildContext context, String pesan1){
    return showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(
          title: Text("Success"),
          backgroundColor: Colors.white,
          content : Container(child: Column(children: [
            Text("Widget berhasil ditambahkan"),
            Container(
              width: double.infinity,
              child: ElevatedButton(onPressed: () => Get.to(DashboardPage()), child: Text("OK")),
            ),
          ],
        ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference datawidget = firestore.collection("widget");

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 219, 219, 219),
      body: ListView(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(children: [
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width / 1.1,
                height: MediaQuery.of(context).size.height / 1.4,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 25,
                        margin: const EdgeInsets.only(
                          top: 5,),
                        child: const Center(child: Text("Menu Tambah Widget",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),)),
                        ),
                      Inputtextfield(context, "Nama Widget", tc.namaCtrl),
                      SizedBox(
                        width: 150,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            CreateDoc(name: gt.namaCtrl.text);
                            CustomAlert(context, gt.namaCtrl.text);
                            gt.namaCtrl.text ="";
                          }, 
                          child:const Text("Buat"),
                          style: ElevatedButton.styleFrom(primary: Color(0xFF00D7FF)),
                          ),
                      ),
                    ]),
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}

Widget Inputtextfield(context, String txt,final isi) {
  return Container(
    width: MediaQuery.of(context).size.width / 1.2,
    height: 50,
    margin: const EdgeInsets.only(
      top: 30,
    ),
    child: TextField(
      controller: isi,
      decoration: InputDecoration(        
        border: const OutlineInputBorder(),
        hintText: txt,
        fillColor: const Color(0xFFecf1f7),
        filled: true,
      ),
    ),
  );
}

Future CreateDoc({required String name}) async {
  final doc = FirebaseFirestore.instance.collection("widget").doc(name);

  final json = {
    "name" : name
  };

  await doc.set(json);
}


