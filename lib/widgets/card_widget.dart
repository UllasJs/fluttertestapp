import 'package:flutter/material.dart';
import 'package:test_app/class/item_class.dart';
import 'package:test_app/core/constants.dart';
import 'package:test_app/screens/description_page.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.box,
  });
  final CardClass box;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return DescriptionPage(box: box);
          }),
        );
      },
      child: Card(
        elevation: 10.0,
        child: Container(
          width: double.infinity,
          color: Colors.transparent,
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: kdouble5,
              ),
              Image.asset(box.imagePath),
              Text(
                box.title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: AutofillHints.familyName,
                ),
              ),
              Text(
                'This is the description of ${box.title}',
              ),
              const SizedBox(
                height: kdouble10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
