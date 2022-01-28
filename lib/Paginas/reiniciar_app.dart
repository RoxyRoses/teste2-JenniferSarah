import 'package:flutter/material.dart';

class ReiniciarWidget extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const ReiniciarWidget({required this.crianca});

  final Widget crianca;

  static void reiniciarApp(BuildContext context) {
    context.findAncestorStateOfType<_ReiniciarWidgetState>()?.reiniciarApp();
  }

  @override
  _ReiniciarWidgetState createState() => _ReiniciarWidgetState();
}

class _ReiniciarWidgetState extends State<ReiniciarWidget> {
  Key chave = UniqueKey();

  void reiniciarApp() {
    setState(() {
      chave = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: chave,
      child: widget.crianca,
    );
  }
}
