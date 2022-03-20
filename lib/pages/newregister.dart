import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:login_page/Constants/Images.dart';
import 'package:login_page/pages/home_page.dart';
import 'package:login_page/pages/models.dart';
import 'package:login_page/utils/input_validators.dart';
import 'package:login_page/widgets/checkbox_listtile.dart';
import 'package:login_page/widgets/login_button.dart';
import 'package:login_page/widgets/login_textfield.dart';

import '../widgets/dropView.dart';


class Register extends StatefulWidget {
  static const String routeName = '/Register';
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}
// Future fetchData() async {
//   var response = await http.get(Uri.parse('https://randomuser.me/api/'));
//   var responseData = jsonDecode(response.body);
//   var bodyData = Models.fromJson(responseData);
//   if(response.statusCode == 200) {
//     print(bodyData.info?.seed.toString());
//     return bodyData.results;
//   }
// }

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Container(

                width: MediaQuery.of(context).size.width,
                child: Wrap(
                  runSpacing: 12,
                    spacing: 10,
                    children: [
                      Center(
                        child: SvgPicture.asset(ImageConstants.regis,
                          alignment: AlignmentDirectional.center,
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.contain,
                        ),
                      ),

                      const Text('Full Name',
                      ),
                      LoginTextForm(
                          hintText: 'Enter Your Name',
                        validator: InputValidator.validateFullname,
                      ),


                      const Text('Mobile Number'),
                      LoginTextForm(
                        typeKeyboard: TextInputType.number,
                           hintText: 'Enter Mobile Number',
                        validator: InputValidator.validateMobile,

                      ),
                      const Text('Email'),
                      LoginTextForm(
                          hintText: 'Enter Email',
                        validator: InputValidator.validateEmail,

                      ),
                      const Text('Current Address'),
                      LoginTextForm(
                          hintText: 'Enter Current Address',
                        validator: InputValidator.validateAddress,

                      ),

                      const Text('Date of Birth'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children:  [
                          DropView(hintText: 'here', labelText: 'here',
                            dropTrailing: CupertinoIcons.chevron_down_circle_fill,
                            height: 60.0,
                            width: 100.0,
                            date: 'YYYY',

                            dropdownItems: const ["1991", "1992", "1993","2001", "2002", "2003", "2004","2005", "2006", "2007",],
                          ),

                          DropView(hintText: 'here', labelText: 'here',
                            dropTrailing: CupertinoIcons.chevron_down_circle_fill,
                            height: 60.0,
                            width: 100.0,
                            date: 'MM',
                            dropdownItems: const ["Jan", "Feb", "Mar", "April","May", "June","July", "Aug", "Sep", "Oct", "Nov", "Dec"],


                          ),

                          DropView(hintText: 'here', labelText: 'here',

                            dropTrailing: CupertinoIcons.chevron_down_circle_fill,
                            height: 60.0,
                            width: 100.0,
                            date: 'DD',
                            dropdownItems: const [01, 02, 03, 04,  05, 06, 07, 08, 09, 10, 11, 12 ,13, 14],



                          ),

                        ],
                      ),
                     const CheckBox(
                        checkValue: true,
                        labelTitle: 'I accept the terms & conditions',
                       ),





                      LoginButton(
                        validFunc: () {
                          if(_formKey.currentState!.validate()) {
                            Navigator.pushNamed(context, HomePage.routeName);
                          } else {
                            return null;
                          }
                        },
                        buttonTitle: 'Submit',
                          buttonHeight: 45.0,
                          buttonColor: Colors.white,
                          buttonWidth: 370.0,
                      ),







                ],),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


