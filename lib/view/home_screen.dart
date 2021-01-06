import 'package:bank_app/constants/color_constant.dart';
import 'package:bank_app/dao/payementDao.dart';

import 'package:bank_app/models/transaction_model.dart';
import 'package:bank_app/view/payement_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bank_app/models/card_model.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';

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
              icon: Icon(Icons.credit_card,
                color: Colors.black,
              ),
              onPressed: () {},
            padding: EdgeInsets.only(left: 14),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          elevation: 0,
          child: Container(
            height: 56,
            margin: EdgeInsets.only(left: 16,right: 16,bottom:20),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: kGradientSlideButton,begin: Alignment.topCenter,end: Alignment.bottomCenter,
              tileMode: TileMode.mirror,
              stops: const <double> [0.0,1.0]),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ConfirmationSlider(
              onConfirmation: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PayScreen()),
                );

              },
              height: 56,
              width: MediaQuery.of(context).size.width-32,
              backgroundColor: Colors.transparent,
              shadow: BoxShadow(
                color: Colors.transparent
              ),
              foregroundShape: BorderRadius.circular(8),
              foregroundColor: Colors.white54,
              iconColor: Colors.transparent,
              text: 'SLIDE to add a transition',
              textStyle: GoogleFonts.nunito(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 15
              ),


            ) ,
          ),
        ),
        body: Container(
          child: ListView(
            physics: ClampingScrollPhysics(),
            children: <Widget>[
              Padding(padding: EdgeInsets.only(left: 28, bottom: 8),
              child: Text(
                'Hi Achraf',
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
                          ]),
                        child: Stack(
                          children: <Widget>[
                            Positioned(left:16,
                                top:12,
                                child: Image.asset(cards[index].type,height: 22,width: 33,)
                            ),
                            Positioned(
                              right: 12,
                              top: 12,
                              child: SvgPicture.asset(cards[index].cardBackground),
                            ),
                            Positioned(
                              top:14,
                              right: 14,
                              child: Text(cards[index].name,style: GoogleFonts.nunito(fontSize: 12,fontWeight:FontWeight.w400,color:cards[index].firstColor),),
                            ),

                            Positioned(
                              top: 60,
                              left: 16,
                              child: Text('Blance :',style: GoogleFonts.nunito(fontWeight: FontWeight.w400,fontSize: 12),),
                            ),
                            Positioned(
                              left: 16,
                              top: 80,
                              child: Text('Dh ' + cards[index].balance,style: GoogleFonts.nunito(fontWeight: FontWeight.w700,fontSize: 18),),
                            ),
                            Positioned(
                              left: 16,bottom: 30,
                                child: Text('Valid Account',style: GoogleFonts.nunito(fontWeight: FontWeight.w400,fontSize: 12 ,color:cards[index].firstColor), ),
                            ),
                            Positioned(
                              left: 16,bottom: 12,
                              child: Text(cards[index].valid,
                              style: GoogleFonts.nunito(fontWeight: FontWeight.w700,fontSize: 14,color: cards[index].secondColor),),
                            ),
                            Positioned(
                              right: 8,bottom: 8,
                              child: SvgPicture.asset(cards[index].moreIcon,
                              height: 24,width: 24,
                              ),

                            ),
                          ],
                        ),
                      );
                    },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 24,top: 8,bottom: 16),
                child: Text(
                  'Transactions',
                  style: GoogleFonts.nunito(fontSize: 20,fontWeight: FontWeight.w700,color: kBlackColor),
                ),
              ),
              Container(height: 180,
              child: FutureBuilder(
                  future:((new PayementDao()).getData()),
                    // ignore: missing_return
                    builder: (BuildContext coontext,AsyncSnapshot snapshot){
                    // ignore: missing_return
                    var a = snapshot.data;
                    switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    return new Text('Input a URL to start');
                    case ConnectionState.waiting:
                    return new Center(child: new CircularProgressIndicator());
                    case ConnectionState.active:
                    return new Text('');
                    case ConnectionState.done:
                    if (snapshot.hasError) {
                    return new Text(
                    'no connection to the internet',
                    style: TextStyle(color: Colors.red),
                    );
                    }
               else{
                // print(a);
                      List<Widget> list = new List<Widget>();

                      for(var row in a)
                        {
                          list.add(
                              transaction("assets/images/mastercard_logo.png", Colors.deepOrangeAccent, '${row[1]}', '${row[2]}', '${row[4]}','${row[5]}', "6 january 2021", "-")
                          );
                        }
                      return new ListView(scrollDirection: Axis.horizontal,children: list);

               }
              }
             } ),
              ),
            ],

          ),
        ),
      );
    }

  }