import 'package:http/http.dart' as http;
import 'package:json/json_list_view/user.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Services {
  static Future<List<User>> getUserInfo() async {
    try {
      final userJson = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
      if (userJson.statusCode == 200) {
        final List<User> listUser = userFromJson(userJson.body);
        return listUser;
      } else {
        showToast('(${userJson.statusCode})접속실패. 접속정보를 확인해 보세요.');
        return <User>[];
      }
    } catch (e) {
      //e.toString());
      showToast(e.toString());
      return <User>[];
    }
  }

  static void showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        // backgroundColor: Colors.red,
        // textColor: Colors.white,
        fontSize: 16.0);
  }
}
