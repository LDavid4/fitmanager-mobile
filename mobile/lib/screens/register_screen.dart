import 'package:flutter/material.dart';

import '../utils/validators.dart';
import '../widgets/primary_button.dart';

/// Ekran za registraciju. Povezivanje sa API-jem slijedi u narednoj kontrolnoj tacki.
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirm = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    _confirm.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    // TODO: poziv POST /auth/register
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registracija')),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: [
              TextFormField(
                controller: _name,
                decoration: const InputDecoration(labelText: 'Ime i prezime'),
                validator: (v) => Validators.required(v, 'Ime i prezime'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: Validators.email,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _password,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Lozinka'),
                validator: Validators.password,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _confirm,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Potvrda lozinke'),
                validator: (v) =>
                    v != _password.text ? 'Lozinke se ne poklapaju' : null,
              ),
              const SizedBox(height: 24),
              PrimaryButton(label: 'Registruj se', onPressed: _submit),
            ],
          ),
        ),
      ),
    );
  }
}
