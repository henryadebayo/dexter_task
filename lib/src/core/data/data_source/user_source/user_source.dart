// import 'dart:convert';
// import 'dart:developer' as dev;
//
// import 'package:http/http.dart';
//
// class UserSource implements UserSourceInterface {
//   final Client client;
//
//   UserSource(this.client);
//
//   @override
//   Future<User> getUser() async {
//     Map<String, dynamic> rawUser = await _tryRequest();
//     User newUser = UserHelper.fromMap(rawUser);
//     return newUser;
//   }
//
//   Future<Map<String, dynamic>> _tryRequest() async {
//     try {
//       return _makeRequest();
//     } catch (e) {
//       dev.log('$e');
//       return Future.error(e, StackTrace.current);
//     }
//   }
//
//   Future<Map<String, dynamic>> _makeRequest() async {
//     Response response = await client.get(Urls.fakeUserUrl);
//     if (response.statusCode != 200) {
//       throw Failure('an error occurred');
//     }
//     Map<String, dynamic> rawData = jsonDecode(response.body);
//     return rawData;
//   }
// }
