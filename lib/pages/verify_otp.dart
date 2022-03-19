import 'package:flutter/material.dart';
import 'package:login_page/Constants/Images.dart';
import 'package:login_page/pages/create_new_password.dart';
import 'package:login_page/widgets/dropView.dart';
import 'package:login_page/widgets/login_button.dart';
import 'package:login_page/widgets/login_textfield.dart';

class VerifyOtp extends StatefulWidget {
  static const String routeName = '/verifyOtp';

  const VerifyOtp({Key? key}) : super(key: key);

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
   String resentOtp = 'RESEND OTP';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF3F3F3),
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Wrap(
              alignment: WrapAlignment.center,
              runSpacing: 20,
              children:  [
                Image.asset(ImageConstants.branding),
                const SizedBox(
                  height: 10,
                ),

                const Text('OTP Verification', style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),),
                const SizedBox(
                  height: 10,
                ),
                const Text('Enter the OTP sent to +977 9867086525',
                style: TextStyle(
                  fontSize: 15
                ),),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(child: LoginTextForm(hintText: '0', typeKeyboard: TextInputType.number,), ),
                    Flexible(child: LoginTextForm(hintText: '0', typeKeyboard: TextInputType.number )),
                    Flexible(child: LoginTextForm(hintText: '0', typeKeyboard: TextInputType.number)),
                    Flexible(child: LoginTextForm(hintText: '0', typeKeyboard: TextInputType.number)),

                  ],

                ),


                const Text('Didnt receive the OTP?  RESEND OTP'),

                LoginButton(
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
    );
  }
}
