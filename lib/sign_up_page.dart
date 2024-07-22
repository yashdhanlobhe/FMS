import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'login_page.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFff5c30),
        title: const Text(''),
        primary: false,
      ),
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2.5,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(
                                  0xFFff5c30), // This is another color in the gradient
                              Color(
                                  0xFFff5c30), // This is the color in question
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Card(
                              elevation: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: SignUpForm(),
                              ),
                            ),
                            const SizedBox(height: 10),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(
                                    context); // Navigate back to login page
                              },
                              child: const Text(
                                'Already have an account? Sign In',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  String? _name;
  String? _mobileNumber;
  String? _password;
  String? _confirmPassword;
  String? _unitId;
  DateTime? _lastDayInUnit;
  String? _preference;
  bool _isDateSelected = false;
  bool _rankError = false;
  bool _mobileError = false;
  bool _passwordError = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Sign Up',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          _buildNameField(),
          const SizedBox(height: 20),
          _buildMobileNumberField(),
          const SizedBox(height: 20),
          _buildPasswordField(),
          const SizedBox(height: 20),
          _buildConfirmPasswordField(),
          const SizedBox(height: 20),
          _buildUnitIdField(),
          const SizedBox(height: 20),
          _buildLastDayInUnitPicker(context),
          const SizedBox(height: 20),
          _buildPreferenceDropdown(),
          const SizedBox(height: 20),
          _buildSignUpButton(),
        ],
      ),
    );
  }

  Widget _buildNameField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Name',
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        errorText: _rankError ? 'Name should not include rank' : null,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your name';
        }
        if (value
            .toLowerCase()
            .contains(RegExp(r'\b(slt|lt|lt cdr|cdr|capt|cmde)\b'))) {
          setState(() {
            _rankError = true;
          });
          return 'Name should not include rank';
        }
        setState(() {
          _rankError = false;
        });
        return null;
      },
      onSaved: (value) => _name = value,
    );
  }

  Widget _buildMobileNumberField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Mobile Number',
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
        errorText:
            _mobileError ? 'Please enter a valid 10-digit mobile number' : null,
      ),
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your mobile number';
        }
        String cleaned = value.replaceAll(RegExp(r'\D'), '');
        if (cleaned.length != 10) {
          setState(() {
            _mobileError = true;
          });
          return 'Mobile number should have exactly 10 digits';
        }
        setState(() {
          _mobileError = false;
        });
        return null;
      },
      onSaved: (value) => _mobileNumber = value,
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
      ),
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        if (value.length < 8) {
          return 'Password should be at least 8 characters long';
        }
        return null;
      },
      onSaved: (value) => _password = value,
    );
  }

  Widget _buildConfirmPasswordField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Confirm Password',
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
      ),
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please confirm your password';
        }
        if (value != _password) {
          return 'Passwords do not match';
        }
        return null;
      },
      onSaved: (value) => _confirmPassword = value,
    );
  }

  Widget _buildUnitIdField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Unit ID',
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your unit ID';
        }
        return null;
      },
      onSaved: (value) => _unitId = value,
    );
  }

  Widget _buildLastDayInUnitPicker(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2100),
        );
        if (pickedDate != null) {
          setState(() {
            _lastDayInUnit = pickedDate;
            _isDateSelected = true;
          });
        }
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _isDateSelected
                  ? 'Last Day in Unit: ${DateFormat('yyyy-MM-dd').format(_lastDayInUnit!)}'
                  : 'Select Last Day in Unit',
            ),
            const Icon(Icons.calendar_today),
          ],
        ),
      ),
    );
  }

  Widget _buildPreferenceDropdown() {
    return DropdownButtonFormField<String>(
      value: _preference,
      onChanged: (value) {
        setState(() {
          _preference = value;
        });
      },
      items: [
        DropdownMenuItem(
          value: 'veg',
          child: Row(
            children: const [
              Icon(Icons.emoji_food_beverage, color: Colors.green),
              SizedBox(width: 10),
              Text('Vegetarian'),
            ],
          ),
        ),
        DropdownMenuItem(
          value: 'nonveg',
          child: Row(
            children: const [
              Icon(Icons.emoji_food_beverage, color: Colors.red),
              SizedBox(width: 10),
              Text('Non-Vegetarian'),
            ],
          ),
        ),
      ],
      decoration: InputDecoration(
        labelText: 'Preference',
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }

  Widget _buildSignUpButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          // Perform signup logic with saved data
          // Navigate to another screen or perform other actions
          Navigator.pop(context); // Navigate back to login page
        }
      },
      child: const Text('Sign Up'),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15),
      ),
    );
  }
}
