import 'package:bsc_app/ai/logic/repo/ai_repo.dart';
import 'package:bsc_app/ai/ui/bloc/ai_bloc.dart';
import 'package:bsc_app/features/Servises/logic/nav.dart';
import 'package:bsc_app/features/Servises/pages/homesubpages/hebergement.dart';
import 'package:bsc_app/features/Servises/pages/navigation.dart';
import 'package:bsc_app/hebergement/ui/bloc/heberge_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';



  void main() {
  runApp(
    MultiProvider(
      providers: [
        // Your existing BLoC providers
        BlocProvider(create: (context) => AiBloc(AiRepo())),
        BlocProvider(create: (context) => HebergeBloc()),

        // Add your ChangeNotifier provider for the simple state management
        ChangeNotifierProvider(create:(context) => state(),), // Add your provider here
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(splashColor: Colors.transparent),
      home: HomePage(),
    );
  }
}
