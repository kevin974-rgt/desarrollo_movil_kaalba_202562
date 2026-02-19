import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();

  bool esCorreoValido(String correo) {
    final regex = RegExp(r'^[\w\.-]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(correo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/image/inicio.jpg',
                  height: 140,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 20),

                Text(
                  '👋 INICIAR SESIÓN 👍',
                  style: TextStyle(
                      fontSize: 26, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),

                Text(
                  'Inicia sesión para continuar',
                  style: TextStyle(
                      fontSize: 16, color: Colors.grey),
                ),
                SizedBox(height: 30),

                
                TextFormField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Correo',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'El correo es obligatorio';
                    }
                    if (!esCorreoValido(value.trim())) {
                      return 'Ingrese un correo válido';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),

                TextFormField(
                  controller: pass,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'La contraseña es obligatoria';
                    }
                    if (value.length < 6) {
                      return 'Debe tener mínimo 6 caracteres';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushReplacementNamed(
                            context, '/dashboard');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text('Ingresar',
                        style: TextStyle(fontSize: 16)),
                  ),
                ),
                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('¿No tienes cuenta? '),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: Text(
                        'Regístrate aquí',
                        style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
