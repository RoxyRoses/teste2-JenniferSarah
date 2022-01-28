import 'package:flutter/material.dart';

Offset? px;
Offset? p0;
Offset? p1;
Offset? p2;
Offset? p3;
Offset? p4;
Offset? p5;
Offset? p6;
Offset? p7;
Offset? p8;
Offset? p9;
Offset? p10;
Offset? p11;
Offset? p12;
Offset? p13;
Offset? p14;
Offset? p15;
Offset? p16;
Offset? p17;
Offset? p18;
Offset? p19;
Offset? p20;
Offset? p21;
Offset? p22;
Offset? p23;
Offset? p24;
Offset? p25;
Offset? p26;
Offset? p27;
Offset? p28;
Offset? p29;
Offset? p30;
Offset? p31;
Offset? p32;
Offset? p33;
Offset? p34;
Offset? p35;
Offset? p36;
Offset? p37;
Offset? p38;
Offset? p39;
Offset? p40;
tirarPonto(lista) {
  px = acharPosicaoCadaQuadrado(8, lista);
  p0 = acharPosicaoCadaQuadrado(99, lista);
  p1 = acharPosicaoCadaQuadrado(6, lista);
  p2 = acharPosicaoCadaQuadrado(28, lista);
  p3 = acharPosicaoCadaQuadrado(30, lista);
  p4 = acharPosicaoCadaQuadrado(41, lista);
  p5 = acharPosicaoCadaQuadrado(38, lista);
  p6 = acharPosicaoCadaQuadrado(74, lista);
  p7 = acharPosicaoCadaQuadrado(14, lista);
  p8 = acharPosicaoCadaQuadrado(32, lista);
  p9 = acharPosicaoCadaQuadrado(70, lista);
  p10 = acharPosicaoCadaQuadrado(81, lista);
  p11 = acharPosicaoCadaQuadrado(53, lista);
  p12 = acharPosicaoCadaQuadrado(73, lista);
  p13 = acharPosicaoCadaQuadrado(10, lista);
  p14 = acharPosicaoCadaQuadrado(20, lista);
  p15 = acharPosicaoCadaQuadrado(33, lista);
  p16 = acharPosicaoCadaQuadrado(45, lista);
  p17 = acharPosicaoCadaQuadrado(49, lista);
  p18 = acharPosicaoCadaQuadrado(68, lista);

  p21 = acharPosicaoCadaQuadrado(37, lista);
  p22 = acharPosicaoCadaQuadrado(4, lista);
  p23 = acharPosicaoCadaQuadrado(98, lista);
  p24 = acharPosicaoCadaQuadrado(12, lista);
  p25 = acharPosicaoCadaQuadrado(96, lista);
  p26 = acharPosicaoCadaQuadrado(85, lista);
  p27 = acharPosicaoCadaQuadrado(89, lista);
  p28 = acharPosicaoCadaQuadrado(77, lista);
  p29 = acharPosicaoCadaQuadrado(29, lista);
  p30 = acharPosicaoCadaQuadrado(9, lista);
  p31 = acharPosicaoCadaQuadrado(72, lista);
  p32 = acharPosicaoCadaQuadrado(42, lista);
  p33 = acharPosicaoCadaQuadrado(25, lista);
  p34 = acharPosicaoCadaQuadrado(7, lista);
  p35 = acharPosicaoCadaQuadrado(60, lista);
  p36 = acharPosicaoCadaQuadrado(51, lista);
  p37 = acharPosicaoCadaQuadrado(58, lista);
  p38 = acharPosicaoCadaQuadrado(39, lista);

  print("pontos=> $p1 , $p2");
}

List pontosEscadaA = [
  p1,
  p3,
  p5,
  p7,
  p9,
  p11,
  p13,
  p15,
  p17,
];
List pontosEscadaB = [
  p2,
  p4,
  p6,
  p8,
  p10,
  p12,
  p14,
  p16,
  p18,
];
List pontosCobraA = [
  p21,
  p23,
  p25,
  p27,
  p29,
  p31,
  p33,
  p35,
  p37,
];
List pontosCobraB = [
  p22,
  p24,
  p26,
  p28,
  p30,
  p32,
  p34,
  p36,
  p38,
];
acharPosicaoCadaQuadrado(int sqIndex, list) {
  RenderBox caixa = list[99 - sqIndex].currentContext.findRenderObject();
  Offset posicao = caixa.localToGlobal(Offset.zero);
  print(posicao);
  return posicao;
}
