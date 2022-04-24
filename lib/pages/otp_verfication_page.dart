// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_page/Constants/Images.dart';
import 'package:login_page/Constants/app_constants.dart';
import 'package:login_page/pages/create_new_password.dart';
import 'package:login_page/widgets/login_button.dart';
import 'package:login_page/widgets/otp_verification_textfield.dart';

class OtpVerification extends StatefulWidget {
  static const String routeName = '/verifyOtp';
  dynamic data;

  OtpVerification({Key? key, this.data}) : super(key: key);

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  String resentOtp = 'RESEND OTP';
  String getKey = "";

  @override
  void initState() {
    fetchMobileNumber();
    super.initState();
  }

  fetchMobileNumber() async {
    getKey = widget.data ?? "";
    // getKey = await PrefsServices().getString('Mobile Num');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme
      //   elevation: 0,
      // ),
      body: InkWell(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                ImageConstants.verified,
                height: 200,
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'OTP Verification',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  "Enter the OTP sent to +977",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(getKey.toString()),
                // Text(
                //   AppConstants.mobileNumber,
                //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                // ),
              ]),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30.0),
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
    );
  }
}
