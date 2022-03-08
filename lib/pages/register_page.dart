
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/widgets/login_textfield.dart';




class RegisterPage extends StatefulWidget {
  static const String routeName = '/Register';
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200.0),
        child: AppBar(
          backgroundColor: Colors.indigo[600],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.elliptical(150, 35),
            )
          ),

        ),

      ),
      body: ListView(
        children:  [
         ListTile(
           leading: Icon(CupertinoIcons.profile_circled,
           color: Colors.blue,
           size: 40,),
           contentPadding: EdgeInsets.zero,
           title: LoginTextForm(hintText: 'hintText', labelText: 'hey'),

         )

        ],
      ),
      // body: NestedScrollView(
      //   headerSliverBuilder: (BuildContext context, bool) {
      //     return <Widget> [
      //        SliverAppBar(
      //         
      //         backgroundColor: Colors.indigo[600],
      //         expandedHeight: 150,
      //         floating: true,
      //         pinned: true,
      //         snap: true,
      //       )
      //     ];
      //   },
      //   body:Padding(
      //     padding: const EdgeInsets.all(10.0),
      //     child: Column(
      //         children:  [
      //     ListTile(
      //     title: Row(
      //     children: const [
      //         Icon(CupertinoIcons.profile_circled),
      //     Expanded(
      //       child: LoginTextForm(
      //           hintText: ' username', labelText: 'Username'),
      //     ),
      //
      //     ],
      //   )
      //
      // ) ,
      // ]
      // ),
    // appBar: AppBar(
    //   shape: const RoundedRectangleBorder(
    //
    //     borderRadius: BorderRadius.vertical(
    //       bottom: Radius.circular(10)
    //     )
    //   ),
    // ),

      // body:



        
        


    );
  }
}
