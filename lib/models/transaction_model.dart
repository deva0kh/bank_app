import 'package:bank_app/dao/payementDao.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:bank_app/constants/color_constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

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
    "name": "Outcome",
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

];

Widget transaction(String image, Color colorType,String amount ,String information, String recipient,String name, String date, String signType) {
  return Container(
    margin: EdgeInsets.only(right: 8),
    height: 190,
    width: 160,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: kWhiteColor,
        boxShadow: [
          BoxShadow(
              color: Color(0x4000000),
              blurRadius: 10,
              spreadRadius: 10,
              offset: Offset(0.0, 8.0)
          )
        ]
    ),
    child: Stack(
      children: <Widget>[
        Positioned(
          top: 16,
          left: 16,
          child:
          SvgPicture.asset(transactions[0].type),
          height: 24,
          width: 24,),
        Positioned(
          right: 8, top: 8,
          child: SvgPicture.asset('assets/svg/mastercard_bg.svg'),
        ),
        Positioned(
          top: 14, right: 14,
          child: Text(transactions[0].name, style: GoogleFonts.nunito(
              fontWeight: FontWeight.w700, fontSize: 12,
              color: transactions[0].colorType
          ),),
        ),
        Positioned(
          top: 64,
          left: 16,
          child: Text(transactions[0].signType + 'Dh ' + amount,
              style: GoogleFonts.nunito(fontWeight: FontWeight.w700,
                  fontSize: 15,
                  color: transactions[0].colorType)),
        ),
        Positioned(
          top: 90, left: 16,
          child: Text(transactions[0].information,
              style: GoogleFonts.nunito(fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: kGreyColor)),
        ),
        Positioned(
          left: 10, bottom: 42,
          child: Column(
            children: <Widget>[

              Text(name,
                style: GoogleFonts.nunito(
                    fontWeight: FontWeight.w700, color: Colors.black),),
              Padding(
                padding: const EdgeInsets.only(left:2.0),
                child: Text(

                  recipient,
                  style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w700, fontSize: 9, color: Colors.black38),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 16,
          bottom: 15,
          child: Text(date,
            style: GoogleFonts.nunito(
                fontWeight: FontWeight.w700, fontSize: 12, color: kGreyColor),),
        ),
        Positioned(
          bottom: 15,
          right: 16,
          child: Image.asset(transactions[0].card, height: 22, width: 30,),
        ),

      ],
    ),
  );
}