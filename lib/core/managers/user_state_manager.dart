// import 'package:injectable/injectable.dart';

// @lazySingleton
// class UserStateManager {
//   final Map<String, UserModel> _users = {};

//   UserModel? getUser(String userId) {
//     return _users[userId];
//   }

//   addUser(UserModel user) {
//     if (user.id != null) {
//       _users[user.id!] = user;
//     }
//   }

//   removeUser(String id) {
//     if (_users.containsKey(id)) _users.remove(id);
//   }

//   addUsers(List<UserModel> users) {
//     _users.addEntries(
//       users
//           .where((element) => element.id != null)
//           .map((e) => MapEntry(e.id!, e)),
//     );
//   }

//   Future<void> clear() async {
//     _users.clear();
//   }
// }
