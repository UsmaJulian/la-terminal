import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

 final FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;
class FirestoreService {
 


  //create DB, set user
  Future makeUserDB(UserCredential userCredential, String _name,
      String _lastname, String _idCard, String _phone) async {
    await firestoreInstance
        .collection("users")
        .doc(userCredential.user!.uid)
        .set({
      "uid": userCredential.user!.uid,
      "email": userCredential.user!.email,
      "name": _name,
      "lastname": _lastname,
      "idCard": _idCard,
      "phone": _phone
    });
  }

  //Get Userinfo,DB
 
}
