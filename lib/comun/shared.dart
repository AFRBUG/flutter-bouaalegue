import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;




const url ="https://api.init.st/data/v1/events/latest?accessKey=ist_zcxi2lCYiRMegTk3iXmLceA_34h7FG3l&bucketKey=6X79CJ7GRRXU";
      Future  fetchData() async {
        return http.get( Uri.parse(url));

  }
