import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hesap Makinesi',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const HesapMakinesi(),
    );
  }
}

class HesapMakinesi extends StatefulWidget {
  const HesapMakinesi({Key? key}) : super(key: key);

  @override
  _HesapMakinesiState createState() => _HesapMakinesiState();
}

class _HesapMakinesiState extends State<HesapMakinesi> {
  double sayi1 = 0;
  double sayi2 = 0;
  String sonuc = "0";
  String _sonuc = "0";
  String operator = "";

  buttonaTiklandiginda(String buttonText) {
    if (buttonText == "C") {
      sayi1 = 0;
      sayi2 = 0;
      _sonuc = "0";
      operator = "";
    } else if (buttonText == "X" ||
        buttonText == "-" ||
        buttonText == "+" ||
        buttonText == "/") {
      sayi1 = double.parse(sonuc);
      operator = buttonText;
      _sonuc = "0";
    } else if (buttonText == "=") {
      sayi2 = double.parse(sonuc);
      if (operator == "+") {
        _sonuc = (sayi1 + sayi2).toString();
      }
      if (operator == "-") {
        _sonuc = (sayi1 - sayi2).toString();
      }
      if (operator == "X") {
        _sonuc = (sayi1 * sayi2).toString();
      }
      if (operator == "/") {
        _sonuc = (sayi1 / sayi2).toString();
      }
      sayi1 = 0;
      sayi2 = 0;
      operator = "";
    } else {
      _sonuc = _sonuc + buttonText;
    }
    setState(() {
      sonuc = double.parse(_sonuc).toStringAsFixed(0);
    });
  }

  Widget buttonTasarla(String buttonText, bool isEqualButton) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: SizedBox(
          height: 80,
          child: isEqualButton
              ? OutlinedButton(
                  onPressed: () => buttonaTiklandiginda(buttonText),
                  style:
                      OutlinedButton.styleFrom(backgroundColor: Colors.black87),
                  child: Text(
                    buttonText,
                    style: const TextStyle(fontSize: 24, color: Colors.white),
                  ),
                )
              : OutlinedButton(
                  onPressed: () => buttonaTiklandiginda(buttonText),
                  style: OutlinedButton.styleFrom(
                      backgroundColor: const Color(0xFFF9F9F9)),
                  child: Text(
                    buttonText,
                    style: const TextStyle(fontSize: 24, color: Colors.black87),
                  ),
                ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F3F3),
      body: Padding(
        padding: const EdgeInsets.all(6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    sonuc,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        fontSize: 50),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.black87,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buttonTasarla("7", false),
                buttonTasarla("8", false),
                buttonTasarla("9", false),
                buttonTasarla("X", false),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buttonTasarla("4", false),
                buttonTasarla("5", false),
                buttonTasarla("6", false),
                buttonTasarla("-", false),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buttonTasarla("1", false),
                buttonTasarla("2", false),
                buttonTasarla("3", false),
                buttonTasarla("+", false),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buttonTasarla("C", false),
                buttonTasarla("0", false),
                buttonTasarla("/", false),
                buttonTasarla("=", true)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
