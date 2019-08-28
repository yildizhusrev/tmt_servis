import 'dart:async';
import 'dart:convert';
import 'package:auth_flow/app/apis/api.dart';
import 'package:auth_flow/app/models/musteri.dart';
import 'package:auth_flow/app/utils/auth_utils.dart';
import 'package:auth_flow/app/utils/network_utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

var refreshKey = GlobalKey<RefreshIndicatorState>();

class MusteriPage extends StatefulWidget {
static final String routeName = 'Musteri';
	@override
	State<StatefulWidget> createState() =>MusterisState();

}

class MusterisState extends State<MusteriPage> {
  List<Musteri> musteriList = new List<Musteri>();

  Future<Null> refreshList() async {
   refreshKey.currentState?.show(atTop: false);
   await Future.delayed(Duration(seconds: 2));

    Api.getMusteris().then((response) {
      setState(() {
        Iterable ilist = jsonDecode(response.body);
        musteriList =
            ilist.map((musteri) => Musteri.fromJson(musteri)).toList();
      });
    });
    return null;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Müsteri Listesi"),
        ),
        body: RefreshIndicator(
          key: refreshKey,
          child: ListView.builder(
            itemCount: musteriList.length,
            itemBuilder: (context, position) {
              return ListTile(
                leading: Icon(Icons.person),
                title: Text(musteriList[position].adSoyad),
                subtitle: Text(musteriList[position].telefon),
                trailing: Icon(Icons.more_vert),
              );
            },
          ),
    onRefresh: refreshList,
        ));
  }
  
  getMusteris() {
    
    Api.getMusteris().then((response) {
      var s = response;
      setState(() {
        Iterable ilist = jsonDecode(response.body);
        musteriList =
            ilist.map((musteri) => Musteri.fromJson(musteri)).toList();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getMusteris();
  }
	

}