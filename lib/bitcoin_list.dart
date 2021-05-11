import 'package:flutter/material.dart';

class BitCoin {
  final String imagePath;
  final Color color;
  final String btcone;
  final String btcsec;
  final String dollor;
  final String percentage;
  final Color textcolor;

  BitCoin(
      {@required this.imagePath,
      @required this.color,
      @required this.textcolor,
      @required this.btcone,
      @required this.btcsec,
      @required this.dollor,
      @required this.percentage});
}

final List<BitCoin> bitcoinList = [
  BitCoin(
    imagePath: ("assets/images/bitcoin.png"),
    color: Colors.amber,
    btcone: "1.653563 BTC",
    btcsec: "\$401",
    dollor: "\$19.152",
    percentage: "+4.32%",
    textcolor: Colors.green,
  ),
  BitCoin(
    imagePath: ("assets/images/voice.png"),
    color: Colors.indigoAccent[700],
    btcone: "1.653563 ETH",
    btcsec: "\$0.45",
    dollor: "\$4.152",
    percentage: "+3.07%",
    textcolor: Colors.green,
  ),
  BitCoin(
    imagePath: ("assets/images/xrp.png"),
    color: Colors.blue[300],
    btcone: "10.653563 KRP",
    btcsec: "\$401",
    dollor: "\$4.152",
    percentage: "-12.07%",
    textcolor: Colors.red,
  ),
];
