import 'package:app/services/user_service.dart';
import 'package:flutter/material.dart';
import 'login.dart';

UserService _us = UserService.getInstance();

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController pswController = TextEditingController();

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(80),
          child: Wrap(
            spacing: 20,
            runSpacing: 20,
            children: <Widget>[
              const Center(
                child: Text(
                  "Registrering",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Användarnamn"),
              ),
              TextFormField(
                controller: pswController,
                decoration: const InputDecoration(labelText: "Lösenord"),
                obscureText: true,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                child: const Text('Tillbaka'),
              ),
              ElevatedButton(
                onPressed: () async {
                  _us.isUserAvailable(nameController.text).then((value) => {
                        if (value)
                          <Future<bool>>{
                            _us
                                .addUser(
                                    nameController.text, pswController.text)
                                .whenComplete(() => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const LoginPage(),
                                      ),
                                    )),
                          }
                        else
                          {
                            showDialog(
                              context: context,
                              builder: (BuildContext dialogContext) {
                                return AlertDialog(
                                  title:
                                      const Text("Användarnamnet är upptaget"),
                                  content: const Text(
                                    "Vänligen välj ett annat användarnamn.",
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
                            )
                          }
                      });
                },
                child: const Text('Registrera'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
