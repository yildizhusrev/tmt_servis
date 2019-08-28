import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'auth_utils.dart';

class NetworkUtils {
  
  static final String host = productionHost;
  //static final String productionHost = 'https://authflow.herokuapp.com';
  static final String developmentHost = 'http://192.168.31.110:3000';
  static final String productionHost = 'http://178.20.229.24:36';

  static authenticateUser(String email, String password) async {
    var uri = host + AuthUtils.endPoint;
    var data = {'email': email, 'password': password};
    try {
      String credentials = "$email:$password";
      Codec<String, String> stringToBase64 = utf8.fuse(base64);
      String encoded =
          stringToBase64.encode(credentials); // dXNlcm5hbWU6cGFzc3dvcmQ=
      //String decoded = stringToBase64.decode(encoded);          // username:password

      final response = await http.post(uri, headers: {
        'Authorization': encoded,
      });
      if (response.statusCode == 200) 
         {AuthUtils.authorizationToken=encoded;}
			  return response;       
          
    } catch (exception) {
      print(exception);
      if (exception.toString().contains('SocketException')) {
        return null;
      } else {
        return null;
      }
    }
  }

 static logoutUser(BuildContext context, SharedPreferences prefs) {
		AuthUtils.authorizationToken="";
		Navigator.of(context).pushReplacementNamed('/');
	}

  static showSnackBar(GlobalKey<ScaffoldState> scaffoldKey, String message) {
		scaffoldKey.currentState.showSnackBar(
			new SnackBar(
				content: new Text(message ?? 'You are offline'),
			)
		);
	}
}
