import 'dart:io';
import 'package:common/common.dart';
import 'package:designsystem/designsystem.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/shared.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../router/app_router.dart';
part 'theme_config.dart';

class MyApplication extends StatefulWidget {
  const MyApplication({super.key});

  @override
  State<MyApplication> createState() => _MyApplicationState();
}

class _MyApplicationState extends State<MyApplication> {

  late final AuthBloc _authBloc;
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _authBloc = AuthBloc(
      fetchProfileApiUsecase: GetIt.I.get<FetchProfileApiUsecase>(),
      postLoginApiUsecase: GetIt.I.get<PostLoginApiUsecase>(),
      sharedPrefs: GetIt.I.get<SharedPrefs>(),
    );
    _router = AppRouter.router(_authBloc);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SafeArea(
          top: false,
          bottom: Platform.isAndroid,
          child: BlocProvider.value(
            value: _authBloc,
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerConfig: _router,
              theme: _buildAppTheme(Brightness.light),
              darkTheme: _buildAppTheme(Brightness.dark),
              themeMode: ThemeMode.system,
            ),
          ),
        );
      },
    );
  }
}
