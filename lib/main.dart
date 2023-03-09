import 'package:cat_breeds/ui/bloc/cat/cat_bloc.dart';
import 'package:cat_breeds/ui/bloc/page/page_bloc.dart';
import 'package:cat_breeds/ui/pages/detail_page.dart';
import 'package:cat_breeds/ui/pages/home_page.dart';
import 'package:cat_breeds/ui/pages/index_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await loadEnvVars();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CatBloc() ),
        BlocProvider(create: (_) => PageBloc() ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cat Demo',
        routes: {
          'home': (context) => const HomePage(cats: [],),
          'detail': (context) => const DetailPage(),
        },
        home: const IndexPage(),
      ),
    );
  }
}

Future loadEnvVars() async {
  await dotenv.load(
    fileName: '.env',
  );
}
