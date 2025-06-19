import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Calculadora Científica',
      home: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final numero_1 = TextEditingController();
  final numero_2 = TextEditingController();

  @override
  void dispose() {
    numero_1.dispose();
    numero_2.dispose();
    super.dispose();
  }

  void mostrarResultado(String mensaje) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(content: Text(mensaje)),
    );
  }

  void ejecutarOperacion(String operacion) {
    final texto1 = numero_1.text;
    final texto2 = numero_2.text;
    double? n1 = double.tryParse(texto1);
    double? n2 = double.tryParse(texto2);
    String resultado = '';

    switch (operacion) {
      case '+':
        if (n1 != null && n2 != null) {
          resultado = 'Suma: ${n1 + n2}';
        }
        break;
      case '-':
        if (n1 != null && n2 != null) {
          resultado = 'Resta: ${n1 - n2}';
        }
        break;
      case '×':
        if (n1 != null && n2 != null) {
          resultado = 'Multiplicación: ${n1 * n2}';
        }
        break;
      case '÷':
        if (n1 != null && n2 != null) {
          if (n2 == 0) {
            resultado = 'No se puede dividir entre 0.';
          } else {
            resultado = 'División: ${n1 / n2}';
          }
        }
        break;
      case '^':
        if (n1 != null && n2 != null) {
          resultado = 'Potencia: ${pow(n1, n2)}';
        }
        break;
      case '√':
        if (n1 != null) {
          resultado = 'Raíz cuadrada de N°1: ${sqrt(n1)}';
        }
        break;
      case 'log':
        if (n1 != null && n1 > 0) {
          resultado = 'Logaritmo base 10 de N°1: ${log(n1) / ln10}';
        } else {
          resultado = 'El logaritmo requiere un número mayor que 0.';
        }
        break;
      case 'sin':
        if (n1 != null) {
          resultado = 'Seno de N°1: ${sin(n1)}';
        }
        break;
      case 'cos':
        if (n1 != null) {
          resultado = 'Coseno de N°1: ${cos(n1)}';
        }
        break;
      case 'tan':
        if (n1 != null) {
          resultado = 'Tangente de N°1: ${tan(n1)}';
        }
        break;
    }

    if (resultado.isEmpty) {
      resultado = 'Por favor, ingrese números válidos.';
    }

    mostrarResultado(resultado);
  }

  @override
  Widget build(BuildContext context) {
    final operaciones = [
      '+',
      '-',
      '×',
      '÷',
      '^',
      '√',
      'log',
      'sin',
      'cos',
      'tan',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora Científica'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: numero_1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Digite el primer número',
                labelText: 'Número N°1',
              ),
            ),
            TextField(
              controller: numero_2,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Digite el segundo número (si aplica)',
                labelText: 'Número N°2',
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: operaciones.map((op) {
                  return ElevatedButton(
                    onPressed: () => ejecutarOperacion(op),
                    child: Text(op, style: const TextStyle(fontSize: 18)),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
