import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:domain/domain.dart' as domain;
import 'package:common/common.dart' as common;
import 'package:common/common.dart';
import 'package:domain/domain.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool _isLoading = false;

  final PostLoginApiUsecase _loginUsecase =
  GetIt.I<PostLoginApiUsecase>();

  Future<void> _onLoginClicked() async {

    setState(() {
      _isLoading = true;
    });

    final params = LoginApiParams(
      username: "",
      password: "",
    );

    final result = await _loginUsecase.invoke(params);

    setState(() {
      _isLoading = false;
    });

    result.when(
      success: (data) {
        print("Login Success: ${data.accessToken}");

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Login Success")),
        );
      },
      failure: (error) {
        print("Login Failed: $error");

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Login Failed")),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Products")),
      body: Column(
        children: [
          _isLoading
              ? const CircularProgressIndicator()
              : ElevatedButton(
            onPressed: _onLoginClicked,
            child: const Text("Login"),
          ),
        ],
      ),
    );
  }
}

class ProductService {

  static const String baseUrl = "https://dummyjson.com/";

  Future<List<dynamic>> getProducts() async {

    final uri = Uri.parse("${baseUrl}products");

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data["products"];
    } else {
      throw Exception("Failed to load products");
    }
  }
}
