import 'package:flutter/material.dart';

class UCardWidget extends StatelessWidget {
  const UCardWidget({
    super.key,
    required this.context,
    required this.text,
    required this.labelText,
    required this.controller
  });

  final BuildContext context;
  final String text;
  final String labelText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xffE9ECEF),
      elevation: 8,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
      ),
      shadowColor: Color(0xff758BFD),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)
          ),
          Padding(
            padding:
            const EdgeInsets.only(bottom: 20, top: 5, left: 5, right: 5),
            child: SizedBox(
              height: MediaQuery.of(context).size.height*0.06,
              child: TextFormField(
                controller: controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    label: Text(labelText, style: TextStyle(fontWeight: FontWeight.bold),),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
            ),
          )
        ],
      ),
    );
  }
}