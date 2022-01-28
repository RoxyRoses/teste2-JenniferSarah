import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:scoped_model/scoped_model.dart';
import 'package:teste2/paginas/reiniciar_app.dart';

class Jogador extends Model {
  int _jogadorAmovimento = 0;
  int _jogadorBMovimento = 0;
  int get jogadorAmove => _jogadorAmovimento;
  int get jogadorBmove => _jogadorBMovimento;
  late BuildContext _ctx;
  BuildContext get ctx => _ctx;
  set ctx(BuildContext c) {
    _ctx = c;
    notifyListeners();
  }

  bool _ganhou = false;
  bool get ganhou => _ganhou;
  set ganhou(bool i) {
    _ganhou = i;
    notifyListeners();
  }

  set jogadorAmove(int i) {
    _jogadorAmovimento = i;
    if (_jogadorAmovimento == 99) {
      print("Voce Ganhou!");
      ganhou = true;
      showDialog(
          barrierDismissible: false,
          context: ctx,
          builder: (BuildContext context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: SizedBox(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Jogador vermelho Ganhou!",
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(
                        width: 320.0,
                        child: RaisedButton(
                          onPressed: () async {
                            jogadorAmove = 0;
                            jogadorBmove = 0;
                            ReiniciarWidget.reiniciarApp(context);
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Novo Jogo",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: const Color(0xFF1BC0C5),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          });
    }

    movaJogadorA(6, 28);
    movaJogadorA(30, 41);
    movaJogadorA(38, 74);
    movaJogadorA(70, 81);
    movaJogadorA(33, 45);
    movaJogadorA(49, 68);
    movaJogadorA(14, 32);
    movaJogadorA(10, 20);
    movaJogadorA(63, 73);
    movaJogadorA(37, 4);
    movaJogadorA(98, 12);
    movaJogadorA(96, 85);
    movaJogadorA(89, 77);
    movaJogadorA(29, 9);
    movaJogadorA(72, 42);
    movaJogadorA(25, 7);
    movaJogadorA(58, 39);
    movaJogadorA(60, 51);
    notifyListeners();
  }

  set jogadorBmove(int i) {
    _jogadorBMovimento = i;
    if (_jogadorBMovimento == 99) {
      print("Voce Ganhou!");
      ganhou = true;
      showDialog(
          barrierDismissible: false,
          context: ctx,
          builder: (BuildContext context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: SizedBox(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Jogador laranja Ganhou!",
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(
                        width: 320.0,
                        child: RaisedButton(
                          onPressed: () async {
                            jogadorAmove = 0;
                            jogadorBmove = 0;
                            ReiniciarWidget.reiniciarApp(context);
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Novo Jogo",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: const Color(0xFF1BC0C5),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          });
    }
    //ladder
    movaJogadorB(6, 28);
    movaJogadorB(30, 41);
    movaJogadorB(38, 74);
    movaJogadorB(70, 81);
    movaJogadorB(33, 45);
    movaJogadorB(49, 68);
    movaJogadorB(14, 32);
    movaJogadorB(10, 20);
    movaJogadorB(63, 73);
    movaJogadorB(37, 4);
    movaJogadorB(98, 12);
    movaJogadorB(96, 85);
    movaJogadorB(89, 77);
    movaJogadorB(29, 9);
    movaJogadorB(72, 42);
    movaJogadorB(25, 7);
    movaJogadorB(58, 39);
    movaJogadorB(60, 51);
    notifyListeners();
  }

  movaJogadorA(int init, int valorFinal) async {
    if (jogadorInstanciado.jogadorAmove == init) {
      await Future.delayed(const Duration(seconds: 1), () {
        print("Tempo");
        jogadorInstanciado.jogadorAmove = valorFinal;
        // notifyListeners();
      });
    }
  }

  movaJogadorB(int init, int valorFinal) async {
    if (jogadorInstanciado.jogadorBmove == init) {
      await Future.delayed(const Duration(seconds: 1), () {
        print("Tempo");
        jogadorInstanciado.jogadorBmove = valorFinal;
        // notifyListeners();
      });
    }
  }
}

Jogador jogadorInstanciado = Jogador();
