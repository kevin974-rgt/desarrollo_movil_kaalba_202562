import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: email,
              decoration: InputDecoration(labelText: 'Correo'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: pass,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Contraseña'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/dashboard');
              },
              child: Text('Ingresar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Text('Crear cuenta'),
            )
          ],
        ),
      ),
    );
  }
}
