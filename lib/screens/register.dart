import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController cedula = TextEditingController();
  final TextEditingController nombres = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final TextEditingController repeatPass = TextEditingController();

  // Validación completa de cédula ecuatoriana
  bool validarCedulaEcuatoriana(String cedula) {
    if (cedula.length != 10) return false;
    if (!RegExp(r'^[0-9]+$').hasMatch(cedula)) return false;

    int provincia = int.parse(cedula.substring(0, 2));
    if (provincia < 1 || provincia > 24) return false;

    int tercerDigito = int.parse(cedula[2]);
    if (tercerDigito >= 6) return false;

    List<int> coeficientes = [2, 1, 2, 1, 2, 1, 2, 1, 2];
    int suma = 0;

    for (int i = 0; i < 9; i++) {
      int valor = int.parse(cedula[i]) * coeficientes[i];
      if (valor >= 10) valor -= 9;
      suma += valor;
    }

    int digitoVerificador = int.parse(cedula[9]);
    int decenaSuperior = ((suma / 10).ceil()) * 10;
    int resultado = decenaSuperior - suma;

    if (resultado == 10) resultado = 0;

    return resultado == digitoVerificador;
  }

  bool validarCorreo(String correo) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
        .hasMatch(correo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registro')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: cedula,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Cédula'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese su cédula';
                  }
                  if (!validarCedulaEcuatoriana(value)) {
                    return 'Cédula ecuatoriana inválida';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),

              TextFormField(
                controller: nombres,
                decoration: InputDecoration(labelText: 'Nombres completos'),
                validator: (value) =>
                    value!.isEmpty ? 'Ingrese sus nombres' : null,
              ),
              SizedBox(height: 10),

              TextFormField(
                controller: email,
                decoration: InputDecoration(labelText: 'Correo'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese su correo';
                  }
                  if (!validarCorreo(value)) {
                    return 'Correo inválido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),

              TextFormField(
                controller: pass,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Contraseña'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese contraseña';
                  }
                  if (value.length < 6) {
                    return 'Mínimo 6 caracteres';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),

              TextFormField(
                controller: repeatPass,
                obscureText: true,
                decoration:
                    InputDecoration(labelText: 'Repetir contraseña'),
                validator: (value) {
                  if (value != pass.text) {
                    return 'Las contraseñas no coinciden';
                  }
                  return null;
                },
              ),

              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Registro exitoso')),
                    );

                    Navigator.pushReplacementNamed(
                        context, '/dashboard');
                  }
                },
                child: Text('Registrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
