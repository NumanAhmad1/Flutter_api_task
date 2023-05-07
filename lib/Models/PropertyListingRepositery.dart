import 'dart:convert';

import 'package:flutter_task/Models/PropertyListing.dart';
import '/Models/LoginRepositery.dart';
import 'package:http/http.dart' as http;
import '/Constants/const.dart';

class PropertyListingRepositery {
  final _property = AuthProvider();

  final String _key = 'HY3hAgMk3IMktRDhOHYdZXSk3anBk3UR';
  final String _url =
      'http://logic-valley.com/demo_projects/bhaile/api/property/property-listing';

  Future<PropertyListing> propertyListingRepositeryResponse() async {

    await _property.autoLogin();

    final headers = {
      'key': _key,
      'token': _property.token,
    };
    print('token here: ${_property.token}');
    print('Trying to hit the api');
    try {
      Response response = await http.post(
        Uri.parse(_url),
        headers: headers,
      );
      print('the response is taken');
      final data = jsonDecode(
        response.body.toString(),
      );
      print('the response is decoded and stored in a map');
      // print(data);

      if (response.statusCode == 200) {
        print(response.statusCode.toString());
        print('The api is loaded');
        return PropertyListing.fromJson(data);
      } else {
        print(response.statusCode.toString());
        print('Failed to load the api');
        print('this is the api token: ${_property.token}');
        return PropertyListing.fromJson(data);
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to load property listing');
    }
  }
}
