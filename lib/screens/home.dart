import 'package:flutter/material.dart';
import 'package:test_app/class/item_class.dart';
import 'package:test_app/widgets/card_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.music_note,
        ),
        title: const Text(
          'Music',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        // backgroundColor: Colors.pink,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            iconSize: 24,
            padding: const EdgeInsets.only(right: 15),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardWidget(
              box: CardClass(
                title: 'Rocket',
                imagePath: 'images/rocket.png',
              ),
            ),
            Row(children: [
              Expanded(
                child: CardWidget(
                  box: CardClass(
                    title: 'Space',
                    imagePath: 'images/space.png',
                  ),
                ),
              ),
              Expanded(
                child: CardWidget(
                  box: CardClass(
                    title: 'Travel',
                    imagePath: 'images/travel.png',
                  ),
                ),
              ),
            ]),
            CardWidget(
              box: CardClass(
                title: 'Yeah',
                imagePath: 'images/yeah.png',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
