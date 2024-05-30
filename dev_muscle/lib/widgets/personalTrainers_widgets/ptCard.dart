import 'package:dev_muscle/components/styles.dart';
import 'package:dev_muscle/variables/colors.dart';
import 'package:dev_muscle/pages/main/pages/personaltrainersList/ptInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PTCard extends StatelessWidget {
  Map<String, dynamic> trainer;
  PTCard({super.key, required this.trainer});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: button_color,
      child: ListTile(
        contentPadding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
        leading: const CircleAvatar(
          maxRadius: 35,
          backgroundImage: AssetImage("assets/images/pp.png"),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(trainer["Name"], style: TextStyles.PTCardTitleTextStyle()),
              Text(trainer["ProfessionField"],
                  style: TextStyles.PTCardTitle2TextStyle())
            ],
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Text(
            trainer['Description'],
            overflow: TextOverflow.ellipsis,
            style: TextStyles.PTCardSubtitleTextStyle(),
          ),
        ),
        trailing: const Icon(Icons.turn_right_sharp, color: Colors.white),
        onTap: () {
          Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => PTInfo(
                  trainer: trainer,
                ),
              ));
        },
      ),
    );
  }
}
