import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class User {
  final String id;
  final String? name;
  final String? email;
  final String? phoneNumber;
  final String? profileImage;
  final String? address;

  User({
    required this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.profileImage,
    this.address,
  });

  factory User.fromFirebaseAuth(auth.User firebaseUser) {
    return User(
      id: firebaseUser.uid,
      name: firebaseUser.displayName,
      email: firebaseUser.email,
      phoneNumber: firebaseUser.phoneNumber,
      profileImage: firebaseUser.photoURL,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone_number': phoneNumber,
      'profile_image': profileImage,
      'address': address,
    };
  }

  User copyWith({
    String? name,
    String? email,
    String? phoneNumber,
    String? profileImage,
    String? address,
  }) {
    return User(
      id: id,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profileImage: profileImage ?? this.profileImage,
      address: address ?? this.address,
    );
  }
}

class UserProvider with ChangeNotifier {
  User? _user;
  bool _isLoading = false;
  String? _error;
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  // إنشاء GoogleSignIn بشكل عادي (بدون instance)
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email'],
    serverClientId: '520998567226-fucl2c86ukp5mk7ppjdqt1g3fv7r09qp.apps.googleusercontent.com',
  );

  User? get user => _user;
  bool get isLoading => _isLoading;
  bool get isLoggedIn => _user != null;
  String? get error => _error;

  UserProvider() {
    _firebaseAuth.authStateChanges().listen(_onAuthStateChanged);
  }

  Future<void> _onAuthStateChanged(auth.User? firebaseUser) async {
    if (firebaseUser == null) {
      _user = null;
    } else {
      // Ensure the User object is always up-to-date with Firebase user data
      _user = User.fromFirebaseAuth(firebaseUser);
    }
    notifyListeners();
  }

  Future<auth.UserCredential?> signInWithGoogle() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        _error = 'لم يتم اختيار أي حساب Google.';
        _isLoading = false;
        notifyListeners();
        return null;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final auth.AuthCredential credential = auth.GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      final userCredential = await _firebaseAuth.signInWithCredential(credential);
      if (userCredential.user != null) {
        _user = User.fromFirebaseAuth(userCredential.user!);
      }
      _isLoading = false;
      notifyListeners();
      return userCredential;
    } catch (e) {
      _error = 'حدث خطأ أثناء تسجيل الدخول بـ Google: $e';
      debugPrint('Google Sign-In Error: $e');
      _isLoading = false;
      notifyListeners();
      return null;
    }
  }

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _user = User.fromFirebaseAuth(userCredential.user!);
      _isLoading = false;
      notifyListeners();
      return true;
    } on auth.FirebaseAuthException catch (e) {
      _error = 'فشل تسجيل الدخول: ${e.message}';
      _isLoading = false;
      notifyListeners();
      return false;
    } catch (e) {
      _error = 'حدث خطأ غير متوقع: $e';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> register(String email, String password) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _user = User.fromFirebaseAuth(userCredential.user!);
      _isLoading = false;
      notifyListeners();
      return true;
    } on auth.FirebaseAuthException catch (e) {
      _error = 'فشل إنشاء الحساب: ${e.message}';
      _isLoading = false;
      notifyListeners();
      return false;
    } catch (e) {
      _error = 'حدث خطأ غير متوقع: $e';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<void> logout() async {
    await _googleSignIn.signOut();
    await _firebaseAuth.signOut();
    _user = null;
    notifyListeners();
  }

  void updateUserProfile(User updatedUser) {
    _user = updatedUser;
    notifyListeners();
  }
}
