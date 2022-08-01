import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => AspectRatio(
        aspectRatio: 1.23,
        child: Container(
          color: Color(0xFF242430),
          child: Column(
            children: [
              Spacer(flex: 2),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/images/profile.jpg"),
              ),
              Spacer(),
              Text(
                "David Njuguna",
                style: Theme.of(context).textTheme.subtitle2,
              ),
              Text(
                "Mobile Application Developer",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  height: 1.5,
                ),
              ),
              Spacer(flex: 2),
            ],
          ),
        ),
      );
}
