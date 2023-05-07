import 'package:flutter_task/Models/LoginModel.dart';

import '/Constants/const.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isloading => _isLoading;

  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  final String _baseUrl = 'http://logic-valley.com/demo_projects/bhaile/api';
  final String _key = 'HY3hAgMk3IMktRDhOHYdZXSk3anBk3UR';

  String _token = '';
  String get token => _token;

  String _first_name = '';
  String get first_name => _first_name;

  String _last_name = '';
  String get last_name => _last_name;

  String _user_type = '';
  String get user_type => _user_type;

  String _address = '';
  String get address => _address;

  String _phone = '';
  String get phone => _phone;

  String _photo = '';
  String get photo => _photo;

  String _zip_code = '';
  String get zip_code => _zip_code;









  Future<bool> login(String email, password) async {
    setLoading(true);

    String url = '$_baseUrl/user/login';
    final headers = {'key': _key};
    final body = {
      'email': email,
      'password': password,
    };

    try {
      Response response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      final responseData = json.decode(response.body);

      final user = responseData['data']['user'];

      if (response.statusCode == 200 && responseData['status'] == true) {
        _token = responseData['data']['token'];
        _first_name= user['first_name'];
        _last_name= user['last_name'];
        _phone = user['phone'];
        _user_type = user['user_type'];
        _photo = user['photo'];
        _address = user['address'];
        _zip_code = user['zip_code'];

        print('this is the address');
        print(_address);

        final prefs = await SharedPreferences.getInstance();
        prefs.setString('token', _token);
        prefs.setString('first_name', _first_name);
        prefs.setString('last_name', _last_name);
        prefs.setString('phone', _phone);
        prefs.setString('user_type', _user_type);
        prefs.setString('photo', _photo);
        prefs.setString('address', _address);
        prefs.setString('zip_code', _zip_code);

        notifyListeners();
        setLoading(false);

        print('email');

        print('login api token: '+token);
        // print(responseData['data']['user']['email']);

        return true;
      } else {
        print('login failed error @@@@');
        setLoading(false);
        return false;
      }
    } catch (e) {
      print('failed to login there is an error');
      setLoading(false);
      print(e.toString());
      return throw Exception('The program has failed');
    }
  }


  Future<void> autoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token != null) {
      _token = token;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    if (token != null && token.isNotEmpty) {
      _token = '';
      prefs.remove('token');
      notifyListeners();
    }
  }





}
