import 'package:epicstar/screens/home_screen/home_screen.dart';
import 'package:epicstar/screens/users_auth/login_screen/_login_parent_view.dart';
import 'package:epicstar/view_model_providers/auth_provider.dart';
import 'package:epicstar/view_model_providers/home_provider.dart';
import 'package:epicstar/view_model_providers/pref_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core_utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(
          create: (_) => HomeProvider(),
          lazy: true,
        ),
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(),
          lazy: true,
        ),
        ChangeNotifierProvider<PrefProvider>(
          create: (_) => PrefProvider(),
          lazy: true,
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Network',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home:  const ParentLoginView(),
      ),
    );
  }
}
