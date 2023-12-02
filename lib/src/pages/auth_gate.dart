import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_vet_app/src/pages/home_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(
            providers: [
              EmailAuthProvider(), // new
            ],
            headerBuilder: (context, constraints, shrinkOffset) => Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Text(
                    'The Vet App',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Flexible(
                  child: Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/the-vet-app-fa9d6.appspot.com/o/pequen%CC%83o.png?alt=media&token=dfa2c4e6-a6ae-4b4e-acf0-43214b3ffbd8',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          );
        }

        return const HomeScreen();
      },
    );
  }
}
