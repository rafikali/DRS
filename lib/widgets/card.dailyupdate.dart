import 'package:flutter/material.dart';

class CardDailyUpdate extends StatelessWidget {
  final title;
  final updatetitle;
  final updatedate;
  final updatetasks;

  const CardDailyUpdate(
      {Key? key,
      this.title,
      this.updatetitle,
      this.updatedate,
      this.updatetasks})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [

              Text(
                title,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4, right: 48),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      updatetitle,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const Text(
                      'Title',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
              const Divider(),
              Expanded(
                child: ListTile(
                  leading: Text(updatetasks),
                  title: Column(
                    children: [
                      Text(updatetasks),
                      Text(updatetasks),
                      Text(updatetasks),
                      Text(updatetasks),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
