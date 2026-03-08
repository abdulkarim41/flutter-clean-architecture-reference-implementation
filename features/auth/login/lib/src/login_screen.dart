import 'package:designsystem/designsystem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/shared.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.backgroundColorTheme.backgroundPrimary,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SizedBox(height: 40),

                // App Title
                const Text(
                  "Welcome Back 👋",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                AppText(
                  "Please login to your account",
                  textWeight: const AppTextWeight.regular(),
                  textScale: AppTextScale.bodyLarge,
                ),

                const SizedBox(height: 40),

                // Username Field

                AppTextField.filled(
                  controller: _usernameController,
                  hint: "Username",
                  prefixIcon: const Icon(Icons.person_outline),
                ),

                const SizedBox(height: 20),

                // Password Field
                AppTextField.filled(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  hint: "Password",
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),

                const SizedBox(height: 12),

                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text("Forgot Password?"),
                  ),
                ),

                const SizedBox(height: 20),

                // Login Button
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      final bool isLoading = state.isLoginLoading;
                      return SizedBox(
                        height: 55,
                        width: double.infinity,
                        child: FilledButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: isLoading
                              ? null
                              : () {
                            final username = "emilys";
                            final password = "emilyspass";
                            context.read<AuthBloc>().login(username, password);
                          },
                          child: isLoading
                              ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                              : const Text("Login"),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 30),

                // Sign up text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Don't have an account? "),
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}