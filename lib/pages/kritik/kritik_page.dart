import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posttest7/pages/kritik/kritik_controller.dart';

class KritikPage extends GetView<KritikController> {
  @override
  final KritikController gt = Get.find();
  final KritikController tc = Get.put(KritikController());

  Future<dynamic> CustomAlert(BuildContext context, String pesan1){
    return showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(
          title: Text("Success"),
          backgroundColor: Colors.white,
          content : Container(child: Column(children: [
            Text("Hi, $pesan1 terimakasih atas kritik dan sarannya"),
            Text("Kami akan berusaha semaksimal mungkin untuk terus memperbaiki aplikasi kami"),
            Text(""),
            Text(""),
            Text("Salam Hangat, Pembuat."),
          ],)),
          actions: [
            Container(
              width: double.infinity,
              child: ElevatedButton(onPressed: () {Navigator.of(context).pop();}, child: Text("Back")),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
                        child: const Center(child: Text("Menu Kritik & Saran",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),)),
                        ),
                      Inputtextfield(context, "Nama Lengkap", tc.namaCtrl),
                      Inputtextfield(context, "Email", tc.emailCtrl),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        margin: const EdgeInsets.only(
                          top: 30,
                          bottom: 35,
                        ),
                        child: TextFormField(
                          controller: tc.kritikCtrl,
                          decoration:const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: "Kritik & Saran",
                            hintText: "Masukkan kritik/saran anda",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            CustomAlert(context, gt.namaCtrl.text);
                          }, 
                          child:const Text("Kirim"),
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


