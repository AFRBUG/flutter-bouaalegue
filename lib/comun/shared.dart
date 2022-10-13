import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


const url ="https://api.init.st/data/v1/events/latest?accessKey=ist_zcxi2lCYiRMegTk3iXmLceA_34h7FG3l&bucketKey=6X79CJ7GRRXU";
      Future  fetchData() async {
        return http.get( Uri.parse(url));

  }

  /*

  then((result){
       if(result.statusCode==200){
          Map<String, dynamic> jsonData =
            json.decode(result.body) as Map<String, dynamic>;
         /*var dataList=[] ;
         dataList.add(jsonData['Sensor \\#1 Humidty(%)']['value']) ;
         dataList.add(jsonData['Sensor \\#1 Temperature(C)']['value']);
         dataList.add(jsonData['Sensor \\#2 Humidty(%)']['value']) ;
         dataList.add(jsonData['Sensor \\#2 Temperature(C)']['value']);
*/

        return result.body ;

         } else {
         throw Error() ;
       }
    });
   */