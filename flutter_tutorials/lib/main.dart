import 'package:flutter_tutorials/utils/exports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // @override
  // Widget build(BuildContext context) {
  //   return const MaterialApp(
  //     title: 'Flutter Theme Extensions',
  //     home: FormPageProvider(),
  //   );
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Flutter Form Validation',
  //     navigatorKey: navigatorKey,
  //     home: MultiProvider(
  //       providers: [
  //         ChangeNotifierProvider(
  //           create: (_) => FormNotifier(),
  //         )
  //       ],
  //       child: const FormPageProvider(),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Form Validation',
      navigatorKey: navigatorKey,
      home: BlocProvider(
        create: (context) => FormBloc()..add(const InitEvent()),
        child: const BlocFormScreen(),
      ),
    );
  }
}
