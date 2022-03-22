import 'package:firestore_snippets/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

// ignore_for_file: avoid_print
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  /// When this application is built, it's sole purpose is to turn around and
  /// run functions that talk to Firebase. If it runs without an error, the snippets
  /// can be considered "correct".
  group('end-to-end test', () {
    testWidgets(
        'verify the app compiles and the Firebase snippets run. '
        'The app itself will throw errors if one arises.',
        (WidgetTester tester) async {
      print("integration_test/app_test.dart: Attempting to build application");
      try {
        app.main();
        await tester.pumpAndSettle();
        print("integration_test/app_test.dart: Test ran successfully.");
      } catch (error, stackTrace) {
        print("integration_test/app_test.dart: Ruh-roh, tests threw and error");
        print(stackTrace);
        print(error);
        rethrow;
      }
    });
  });
}
