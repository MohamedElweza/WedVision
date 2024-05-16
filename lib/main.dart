import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/utils/app_router.dart';

void main() {
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
      ),
    );
  }
}

