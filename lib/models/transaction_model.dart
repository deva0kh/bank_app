import 'package:bank_app/dao/payementDao.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:bank_app/constants/color_constant.dart';

class TransactionModel {
  String name;
  String type;
  Color colorType;
  String signType;
  String amount;
  String information;
  String recipient;
  String date;
  String card;

  TransactionModel(this.name, this.type, this.colorType, this.signType,
      this.amount, this.information, this.recipient, this.date, this.card);
}

List<TransactionModel> transactions = transactionData
    .map((item) => TransactionModel(
        item['name'],
        item['type'],
        item['colorType'],
        item['signType'],
        item['amount'],
        item['information'],
        item['recipient'],
        item['date'],
        item['card']))
    .toList();
// ListView.builder(
// padding: EdgeInsets.only(left: 16,right: 8),
// scrollDirection: Axis.horizontal, itemCount: transactions.length,itemBuilder: (context,index){
var transactionData = [

  {
    "name": "Helo",
    "type": 'assets/icons/outcome_icon.svg',
    "colorType": Colors.deepOrangeAccent,
    "signType": "-",
    "amount": "200.000",
    "information": "Transfer to",
    "recipient": "Mohamed",
    "date": "12 Feb 2020",
    "card": "assets/images/mastercard_logo.png"

  },


  {
    "name": "Outcome",
    "type": 'assets/icons/outcome_icon.svg',
    "colorType": Colors.deepOrangeAccent,
    "signType": "-",
    "amount": "200.000",
    "information": "Transfer to",
    "recipient": "Michael Ballack",
    "date": "12 Feb 2020",
    "card": "assets/images/mastercard_logo.png"
  },
  {
    "name": "Income",
    "type": 'assets/icons/income_icon.svg',
    "colorType": Colors.lightGreen,
    "signType": "+",
    "amount": "352.000",
    "information": "Received from",
    "recipient": "Patrick Star",
    "date": "10 Feb 2020",
    "card": "assets/images/jenius_logo_blue.png"
  },
  {
    "name": "Outcome",
    "type": 'assets/icons/outcome_icon.svg',
    "colorType": Colors.deepOrangeAccent,
    "signType": "-",
    "amount": "53.265",
    "information": "Monthly Payment",
    "recipient": "Spotify",
    "date": "09 Feb 2020",
    "card": "assets/images/mastercard_logo.png"
  }
];
