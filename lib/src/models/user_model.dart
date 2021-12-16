// ignore_for_file: unused_label

class UserModel {
  String uid = "empty";
  String name = "empty";
  String lastname = "empty";
  String idCard = "empty";
  String email = "empty";
  String phone = "empty";
  String password = "empty";

  //1. crear singleton empezando por el constructor interno
  UserModel._internalConstructor();

  //2. crear un objeto único para acceder a esta clase
  static final _singleUser = UserModel._internalConstructor();

  //3. sobre-escribir el constructor
  factory UserModel() {
    return _singleUser;
  }

  setFromMap(Map<String, dynamic> userMap) {
    uid:
    userMap["uid"];
    name:
    userMap["name"];
    lastname:
    userMap["lastname"];
    idCard:
    userMap["idCard"];
    email:
    userMap["email"];
    phone:
    userMap["phone"];
    password:
    userMap["password"];
  }

  clearUser() {
    name = "Empty";
    email = "Empty";
    uid = "Empty";
  }

  String getCurrentUser() {
    return uid;
  }

  //solo en caso de nuevas creaciones
  setUserName(String _userName) {
    name = _userName;
  }
}
