import 'dart:ffi';

import 'package:bank_app/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bank_app/dao/payementDao.dart';
import 'dart:async';

class PayScreen extends StatefulWidget{

  @override
  _PayScreenState createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {
  double _amount;
  String _rib;
  String _name;
  String _reason;
  String _note;
  bool _supSolde =false;
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
              key: _formkey,
              child: Column(
                children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.only(right:88.0),
                    child: TextFormField(

                      validator: (String value){
                        if (value.isEmpty){
                          return 'Name cannot be empty';
                        }
                        _name=value;
                        return null;
                      },
                      style: GoogleFonts.nunito(fontWeight: FontWeight.w600),
                      decoration: InputDecoration(
                        labelText: 'Name :',
                        hintText: 'eg: Achraf Khallouk',
                        counterText: 'Name of the reciever',
                      ),
                    ),
                  ),

                  TextFormField(

                    validator: (String value){
                      if (value.isEmpty){
                        return 'RIB cannot be empty';
                      }else if(value.length<11){
                        return 'Please enter a valid RIB';
                      }
                      print(value);
                      _rib=value;
                      return null;
                    },
                    keyboardType: TextInputType.number,
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

                          validator: (String value) {

                            if (value.isEmpty){
                              return 'Ammount cannot be empty';
                            }else if( _supSolde==true){

                              return 'Ammount superior to your balance';
                            }
                            _amount=double.parse(value);
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          style: GoogleFonts.nunito(fontWeight: FontWeight.w600),
                          decoration: InputDecoration(
                            labelText: 'Amount :',
                            hintText: 'eg: 3000 DH',
                            suffixText: ' DH',

                          ),
                        ),
                      ),
                    ],
                  ),
                  TextFormField(

                    validator: (String value){
                      if (value.isEmpty){
                        return 'Reason cannot be empty';
                      }
                      _reason=value;
                      return null;
                    },
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
                    child: FutureBuilder(
                        future:((new PayementDao()).getSolde(0.0)),
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
                                     } else {
                                        return Padding(
                                          padding: const EdgeInsets.only(top:57.0,right: 100),
                                          child: Container(
                                      child: Text('Your Balance: ' +a.toString() + ' Dh',
                                        style: GoogleFonts.nunito(fontSize: 15,fontWeight: FontWeight.w700,),),
                              ),
                                        );
                              }
                              }
                        }


                    ),
                  ),

                ],
              ),
            )
          ),


        ],
      ),

    ),

    floatingActionButton :FloatingActionButton(
        onPressed: () async {
          _supSolde=false;
          if(_formkey.currentState.validate()){
              if(await (new PayementDao()).getSolde(_amount==null?0.0:_amount)==null){
                _supSolde=true;
                print('sup');
                _formkey.currentState.validate();
                return;

              }
              else{
                _supSolde=false;


                  await (new PayementDao().insertData(_amount,_reason,_rib,_name));
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Homescreen()),
                  );

              }
          }


          },

        child:  Icon(Icons.done),

    ),
  );
  }

}