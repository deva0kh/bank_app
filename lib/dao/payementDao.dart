import 'dart:async';

import 'package:mysql1/mysql1.dart';

class PayementDao {



  static String host = '10.0.2.2',
      user = 'root',
      password = 'root',
      db = 'Atelier_bankapp';
  var port = 3306;

  PayementDao();

  Future<MySqlConnection> get_con() async {
    var settings = new ConnectionSettings(
        host: host,
        port: port,
        user: user,
        password: password,
        db: db
    );
    return await MySqlConnection.connect(settings);
  }
  Future getJobs() async {
    var conn = await get_con();
    var result = await conn.query(
        "select * from dourayBD.sales where bio Like '%userMohamed%' ;");
    if(result.length<1){

      var result = await conn.query(
          "select * from dourayBD.sales where bio Like '%Pending%' ;");
      return result;
    }
    else { return result;}


//       for (var row in result) {
//         print('Name: ${row[0]}, email: ${row[1]}');
//       }

  }

  Future insertData(double amount,String reason,String rib,String name) async{
    print(amount);
    var conn = await get_con();
    var result = await conn.query("insert into Atelier_bankapp.operation (`anount`, `reason`, `note`, `receiver`, `name`) values(?,?,?,?,?) ", [amount,reason,'none',rib,name]);
    print('Inserted row id=${result.insertId}');

    var secondResult = await conn.query( "update  Atelier_bankapp.client set solde = solde - ? where id = ? ", [amount,1]);
    print('Inserted row id=${secondResult.insertId}');
  }
  Future getData() async {
    var conn = await get_con();
    var result = await conn.query(
        "select * from Atelier_bankapp.operation ");

      // for (var row in result) {
      //    print('Name: ${row[0]}, email: ${row[1]}');
      // }
    return result;
  }
  Future getSolde(double amount) async{
    var conn = await get_con();
    var result = await conn.query("select solde from Atelier_bankapp.client where id=1 ");
     if (amount<result.last[0])
          return result.last[0];
     else return null;


  }



}