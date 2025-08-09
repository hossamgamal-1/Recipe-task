import 'package:flutter/material.dart';

import 'core/di/di.dart';
import 'core/routing/app_router.dart';
import 'core/routing/app_routes.dart';
import 'core/theming/app_sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setupDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, _) {
        AppSizer.initialize(context);
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Reciepe Task',
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: AppRoutes.home,
        );
      },
    );
  }
}
