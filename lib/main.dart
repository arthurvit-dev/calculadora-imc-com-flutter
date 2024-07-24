import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: myapp(),
  ));
}

class myapp extends StatefulWidget {
  const myapp({super.key});

  @override
  State<myapp> createState() => _myappState();
}

class _myappState extends State<myapp> {
  void restart() {
    setState(() {
      PesoController.text = "";
      AlturaController.text = "";

      _infoText = "Informe seus dados !";
    });
  }

  TextEditingController PesoController = TextEditingController();

  TextEditingController AlturaController = TextEditingController();

  String _infoText = "Informe seus dados !";

  void calculator() {
    double peso = double.parse(PesoController.text);
    double altura = double.parse(AlturaController.text) / 100;
    double imc = peso / (altura * altura);

    setState(() {
      if (imc < 16) {
        _infoText = "magreza grave (${imc.toStringAsPrecision(4)})";
      } else if (imc <= 16.91) {
        _infoText = "magreza moderada (${imc.toStringAsPrecision(4)})";
      } else if (imc <= 18.5) {
        _infoText = "magreza leve (${imc.toStringAsPrecision(4)})";
      } else if (imc <= 24.91) {
        _infoText = "peso ideal (${imc.toStringAsPrecision(4)})";
      } else if (imc <= 29.91) {
        _infoText = "sobre peso (${imc.toStringAsPrecision(4)})";
      } else if (imc <= 34.91) {
        _infoText = "obesidade grau I (${imc.toStringAsPrecision(4)})";
      } else if (imc <= 39.91) {
        _infoText = "obesidade grau II (${imc.toStringAsPrecision(4)})";
      } else if (imc > 40) {
        _infoText =
            "obesidade grau III ou mórbida (${imc.toStringAsPrecision(4)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 22, 21, 21),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "CALCULADORA IMC",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
              onPressed: restart, icon: Icon(Icons.refresh), color: Colors.white),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Icon(
              Icons.person_outline,
              size: 60,
              color: Colors.blue,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.accessibility_new_rounded,
                  color: Colors.blue,
                ),
                border: OutlineInputBorder(),
                labelText: 'Insira seu PESO (Kg) !',
                labelStyle: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w700,
                ),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
              controller: PesoController,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.arrow_upward_sharp,
                    color: Colors.blue,
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'Insira sua ALTURA (Cm) !',
                  labelStyle: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.w700)),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
              controller: AlturaController,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Container(
                  decoration: BoxDecoration(color: Colors.blue),
                  height: 50,
                  child: TextButton(
                    onPressed: calculator,
                    child: Text(
                      "CALCULAR",
                      style: TextStyle(
                          backgroundColor: Colors.blue, color: Colors.white),
                    ),
                  )),
            ),
            Text(
              _infoText,
              style: TextStyle(color: Colors.blue, fontSize: 20),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
