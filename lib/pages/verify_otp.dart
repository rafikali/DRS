import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_page/Constants/Images.dart';
import 'package:login_page/Constants/app_constants.dart';
import 'package:login_page/pages/create_new_password.dart';
import 'package:login_page/utils/pref_services.dart';
import 'package:login_page/widgets/dropView.dart';
import 'package:login_page/widgets/login_button.dart';
import 'package:login_page/widgets/login_textfield.dart';
import 'package:login_page/widgets/otp_verification_textfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerifyOtp extends StatefulWidget {
  static const String routeName = '/verifyOtp';
  dynamic data;

   VerifyOtp({Key? key, this.data}) : super(key: key);

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
   String resentOtp = 'RESEND OTP';
   String getKey = "";

  @override
  void initState() {
    fetchMobileNumber();
    super.initState();
  }
   fetchMobileNumber() async{
    getKey = widget.data ?? "";
     // getKey = await PrefsServices().getString('Mobile Num');
   }

   @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color(0xFFF3F3F3),
        elevation: 0,
      ),
      body: InkWell(

        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Wrap(
                alignment: WrapAlignment.center,
                runSpacing: 20,
                spacing: 3,
                children:  [
                  SvgPicture.asset(
                    ImageConstants.verified,
                    height: 150,
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,),
                  const SizedBox(
                    height: 10,
                  ),

                  const Text('OTP Verification',
                    style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,

                  ),),
                  const SizedBox(
                    height: 10,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                     const Text("Enter the OTP sent to   +977",
                      style:  TextStyle(
                          fontSize: 15,
                      ),),
                      // Text(getKey.toString())
                      Text(AppConstants.mobileNumber, style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),),
                  ]
                  ),



                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OtpInput(),
                        OtpInput(),
                        OtpInput(),
                        OtpInput(),
                      ],
                    ),
                  ),


                  const Text('Didn\'t receive the OTP?'),

                  Button(
                      buttonTitle: 'VERIFY & PROCEED',
                      buttonHeight: 50.0,
                    validFunc: () {
                        Navigator.pushNamed(context, CreateNewPass.routeName);
                    },

                  )




                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


