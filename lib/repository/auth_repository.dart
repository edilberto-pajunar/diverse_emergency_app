import 'package:emergency_test/models/app_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRepository({
    required FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth;

  AppUser? _toAppUser(User? firebaseUser) {
    if (firebaseUser == null) return null;

    return AppUser(
      id: firebaseUser.uid,
      displayName: firebaseUser.displayName,
      email: firebaseUser.email,
      phoneNumber: firebaseUser.phoneNumber,
      photoUrl: firebaseUser.photoURL,
    );
  }

  AppUser? get currentUser => _toAppUser(_firebaseAuth.currentUser);

  Stream<AppUser?> get currentUserStream =>
      _firebaseAuth.authStateChanges().map(_toAppUser);

  Future<UserCredential> signInAnonymously() async {
    return await _firebaseAuth.signInAnonymously();
  }

  Future<void> logOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
