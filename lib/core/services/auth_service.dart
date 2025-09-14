// import 'dart:convert';
// import 'dart:math';
// import 'package:crypto/crypto.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:sign_in_with_apple/sign_in_with_apple.dart';
// import 'package:yummy_bites/common/ui/custom_message_dialog.dart';
// import 'package:yummy_bites/core/dependency_injection/injection.dart';

// class AuthService {
//   Future<void> onGoogleLoginPressed() async {
//     try {
//       final googleUser = await GoogleSignIn.instance.authenticate();
//       if (googleUser == null) {
//         CustomMessageDialog.error(message: "Google sign-in was cancelled.");
//         return;
//       }

//       final googleAuth = await googleUser.authentication;
//       if (googleAuth.idToken == null) {
//         CustomMessageDialog.error(message: "Google ID token is null.");
//         return;
//       }

//       final idToken = googleAuth.idToken!;

//       final response = await injection<AuthRepository>().googleLogin(
//         GoogleLoginRequestModel(idToken: idToken),
//       );

//       response.fold(
//         (failure) {
//           CustomMessageDialog.error(message: failure.publicError);
//         },
//         (success) {
//           final user = success.data?.user;
//           final accessToken = success.data?.accessToken;

//           if (user?.id != null && accessToken != null) {
//             UserDataService().save(userId: user!.id!, token: accessToken);
//             UserDataService().setMyProfile(user);
//             RouterHelper().clearStackAndShowSplashView();
//           } else {
//             CustomMessageDialog.error(
//               message: "Login succeeded but user data is missing.",
//             );
//           }
//         },
//       );
//     } catch (e) {
//       CustomMessageDialog.error(message: "Google sign-in failed: $e");
//     }
//   }

//   //apple login
//   String generateNonce([int length = 32]) {
//     final charset =
//         '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
//     final random = Random.secure();
//     return List.generate(
//       length,
//       (_) => charset[random.nextInt(charset.length)],
//     ).join();
//   }

//   /// Returns the sha256 hash of [input] in hex notation.
//   String sha256ofString(String input) {
//     final bytes = utf8.encode(input);
//     final digest = sha256.convert(bytes);
//     return digest.toString();
//   }

//   Future<void> appleLogin() async {
//     try {
//       // Generate nonce for Apple sign-in
//       final rawNonce = generateNonce();
//       final nonce = sha256ofString(rawNonce);

//       // Request Apple ID credentials
//       final appleCredential = await SignInWithApple.getAppleIDCredential(
//         scopes: [
//           AppleIDAuthorizationScopes.email,
//           AppleIDAuthorizationScopes.fullName,
//         ],
//         nonce: nonce,
//       );

//       final idToken = appleCredential.identityToken;

//       if (idToken == null) {
//         CustomMessageDialog.error(message: "Apple ID token is null.");
//         return;
//       }

//       // Call backend with the ID token
//       final response = await injection<AuthRepository>().appleLogin(
//         AppleLoginRequestModel(idToken: idToken),
//       );

//       response.fold(
//         (failure) {
//           CustomMessageDialog.error(message: failure.publicError);
//         },
//         (success) {
//           final user = success.data?.user;
//           final accessToken = success.data?.accessToken;

//           if (user?.id != null && accessToken != null) {
//             UserDataService().save(userId: user!.id!, token: accessToken);
//             UserDataService().setMyProfile(user);
//             RouterHelper().clearStackAndShowSplashView();
//           } else {
//             CustomMessageDialog.error(
//               message: "Login succeeded but user data is missing.",
//             );
//           }
//         },
//       );
//     } catch (e) {
//       CustomMessageDialog.error(message: "Apple sign-in failed: $e");
//     }
//   }
// }
