import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../data/repositories/firebase_auth_repository.dart';

// Repository provider
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return FirebaseAuthRepository();
});

// Authentication state provider
final authStateProvider = StreamProvider<User?>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges;
});

// Current user provider
final currentUserProvider = Provider<User?>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.currentUser;
});

// Authentication status provider
final isAuthenticatedProvider = Provider<bool>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.isAuthenticated;
});

// User ID provider
final userIdProvider = Provider<String?>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.userId;
});

// Sign-in provider
final signInProvider =
    FutureProvider.family<UserCredential, Map<String, String>>(
        (ref, credentials) async {
  final authRepository = ref.watch(authRepositoryProvider);
  return await authRepository.signInWithEmailAndPassword(
    credentials['email']!,
    credentials['password']!,
  );
});

// Sign-up provider
final signUpProvider =
    FutureProvider.family<UserCredential, Map<String, String>>(
        (ref, credentials) async {
  final authRepository = ref.watch(authRepositoryProvider);
  return await authRepository.createUserWithEmailAndPassword(
    credentials['email']!,
    credentials['password']!,
  );
});

// Google sign-in provider
final googleSignInProvider = FutureProvider<UserCredential>((ref) async {
  final authRepository = ref.watch(authRepositoryProvider);
  return await authRepository.signInWithGoogle();
});

// Sign-out provider
final signOutProvider = FutureProvider<void>((ref) async {
  final authRepository = ref.watch(authRepositoryProvider);
  await authRepository.signOut();
});

// Password reset provider
final passwordResetProvider =
    FutureProvider.family<void, String>((ref, email) async {
  final authRepository = ref.watch(authRepositoryProvider);
  await authRepository.sendPasswordResetEmail(email);
});
