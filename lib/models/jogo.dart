// ignore: import_of_legacy_library_into_null_safe
import 'package:scoped_model/scoped_model.dart';
import 'jogador.dart';

class Jogo extends Model {
  String _valorDado = "init";
  String get dadoValor => _valorDado;
  bool _jogadorAJogando = false;
  bool get jogadorAjogando => _jogadorAJogando;
  set dadoValor(String i) {
    _valorDado = i;
    notifyListeners();
  }

  set jogadorAjogando(bool i) {
    _jogadorAJogando = i;
    notifyListeners();
  }

  gamePlay(val) async {
    if (val.toString().contains("player1")) {
      if (jogadorInstanciado.jogadorAmove == 0) {
        int temp =
            int.parse(val.toString().trim().replaceRange(0, 7, "").trim());
        if (temp == 1) {
          jogadorInstanciado.jogadorAmove +=
              int.parse(val.toString().trim().replaceRange(0, 7, "").trim());
          await Future.delayed(Duration(seconds: 1));
          jogadorAjogando = true;
          notifyListeners();
        } else {
          jogadorInstanciado.jogadorAmove = 0;
          await Future.delayed(Duration(seconds: 1));
          jogadorAjogando = true;
          notifyListeners();
        }
      } else {
        jogadorInstanciado.jogadorAmove +=
            int.parse(val.toString().trim().replaceRange(0, 7, "").trim());
        jogadorAjogando = true;
        notifyListeners();
        print(jogadorInstanciado.jogadorAmove);
      }
    } else if (val.toString().contains("player2")) {
      if (jogadorInstanciado.jogadorBmove == 0) {
        int temp =
            int.parse(val.toString().trim().replaceRange(0, 7, "").trim());
        if (temp == 1) {
          jogadorInstanciado.jogadorBmove +=
              int.parse(val.toString().trim().replaceRange(0, 7, "").trim());
          await Future.delayed(Duration(seconds: 1));
          jogadorAjogando = false;
          notifyListeners();
        } else {
          jogadorInstanciado.jogadorBmove = 0;
          await Future.delayed(Duration(seconds: 1));
          jogadorAjogando = false;
          notifyListeners();
        }
      } else {
        jogadorInstanciado.jogadorBmove +=
            int.parse(val.toString().trim().replaceRange(0, 7, "").trim());
        await Future.delayed(Duration(seconds: 2));
        jogadorAjogando = false;
        notifyListeners();
        print(jogadorInstanciado.jogadorBmove);
      }
    }
  }
}
