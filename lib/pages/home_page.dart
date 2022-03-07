import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class HomePage extends StatefulWidget {
  static const String routeName = '/home';
  final IconData? usericon;
  final IconData? profileicon;
  const HomePage({this.usericon, this.profileicon}) : super();



  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String login_illustrate = 'assets/Images/login_image.svg';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Column(
          children: [
            Container(
              child: SvgPicture.asset(login_illustrate,
                height: 330,
                fit: BoxFit.contain,
              ),

            ),


            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 45),
              child: Form(
                child: Column(
                  children: [

                    TextFormField(
                      onTap: () {
                        
                      },
                      decoration:  InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(
                              style: BorderStyle.solid,
                              color: Colors.black,
                            ),
                        ),
                        labelText: 'Username',
                        hintText: 'Enter your Username',
                          prefixIcon: const Icon(CupertinoIcons.profile_circled,
                          color: Colors.black,
                            size: 28,

                          ),

                      ),
                    ),


                    const SizedBox(
                      height: 15,
                    ),

                    TextFormField(

                      decoration:  InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(
                                color: Colors.deepPurple

                            )
                        ),
                        labelText: 'Password',
                        hintText: 'Enter your Password',
                        prefixIcon: const Icon(CupertinoIcons.lock_circle_fill,
                          color: Colors.black,
                          size: 28,
                        ),


                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: const Text('Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: <Color> [Colors.deepPurpleAccent, Colors.black]
                        ),
                        color: Colors.indigoAccent,
                        borderRadius: BorderRadius.circular(8)
                      ),
                      width: 120,
                      height: 45,
                      alignment: Alignment.center,



                    )

                  ],
                ),
              ),
            )



          ],
        ),
      ),
    );
    {

    }}
}
