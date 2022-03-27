import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  List<Contents>? data;
   MyDrawer({this.data}) : super();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(

        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 10),

        child: SizedBox(
          height: MediaQuery.of(context).size.height * 1,
         child: Column(
            children: [
              Flexible(
                child: ListView.builder(
                  itemCount: data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(data![index].iconName),
                        title: Text(data![index].title),
                      );


                    }),

              )
            ],
          ),
        ),
      ),
    );
  }
}

class Contents {
  final IconData iconName;
  final  String title;
  Contents({required this.iconName,required this.title});
}
