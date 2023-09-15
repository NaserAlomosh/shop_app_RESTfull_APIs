import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageViewItem extends StatelessWidget {
  final String title;

  final String subTitle;

  final String image;

  const PageViewItem(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20, left: 20, top: 8),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text: subTitle,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ]),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 30,
          child: Image.asset(image),
        ),
      ],
    );
  }
}
