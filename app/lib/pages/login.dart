import 'package:app/services/user_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'landing.dart';
import 'user_registration.dart';

TextEditingController _nameController = TextEditingController();
TextEditingController _pswController = TextEditingController();
UserService _us = UserService.getInstance();

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool keepMeLoggedIn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('User').snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot?> snapshot) {
                  if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                    return Text(
                        "Data hämtad från databasen publicerad här vid uppstart\nAnvändarnamn: ${snapshot.data!.docs[0]['username']}\nLösenord: ${snapshot.data!.docs[0]['password']}");
                  } else {
                    return const Text("funka inte");
                  }
                }),
            Padding(
              padding: const EdgeInsets.all(80),
              child: Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [
                  const Center(
                    child: Text(
                      "Inloggning",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: _nameController,
                    decoration:
                        const InputDecoration(labelText: "Användarnamn"),
                  ),
                  TextFormField(
                    controller: _pswController,
                    decoration: const InputDecoration(labelText: "Lösenord"),
                    obscureText: true,
                  ),
                  ElevatedButton(
                    onPressed: () async => {
                      _us
                          .login(_nameController.text, _pswController.text)
                          .then((value) {
                        if (value) {
                          if (keepMeLoggedIn) {
                            _us.saveLoginStatus();
                          }
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const LandingPage()));
                          _nameController.text = '';
                          _pswController.text = '';
                        } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext dialogContext) {
                              return AlertDialog(
                                title: const Text("Inloggning: Error"),
                                content: const Text(
                                  "Fel vid inloggning upptäckt. Om fel kvarstår var god kontakta \ngrändmatha för teknisk support yani.",
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(dialogContext).pop();
                                    },
                                    child: const Text("OK"),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      })
                    },
                    child: const Text('Logga in'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegistrationPage()));
                    },
                    child: const Text('Registrera nytt konto'),
                  ),
                  Checkbox(
                      checkColor: Colors.white,
                      value: keepMeLoggedIn,
                      onChanged: (_) {
                        setState(() {
                          keepMeLoggedIn = !keepMeLoggedIn;
                        });
                      }),
                ],
              ),
            ),
          ]),
    );
  }
}
