
import 'package:authinticationproj_flutter/src/serverpod_client.dart';
import 'package:authinticationproj_flutter/src/widgets/account_page.dart';
import 'package:authinticationproj_flutter/src/widgets/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';



void main() async{
  // Need to call this as SessionManager is using Flutter bindings before runApp
  // is called.
  WidgetsFlutterBinding.ensureInitialized();

  await initializeServerpodClient();

 runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Serverpod demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Serverpod Example1'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
void initState() {
  super.initState();

  // Make sure that we rebuild the page if signed in status changes.
  sessionManager.addListener(() {
    setState(() {});
  });
}


  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: sessionManager.isSignedIn ? const AccountPage() : const SignInPage(),
    );
  }
}

class TestGitHubBranches extends StatefulWidget {
 // This command is added to test the pull request of any branch other than the main branch
  const TestGitHubBranches({super.key});

  @override
  State<TestGitHubBranches> createState() => _TestGitHubBranchesState();
}

class _TestGitHubBranchesState extends State<TestGitHubBranches> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
