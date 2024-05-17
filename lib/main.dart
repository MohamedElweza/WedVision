import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wedvision/features/home/presentation/views/details_screen.dart';
import 'package:wedvision/features/home/presentation/views/home.dart';
import 'package:wedvision/features/registration/presentation/views/welcome_screen.dart';
import 'core/utils/app_router.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      WedVision(appRouter: AppRouter(),),
  );
}

class WedVision extends StatelessWidget {
  const WedVision({super.key, required this.appRouter});

final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
      ensureScreenSize: true,
      builder: (context, child) => MaterialApp(
        builder: (context, child) {
          return MediaQuery(data: MediaQuery.of(context).copyWith(
              textScaler: const TextScaler.linear(1.0)),
            child: child!,
          );
        },
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute,
        home: HomeScreen(),
      ),
    );
  }
}

