import 'package:flutter/material.dart';

import '../utils/validators.dart';
import '../widgets/primary_button.dart';

/// Ekran za prijavu. Povezivanje sa API-jem slijedi u narednoj kontrolnoj tacki.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    // TODO: poziv POST /auth/login
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Prijava')),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: [
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
                validator: (v) => Validators.required(v, 'Lozinka'),
              ),
              const SizedBox(height: 24),
              PrimaryButton(label: 'Prijavi se', onPressed: _submit),
            ],
          ),
        ),
      ),
    );
  }
}
