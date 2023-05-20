import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
  }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:const Text('Form Example'),
        ),
        body: Builder(
          builder: (BuildContext context) {
            return const MyForm();
          },
        ),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
 const MyForm({super.key});
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
 final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Valid form, perform form submission logic
    print('Form submitted');
      // Implement your form submission logic here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration:const InputDecoration(labelText: 'Name'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
          const SizedBox(height: 16.0),
            TextFormField(
              controller: _emailController,
              decoration:const InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                if (!value.contains('@')) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
            ),
          const SizedBox(height: 16.0),
            TextFormField(
              controller: _passwordController,
              decoration:const InputDecoration(labelText: 'Password'),
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a password';
                }
                if (value.length < 6) {
                  return 'Password must be at least 6 characters long';
                }
                return null;
              },
            ),
          const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _submitForm,
              child:const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
