import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PayScreen extends StatefulWidget{

  @override
  _PayScreenState createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {
  int _value = 1;
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Payment"),
    ),
    body: Container(
      child: ListView(
        physics: ClampingScrollPhysics(),

        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 14,top : 20,bottom: 24),
            child:
            Row(
              children: <Widget>[
            IconButton(
            icon: Icon(Icons.local_atm,
              color: Colors.black,
              ),
            ),
                Text(
                  'Transfer Details: ',
                  style: GoogleFonts.nunito(fontWeight: FontWeight.w700, fontStyle: FontStyle.normal, fontSize: 16),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 30,right: 40),
            child: Form(
              key: _formkey ,
              child: Column(
                children: <Widget>[

                  TextFormField(
                    style: GoogleFonts.nunito(fontWeight: FontWeight.w600),
                    decoration: InputDecoration(
                      labelText: 'Transfer To :',
                      hintText: 'RIB',
                      counterText: 'Please enter a valid RIB',

                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        DropdownButton(

                          value: _value,
                          items: [
                            DropdownMenuItem(
                              child: Row(
                                  children: <Widget>[
                                    SvgPicture.asset('assets/svg/morocco.svg',height: 15,width: 15,),
                                    Text("MAD"),
                                  ],
                                ),
                              value: 1,
                            ),
                            DropdownMenuItem(
                              child: Text("soon .."),
                              value: 2,
                            ),

                          ],
                          onChanged: (value) {
                            setState(() {
                              _value = value;
                            });
                          }),
                        Container(width: 15, color: Colors.transparent),
                    new  Flexible(
                        child: TextFormField(
                          style: GoogleFonts.nunito(fontWeight: FontWeight.w600),
                          decoration: InputDecoration(
                            labelText: 'Amount :',
                            hintText: 'eg: 3000 DH',
                            counterText: 'Please enter an amount less than your current balance',
                            suffixText: ' DH',

                          ),
                        ),
                      ),
                    ],
                  ),
                  TextFormField(
                    style: GoogleFonts.nunito(fontWeight: FontWeight.w600),
                    decoration: InputDecoration(
                      labelText: 'Reason :',
                      hintText: 'eg: bill payment',
                      counterText: '.',
                    ),
                  ),
                  TextFormField(
                    maxLength: 30,
                    style: GoogleFonts.nunito(fontWeight: FontWeight.w600),
                    decoration: InputDecoration(

                      labelText: 'Note :',
                      hintText: 'Create a note for this payment',
                        counterStyle: TextStyle(height: double.minPositive,),
                        counterText: ""

                    ),
                  ),

                  Container(
                    width: 300,
                    height: 80,
                    padding: EdgeInsets.only(top:40),
                    child: RaisedButton(

                      padding: EdgeInsets.only(left: 20,right: 20),
                      color: Colors.blue,
                      textColor: Colors.white,
                      child:  Text('Confirm'),
                      onPressed: (){}),
                  ),
                ],
              ),
            )
          ),
        ],
      ),
    ),
  );
  }

}