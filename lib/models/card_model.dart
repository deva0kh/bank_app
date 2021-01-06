import 'package:flutter/material.dart';
import 'package:bank_app/constants/color_constant.dart';

class CardModel {
  String name;
  String type;
  String balance;
  String valid;
  String moreIcon;
  String cardBackground;
  Color bgColor;
  Color firstColor;
  Color secondColor;

  CardModel(this.name, this.type, this.balance, this.valid, this.moreIcon,
      this.cardBackground, this.bgColor, this.firstColor, this.secondColor);
}

List<CardModel> cards = cardData
    .map((item) => CardModel(
        item['name'],
        item['type'],
        item['balance'],
        item['valid'],
        item['moreIcon'],
        item['cardBackground'],
        item['bgColor'],
        item['firstColor'],
        item['secondColor']))
    .toList();

var cardData = [

  {
    "name": "Achraf ",
    "type": "assets/images/mastercard_logo.png",
    "balance": "22000.00",
    "valid": "02/24",
    "moreIcon": 'assets/icons/more_icon_grey.svg',
    "cardBackground":'assets/icons/mastercard_bg.svg',
    "bgColor": kMasterCardColor,
    "firstColor": kGreyColor,
    "secondColor": kBlackColor
  },
  {
    "name": "Achraf ",
    "type": "assets/icons/paypal.png",
    "balance": "9000.00",
    "valid": "-",
    "moreIcon": 'assets/svg/more_icon_white.svg',
    "cardBackground":'assets/svg/jenius_bg.svg',
    "bgColor": kJeniusCardColor,
    "firstColor": kWhiteColor,
    "secondColor": kWhiteColor
  },

  {
    "name": "Achraf ",
    "type": "assets/images/mastercard_logo.png",
    "balance": "5000.00",
    "valid": "01/25",
    "moreIcon": 'assets/icons/more_icon_grey.svg',
    "cardBackground":'assets/svg/mastercard_bg.svg',
    "bgColor": kMasterCardColor,
    "firstColor": kGreyColor,
    "secondColor": kBlackColor
  },

];
