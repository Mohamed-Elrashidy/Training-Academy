import 'package:flutter_test/flutter_test.dart';
import 'package:training_acedamy/training_academy_app.dart';

void main() {
  testWidgets('TrainingAcademyApp builds', (WidgetTester tester) async {
    await tester.pumpWidget(TrainingAcademyApp());

    expect(find.byType(TrainingAcademyApp), findsOneWidget);
  });
}
