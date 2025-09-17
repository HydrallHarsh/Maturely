import 'package:firebase_auth/firebase_auth.dart';

/// Repository interface for authentication operations
abstract class AuthRepository {
  /// Stream of authentication state changes
  Stream<User?> get authStateChanges;

  /// Get current authenticated user
  User? get currentUser;

  /// Sign in with email and password
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password);

  /// Create new user with email and password
  Future<UserCredential> createUserWithEmailAndPassword(
      String email, String password);

  /// Sign in with Google
  Future<UserCredential> signInWithGoogle();

  /// Sign out current user
  Future<void> signOut();

  /// Send password reset email
  Future<void> sendPasswordResetEmail(String email);

  /// Check if user is authenticated
  bool get isAuthenticated;

  /// Get user ID
  String? get userId;
}
