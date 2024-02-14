

import 'package:izzy_note/export_libs/export_libs.dart';

bool shouldUseFirebaseEmulator = false;
late final FirebaseApp app;
late final FirebaseAuth auth;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  app = await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyD8IZwOz2OB1T1sBfBB-CVq3rV43d4oa9M',
        appId: '1:354726762654:android:7446f98b7fb58b0485438f',
        projectId: 'izzy-note',
        messagingSenderId: '354726762654',
      )
    //DefaultFirebaseOptions.currentPlatform,
    //use DefaultFirebaseOptions.currentPlatform if that code above doesn't work
  );
  auth = FirebaseAuth.instanceFor(app: app);

  if (shouldUseFirebaseEmulator) {
    await auth.useAuthEmulator('localhost', 9099);
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashPage(),
      routes: {
        MyPages.id:(context) => const MyPages(),
        HomePage.id:(context) => const HomePage(),
        SignUpPage.id:(context) => const SignUpPage(),
        SignInPage.id:(context) => const SignInPage(),
        CreatePage.id:(context) => const CreatePage(),
        TextPage.id:(context) => const TextPage('','',''),
      },
    );
  }
}

