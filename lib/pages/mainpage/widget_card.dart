import 'package:flutter/material.dart';
class ItemCard extends StatelessWidget {
  final String name;

  final Function? onUpdate;
  final Function? onDelete;

  ItemCard(this.name,{this.onUpdate, this.onDelete});

  @override
  Widget build(BuildContext context) {
  return Container(
    width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xfff78000))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      
      // Positioned(
      //   top: 50,
      //   width: MediaQuery.of(context).size.width / 2.5,
      //   child: Center(
      //     child: Image.asset(
      //       file,
      //       alignment: Alignment.center,
      //     ),
      //   ),
      // ),
      Center(
          child: Text(
            name,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 14,
              letterSpacing: 1.5,
            ),
          ),
        ),
        Row(
            children: [
              SizedBox(
                height: 40,
                width: 60,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      primary: Colors.green[900],
                    ),
                    child: Center(
                        child: Icon(
                      Icons.arrow_upward,
                      color: Colors.white,
                    )),
                    onPressed: () {
                      if (onUpdate != null) onUpdate!();
                    }),
              ),
              SizedBox(
                height: 40,
                width: 60,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      primary: Colors.red[900],
                    ),
                    child: Center(
                        child: Icon(
                      Icons.delete,
                      
                      color: Colors.white,
                    )),
                    onPressed: () {
                      if (onDelete != null) onDelete!();
                    }),
              )
            ],
          )
    ]),
  );
}
}