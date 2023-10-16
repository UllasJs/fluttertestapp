import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/class/item_class.dart';
import 'package:test_app/core/constants.dart';

class DescriptionPage extends StatefulWidget {
  const DescriptionPage({super.key, required this.box});

  final CardClass box;

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  double fontsizeCustom = 25.0;

  @override
  void initState() {
    super.initState();

    loadFontSize();
  }

  Future<void> saveFontSize(double fontSize) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('fontSizeCustom', fontSize);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.dangerous),
        ),
        title: Text(
          widget.box.title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: kdouble10),
            child: IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Text'),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                icon: const Icon(
                  Icons.info,
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kdouble10),
          child: Column(
            children: [
              Image.asset(widget.box.imagePath),
              Wrap(
                spacing: kdouble10,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        fontsizeCustom = 25;
                        saveFontSize(fontsizeCustom);
                      });
                    },
                    child: const Text('Small Title'),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        fontsizeCustom = 50;
                        saveFontSize(fontsizeCustom);
                      });
                    },
                    child: const Text('Medium Title'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        fontsizeCustom = 80;
                        saveFontSize(fontsizeCustom);
                      });
                    },
                    child: const Text('Large Title'),
                  ),
                  FilledButton(
                    onPressed: () {
                      setState(() {
                        fontsizeCustom = 200;
                        saveFontSize(fontsizeCustom);
                      });
                    },
                    child: const Text('Huge Title'),
                  ),
                ],
              ),
              FittedBox(
                child: Text(
                  widget.box.title,
                  style: TextStyle(
                    fontSize: fontsizeCustom,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Text(
                baconDescription,
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: kdouble20),
              const Text(
                baconDescription,
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> loadFontSize() async {
    final prefs = await SharedPreferences.getInstance();
    final savedFontSize = prefs.getDouble('fontSizeCustom'); // Default to 25.0 if no value is found
    if (savedFontSize != null) {
      setState(() {
        fontsizeCustom = savedFontSize;
      });
    }
  }
}
