import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EditUserData{

  final CollectionReference _updateCollectionReference = Firestore.instance.collection('users');

  void update(String uid, String firstName, String lastName, String email, String password, String gender, DateTime dateOfBirth){
    print(uid);
    print(firstName);
    if (firstName.isNotEmpty){
      _updateFirstName(uid, firstName);
    }
    if (lastName.isNotEmpty){
      _updateLastName(uid, lastName);
    }
    if (email.isNotEmpty){
      _updateEmail(uid, email);
    }
    if (password.isNotEmpty){
      _updatePassword(password);
    }
    if (gender.isNotEmpty){
      _updateGender(uid, gender);
    }
  }

  void _updateFirstName(String uid, String name){
    _updateCollectionReference.document(uid).updateData({'firstName': name});
    print("Succesfull updated firstName");
  }

  void _updateLastName(String uid, String name){
    _updateCollectionReference.document(uid).updateData({'lastName': name});
    print("Succesfull updated lastName");
  }

  void _updateEmail(String uid, String email){
    _updateCollectionReference.document(uid).updateData({'email': email});
    print("Succesfull updated email");
  }

  void _updatePassword(String password) async{
   //Create an instance of the current user. 
    FirebaseUser user = await FirebaseAuth.instance.currentUser();

    //Pass in the password to updatePassword.
    user.updatePassword(password).then((_){
      print("Succesfull changed password");
    }).catchError((error){
      print("Password can't be changed" + error.toString());
    });
  }

  void _updateGender(String uid, String gender){
    _updateCollectionReference.document(uid).updateData({'gender': gender});
    print("Succesfull updated gender");
  }
}