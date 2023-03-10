import 'package:flutter/material.dart';
import 'package:grocery/constants/dimension.dart';

class TextFieldSignUp extends StatefulWidget {
  const TextFieldSignUp({super.key});

  @override
  State<TextFieldSignUp> createState() => _TextFieldSignUpState();
}

class _TextFieldSignUpState extends State<TextFieldSignUp> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFoucs = FocusNode();
  final FocusNode _emailFoucs = FocusNode();
  final FocusNode _addressFoucs = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscureTrue = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordFoucs.dispose();
    _emailFoucs.dispose();
    _addressFoucs.dispose();
    _addressController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  void _submitForm() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    final AppDimensions dimensions = AppDimensions(context);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            textInputAction: TextInputAction.next,
            onEditingComplete: () =>
                FocusScope.of(context).requestFocus(_emailFoucs),
            controller: _nameController,
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value!.isEmpty) {
                return 'This field is missing';
              } else {
                return null;
              }
            },
            style: const TextStyle(color: Colors.black),
            decoration: const InputDecoration(
              hintText: 'Full Name',
              hintStyle: TextStyle(color: Colors.black),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red)),
            ),
          ),
          SizedBox(
            height: dimensions.getScreenH(20),
          ),
          TextFormField(
            focusNode: _emailFoucs,
            textInputAction: TextInputAction.next,
            onEditingComplete: () =>
                FocusScope.of(context).requestFocus(_passwordFoucs),
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value!.isEmpty ||
                  !value.contains('@') ||
                  !value.contains('.')) {
                return 'Please enter a valid email';
              } else {
                return null;
              }
            },
            style: const TextStyle(color: Colors.black),
            decoration: const InputDecoration(
              hintText: 'Email',
              hintStyle: TextStyle(color: Colors.black),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red)),
            ),
          ),
          SizedBox(
            height: dimensions.getScreenH(20),
          ),
          TextFormField(
            onEditingComplete: () =>
                FocusScope.of(context).requestFocus(_addressFoucs),
            textInputAction: TextInputAction.next,
            controller: _passwordController,
            focusNode: _passwordFoucs,
            obscureText: _obscureTrue,
            keyboardType: TextInputType.visiblePassword,
            validator: (value) {
              if (value!.isEmpty || value.length < 8) {
                return 'Please enter a valid password';
              } else {
                return null;
              }
            },
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureTrue = !_obscureTrue;
                  });
                },
                child: Icon(
                  _obscureTrue ? Icons.visibility : Icons.visibility_off,
                  color: Colors.black,
                ),
              ),
              hintText: 'Password',
              hintStyle: const TextStyle(color: Colors.black),
              enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              errorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red)),
            ),
          ),
          SizedBox(
            height: dimensions.getScreenH(20),
          ),
          TextFormField(
            textInputAction: TextInputAction.done,
            onEditingComplete: () => _submitForm(),
            controller: _addressController,
            focusNode: _addressFoucs,
            keyboardType: TextInputType.streetAddress,
            validator: (value) {
              if (value!.isEmpty || value.length < 10) {
                return 'Please enter a valid address';
              } else {
                return null;
              }
            },
            style: const TextStyle(color: Colors.black),
            decoration: const InputDecoration(
              hintText: 'Address',
              hintStyle: TextStyle(color: Colors.black),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red)),
            ),
          ),
        ],
      ),
    );
  }
}
