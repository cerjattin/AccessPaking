import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class Loginform extends StatelessWidget {
  const Loginform({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: const Column(
        children: <Widget>[
          CupertinoTextField(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            placeholder: "Email Address",
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(color: Colors.grey, width: 1),
            )),
          ),
          SizedBox(
            height: 200,
          ),
        ],
      ),
    );
  }
}
