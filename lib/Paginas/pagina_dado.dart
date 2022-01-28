import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste2/models/jogo.dart';

// ignore: must_be_immutable
class PaginaDados extends StatelessWidget {
  Jogo jogoInstanciado;
  String jogador;
  PaginaDados(this.jogador, this.jogoInstanciado, {Key? key}) : super(key: key);
  void atualizarDados(Dado dado) async {
    for (int i = 0; i < 6; i++) {
      print(i);
      await Future.delayed(const Duration(milliseconds: 300));
      dado.GerarPrimeiroDado();
    }
    jogoInstanciado.dadoValor =
        "$jogador ${dado.contadorPrimeiroDado.toString()}";
    jogoInstanciado.gamePlay(jogoInstanciado.dadoValor);
  }

  @override
  Widget build(BuildContext context) {
    List<String> _imagensPrimeiroDado = [
      "assets/dice1.png",
      "assets/dice2.png",
      "assets/dice3.png",
      "assets/dice4.png",
      "assets/dice5.png",
      "assets/dice6.png",
    ];

    final dado = Provider.of<Dado>(context);
    final c = dado.contadorPrimeiroDado;
    var img = Image.asset(
      _imagensPrimeiroDado[c - 1],
      gaplessPlayback: true,
      width: 100,
      height: 100,
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                onTap: () => atualizarDados(dado),
                child: img,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class Dado with ChangeNotifier {
  int primeiroDado = 1;

  int get contadorPrimeiroDado => primeiroDado;

  void GerarPrimeiroDado() {
    primeiroDado = Random().nextInt(5) + 1;
    // ignore: avoid_print
    print("primeiro dado: $primeiroDado");
    notifyListeners();
  }
}
