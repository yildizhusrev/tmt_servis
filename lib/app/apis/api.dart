import 'package:http/http.dart' as http;
class Api{
  

  static Future getMusteris(){
  var url="http://178.20.229.24:36/api/Musteri?type=Json";

   Map<String, String> requestHeaders = {
       'Content-type': 'application/json',
       'Accept': 'application/json',
       'Authorization': 'SHVzcmV2OjEyMzQ1Ng=='
     };
     
    var result = http.get(url,headers:requestHeaders);
    return result;
  }
}