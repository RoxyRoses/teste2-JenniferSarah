// @dart=2.9
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';
import 'models/jogador.dart';
import 'tirar_pontos_cobras.dart';
import 'package:teste2/Paginas/linhas.dart';
import 'models/jogo.dart';
import 'Paginas/pagina_dado.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teste 2 - Jennifer Sarah',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(title: 'Teste 2 - Jennifer Sarah'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<GlobalKey> listaNumeros;
  GlobalKey<ScaffoldState> chaveScaffold = GlobalKey();
  Jogo modeloJogo = Jogo();

  @override
  void initState() {
    super.initState();
    listaNumeros = List<GlobalKey>.generate(
      100,
      (_) => GlobalKey(),
    );
    WidgetsBinding.instance?.addPostFrameCallback((d) {
      setState(() {
        tirarPonto(listaNumeros);
      });
      renderizarEscadas();
      renderizarCobras();
    });
  }

  final escadaFilhos = <Widget>[];
  final cobraFilhos = <Widget>[];
  renderizarEscadas() {
    var tamanho = MediaQuery.of(context).size;
    double altura = tamanho.height > 700 ? 700 : 300;
    double largura = tamanho.width > 700 ? 700 : 300;
    for (int i = 0; i < pontosEscadaA.length; i++) {
      escadaFilhos.add(CustomPaint(
        size: Size(largura, altura),
        painter: Linhas(
          ponto1: pontosEscadaA[i],
          ponto2: pontosEscadaB[i],
          pontoOrigem: p0,
          px: tamanho.width > 700 ? const Offset(0, 0) : px,
        ),
      ));
    }
  }

  renderizarCobras() {
    var size = MediaQuery.of(context).size;
    double height = size.height > 700 ? 700 : 300;
    double width = size.width > 700 ? 700 : 300;
    for (int i = 0; i < pontosCobraA.length; i++) {
      cobraFilhos.add(CustomPaint(
        size: Size(width, height),
        painter: PintarCobra(
          ponto1: pontosCobraA[i],
          ponto2: pontosCobraB[i],
          pontoOrigem: p0,
          px: size.width > 700 ? const Offset(0, 0) : px,
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    var tamanho = MediaQuery.of(context).size;
    double altura = tamanho.height > 700 ? 700 : 300;
    double largura = tamanho.width > 700 ? 700 : 300;
    return Scaffold(
      key: chaveScaffold,
      drawer: Drawer(
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(12),
            child: const Text(
              "As escadas (linhas cinzas) te levaram para cima e as cobras (linhas vermelhas) te levaram para baixo. Ganha quem chegar no 100 primeiro!",
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
      appBar: AppBar(
        leading: tamanho.width > 700
            ? Container()
            : IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  chaveScaffold.currentState.openDrawer();
                },
              ),
        backgroundColor: const Color.fromRGBO(240, 128, 128, 1.0),
        title: Text(
          "Teste 2 - Jennifer Sarah",
          style: TextStyle(
            color: Colors.white,
            fontSize: tamanho.width > 700 ? 25 : 20,
          ),
        ),
      ),
      body: Center(
        child: ScopedModel<Jogo>(
          model: modeloJogo,
          child: ScopedModel<Jogador>(
            model: jogadorInstanciado,
            child: Flex(
              direction: tamanho.width > 700 ? Axis.horizontal : Axis.vertical,
              children: <Widget>[
                Container(
                  margin: tamanho.width > 700
                      ? const EdgeInsets.all(0)
                      : const EdgeInsets.all(22),
                  height: tamanho.width > 700 ? altura : 300,
                  width: largura,
                  child: Stack(
                    children: [
                      ScopedModelDescendant<Jogo>(
                          builder: (context, child, gameModel) {
                        // print("model val => ${gameModel.diceVal}");
                        // print("model val bool=> ${gameModel.playerAplaying}");
                        return GridView.builder(
                            itemCount: 100,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 10,
                              mainAxisSpacing: 0,
                              crossAxisSpacing: 0,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                margin: const EdgeInsets.all(0),
                                key: listaNumeros[index],
                                color: (10 <= index && index <= 19) ||
                                        (30 <= index && index <= 39) ||
                                        (50 <= index && index <= 59) ||
                                        (70 <= index && index <= 79) ||
                                        (90 <= index && index <= 99)
                                    ? index.isOdd
                                        ? const Color.fromRGBO(135, 206, 250, 1)
                                        : const Color.fromRGBO(218, 112, 214, 1)
                                    : index.isEven
                                        ? const Color.fromRGBO(240, 128, 128, 1)
                                        : const Color.fromRGBO(
                                            152, 251, 152, 1),
                                child: ScopedModelDescendant<Jogador>(
                                    builder: (context, child, playerModel) {
                                  playerModel.ctx = context;
                                  return Stack(
                                    children: [
                                      (99 - index) == playerModel.jogadorAmove
                                          ? Align(
                                              alignment: index == 99
                                                  ? Alignment.topLeft
                                                  : Alignment.center,
                                              child: Container(
                                                width: 50.0,
                                                height: 50.0,
                                                decoration: const BoxDecoration(
                                                  color: Colors.red,
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                            )
                                          : const SizedBox(),
                                      (99 - index) == playerModel.jogadorBmove
                                          ? Align(
                                              alignment: index == 99
                                                  ? Alignment.bottomRight
                                                  : Alignment.center,
                                              child: Container(
                                                width: 50.0,
                                                height: 50.0,
                                                decoration: const BoxDecoration(
                                                  color: Colors.orange,
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                            )
                                          : const SizedBox(),
                                      Center(
                                        child: Text(
                                          ((99 - index) + 1).toString(),
                                          style: const TextStyle(
                                              fontSize: 24,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                              );
                            });
                      }),
                      ...escadaFilhos,
                      ...cobraFilhos,
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: ScopedModelDescendant<Jogo>(
                      builder: (context, child, gameModel) {
                    return SingleChildScrollView(
                      child: Flex(
                        direction: Axis.vertical,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Card(
                            color: gameModel.dadoValor == "init"
                                ? const Color.fromRGBO(247, 220, 111, 1)
                                : gameModel.jogadorAjogando
                                    ? Colors.white
                                    : const Color.fromRGBO(247, 220, 111, 1),
                            child: const SizedBox(
                              width: 120,
                              height: 50,
                              child: Center(
                                child: Text("Jogador Vermelho"),
                              ),
                            ),
                          ),
                          SizedBox(height: tamanho.width > 700 ? 50 : 5),
                          SizedBox(
                            height: 100,
                            width: 100,
                            child: gameModel.dadoValor == "init"
                                ? ChangeNotifierProvider<Dado>(
                                    child: PaginaDados("player1", gameModel),
                                    create: (BuildContext context) {
                                      return Dado();
                                    },
                                  )
                                : !gameModel.jogadorAjogando
                                    ? ChangeNotifierProvider<Dado>(
                                        child:
                                            PaginaDados("player1", gameModel),
                                        create: (BuildContext context) {
                                          return Dado();
                                        },
                                      )
                                    : const SizedBox(),
                          ),
                          SizedBox(
                            height: tamanho.width > 700 ? 100 : 10,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text(
                              "jogue o dado! (pressione o dado para jogar.)",
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          tamanho.width > 700
                              ? Container(
                                  padding: const EdgeInsets.all(5),
                                  height: 40,
                                  color: Colors.white,
                                  child: const Text(
                                    "As escadas (linhas cinzas) te levaram para cima e as cobras (linhas vermelhas) te levaram para baixo. Ganha quem chegar no 100 primeiro!",
                                    style: TextStyle(color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              : Container(
                                  height: 2,
                                  color: Colors.white,
                                ),
                          const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text(
                              "o jogador começa jogar ao tirar 1!",
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: tamanho.width > 700 ? 100 : 10,
                          ),
                          SizedBox(
                            height: 100,
                            width: 100,
                            child: gameModel.dadoValor == "init"
                                ? const SizedBox()
                                : !gameModel.jogadorAjogando
                                    ? const SizedBox()
                                    : ChangeNotifierProvider<Dado>(
                                        child:
                                            PaginaDados("player2", gameModel),
                                        create: (BuildContext context) {
                                          return Dado();
                                        },
                                      ),
                          ),
                          SizedBox(
                            height: tamanho.width > 700 ? 50 : 5,
                          ),
                          Card(
                            color: gameModel.dadoValor == "init"
                                ? Colors.white
                                : !gameModel.jogadorAjogando
                                    ? Colors.white
                                    : const Color.fromRGBO(247, 220, 111, 1),
                            child: const SizedBox(
                              width: 120,
                              height: 50,
                              child: Center(
                                child: Text("Jogador Laranja"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
