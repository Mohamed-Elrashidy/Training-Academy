import 'package:flutter_test/flutter_test.dart';
import 'package:training_acedamy/core/service/crashlytics/crashlytics_service.dart';

void main() {
  group('CrashlyticsService helpers', () {
    test('hashIdentifier normalizes before hashing', () {
      final hashedValue = CrashlyticsService.hashIdentifier('  USER-123  ');

      expect(
        hashedValue,
        CrashlyticsService.hashIdentifier('user-123'),
      );
      expect(hashedValue, isNot('user-123'));
    });

    test('derive route context from path', () {
      expect(
        CrashlyticsService.deriveFeatureFromRoute('/auth/login'),
        'auth',
      );
      expect(
        CrashlyticsService.deriveModuleFromRoute('/auth/login'),
        'login',
      );
    });
  });
}
