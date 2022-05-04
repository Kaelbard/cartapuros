import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class CartaPuroFirebaseUser {
  CartaPuroFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

CartaPuroFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<CartaPuroFirebaseUser> cartaPuroFirebaseUserStream() => FirebaseAuth
    .instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<CartaPuroFirebaseUser>(
        (user) => currentUser = CartaPuroFirebaseUser(user));
