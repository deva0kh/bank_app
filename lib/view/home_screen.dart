import 'package:bank_app/constants/color_constant.dart';
import 'package:bank_app/custom_icons/flutter_custom_icon.dart';
import 'package:bank_app/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:bank_app/custom_icons/flutter_custom_icon.dart';
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
              icon: Icon(MyFlutterApp.navigation_drawer,
                color: Colors.black,
              ),
              onPressed: () {},
            padding: EdgeInsets.only(left: 8),
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
              onConfirmation: (){},
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
              child: ListView.builder(
                  padding: EdgeInsets.only(left: 16,right: 8),
                  scrollDirection: Axis.horizontal, itemCount: transactions.length,itemBuilder: (context,index){
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
                        offset: Offset(0.0,8.0)
                      )
                    ]
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                       top:16,left: 16,
                        child:
                        SvgPicture.asset(transactions[index].type),
                      height: 24,width: 24,),
                      Positioned(
                        right: 8,top: 8,
                        child: SvgPicture.asset('assets/svg/mastercard_bg.svg'),
                      ),
                      Positioned(
                        top: 14, right: 14,
                        child:Text(transactions[index].name,style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w700,fontSize: 12,
                          color:transactions[index].colorType
                        ),) ,
                      ),
                      Positioned(
                        top: 64,
                          left: 16,
                        child: Text(transactions[index].signType+'Dh '+transactions[index].amount,
                            style: GoogleFonts.nunito(fontWeight: FontWeight.w700,fontSize: 15,color: transactions[index].colorType)),
                      ),
                      Positioned(
                        top:100,left: 16,
                        child: Text(transactions[index].information,
                          style:GoogleFonts.nunito(fontWeight: FontWeight.w600,fontSize: 14,color: kGreyColor)),
                      ),
                      Positioned(
                        left: 16, bottom: 42,
                        child: Text(transactions[index].recipient,
                          style:GoogleFonts.nunito(fontWeight: FontWeight.w700,color: Colors.black) ,),
                      ),
                      Positioned(
                        left: 16,
                        bottom: 15,
                        child: Text(transactions[index].date,
                          style:GoogleFonts.nunito(fontWeight: FontWeight.w700,fontSize: 12,color: kGreyColor) ,),
                      ),
                      Positioned(
                        bottom: 15,
                        right: 16,
                        child: Image.asset(transactions[index].card,height: 22, width: 30,),
                      ),

                    ],
                  ),
                );
              }
              ),
              ),
            ],

          ),
        ),
      );
    }

  }