import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/common/scaffold_messanger.dart';
import '../../../core/providers/firebase_providers.dart';
import '../../../modals/user_modal.dart';

final firebaseAuthMethodsProvider = Provider((ref) {
  return FireBaseAuthMethods(ref.read(firebaseAuthProvider));
});

class FireBaseAuthMethods {
  final FirebaseAuth _auth;

  FireBaseAuthMethods(this._auth);

  Future<bool> signUpWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      final user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print(user.toString());

      // User? currentUser = FirebaseAuth.instance.currentUser;

      // UserModal userModal = UserModal(
      //     uid: currentUser!.uid,
      //     username: currentUser.displayName ?? 'no name',
      //     phoneNumber: currentUser.phoneNumber ?? 'no phone number',
      //     isAdmin: true,
      //     bio: 'no bio',
      //     city: 'no city',
      //     idOfFollowers: [],
      //     skill: [],
      //     email: currentUser.email ?? 'no email',
      //     rating: '0');

      // CollectionReference users =
      //     FirebaseFirestore.instance.collection('all_users');
      // users.doc(currentUser.uid).set(userModal.toMap());

      return true;
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return false;
  }

  Future<bool> loginWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
    
        showSnackBar(context, e.code);
      
    }
    catch(e){
       showSnackBar(context, e.toString());
    }return false;
  }
}
