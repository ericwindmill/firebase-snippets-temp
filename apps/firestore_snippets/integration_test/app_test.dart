import 'package:firestore_snippets/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets(
        'verify the app compiles and the Firebase snippets run. '
        'The app itself will throw errors if one arises.',
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();
    });
  });
}
