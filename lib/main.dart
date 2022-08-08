import 'package:epicstar/screens/web_home_view/web_home_view.dart';
import 'package:epicstar/view_model_providers/auth_provider.dart';
import 'package:epicstar/view_model_providers/home_provider.dart';
import 'package:epicstar/view_model_providers/pref_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    statusBarColor: Colors.transparent, // optional
  ));

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
        title: 'Epicstar',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: const WebHomeView(),
      ),
    );
  }
}
