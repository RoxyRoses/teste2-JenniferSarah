import 'package:flutter/material.dart';

class Linhas extends CustomPainter {
  Offset ponto1;
  Offset ponto2;
  Offset pontoOrigem;
  Offset px;
  Linhas(
      {required this.ponto1,
      required this.ponto2,
      required this.pontoOrigem,
      required this.px});

  @override
  void paint(Canvas canvas, Size tamanho) {
    final p1 = ponto1;
    final p2 = ponto2;
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 10;

    canvas.drawLine(Offset((p1.dx - px.dx) + 50, (p1.dy - pontoOrigem.dy) + 25),
        Offset((p2.dx - px.dx) + 50, (p2.dy - pontoOrigem.dy) + 25), paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}

class PintarCobra extends CustomPainter {
  Offset ponto1;
  Offset ponto2;
  Offset pontoOrigem;
  Offset px;
  PintarCobra(
      {required this.ponto1,
      required this.ponto2,
      required this.pontoOrigem,
      required this.px});

  @override
  void paint(Canvas canvas, Size tamanho) {
    final p1 = ponto1;
    final p2 = ponto2;
    final paint = Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10;
    canvas.drawLine(Offset((p1.dx - px.dx) + 50, (p1.dy - pontoOrigem.dy) + 25),
        Offset((p2.dx - px.dx) + 50, (p2.dy - pontoOrigem.dy) + 25), paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
