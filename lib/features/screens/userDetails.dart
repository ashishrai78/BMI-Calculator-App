
import 'package:bmicalculator/common/widgets/textFormField_widget.dart';
import 'package:bmicalculator/features/controller/userDetails_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class UserDetail extends StatelessWidget {
  const UserDetail({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserDetailsController());
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xfffbc2eb),
                  Color(0xffa6c1ee),
                ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 1.0)
            )
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Text('Enter Some Details',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                    ),


                    UTextFormField(controller: controller.nameControl, labelText: 'Name', hintText: 'Enter your Name',),
                    SizedBox(height: 20),

                    UTextFormField(controller: controller.ageControl, labelText: 'Age', hintText: 'Enter your Age',),

                    SizedBox(height: 20),

                    // Button
                    ElevatedButton(
                      onPressed: (){
                        controller.saveData(controller.nameControl, controller.ageControl);
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.only(
                              top: 4, bottom: 4, left: 50, right: 50),
                          backgroundColor: Color(0xff758BFD),
                          foregroundColor: Colors.white,
                          shadowColor: Color(0xff758BFD),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: Text(
                        'Save',
                        style: TextStyle(fontSize: 22),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}


