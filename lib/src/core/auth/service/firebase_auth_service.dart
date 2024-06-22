import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth firebaseAuth;
  FirebaseAuthService(this.firebaseAuth);

  Stream<User?> get onAuthStateChanged => firebaseAuth.authStateChanges();

  Future<User?> signInAnonymously() async {
    final userCredential = await firebaseAuth.signInAnonymously();
    return userCredential.user;
  }

  Future<UserCredential> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  User? get currentUser => firebaseAuth.currentUser;

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}
