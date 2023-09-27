import 'package:flutter/material.dart';
import '../services/user_service.dart';
import 'login.dart';

TextEditingController nameController = TextEditingController();
TextEditingController pswController = TextEditingController();

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  "Landing Page up in this beee!",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Image.network(
                  "https://upload.wikimedia.org/wikipedia/en/c/cb/Monkey_D_Luffy.png"),
              ElevatedButton(
                onPressed: () {
                  UserService.getInstance().logout();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                child: const Text('Logga ut'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
