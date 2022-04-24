import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewPassAppbar extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  const NewPassAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(

        // iconTheme: Theme.of(context).iconTheme,
        elevation: 0,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Text(
            'Back',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          InkWell(
              onTap: () {
                const Tooltip(
                  message: ('hi'),
                );
              },
              child: const Icon(
                CupertinoIcons.question_circle,
              ))
        ]));
  }
}
