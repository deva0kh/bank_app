import 'package:bank_app/constants/color_constant.dart';
import 'package:bank_app/custom_icons/flutter_custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:bank_app/custom_icons/flutter_custom_icon.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bank_app/models/card_model.dart';

class Homescreen extends StatefulWidget{

    @override
    _HomeScreenState createState() => _HomeScreenState();
  }

  class _HomeScreenState extends State<Homescreen> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Theme
            .of(context)
            .backgroundColor,
        appBar: AppBar(
          backgroundColor: Theme
              .of(context)
              .backgroundColor,
          elevation: 0,
          leading: IconButton(
              icon: Icon(MyFlutterApp.navigation_drawer,
                color: Colors.black,
              ),
              onPressed: () {},
            padding: EdgeInsets.only(left: 8),
          ),
        ),
        body: Container(
          child: ListView(
            physics: ClampingScrollPhysics(),
            children: <Widget>[
              Padding(padding: EdgeInsets.only(left: 28, bottom: 8),
              child: Text(
                'Hi Client',
                style: GoogleFonts.nunito(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              ),
              Container(
                height: 175,
                child: ListView.builder(
                    padding: EdgeInsets.only(left: 18,right: 7),
                    scrollDirection: Axis.horizontal,
                    itemCount: cards.length,
                    itemBuilder: (context,index) {
                      return Container(
                        margin: EdgeInsets.only(right:9),
                        height: 175,
                        width: 220,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: cards[index].bgColor,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x10000000),
                              blurRadius: 10,
                              spreadRadius: 4,
                              offset: Offset(0.0,8.0)
                            )
                          ]
                        ),
                      );
                    },
                ),
              )
            ],

          ),
        ),
      );
    }

  }