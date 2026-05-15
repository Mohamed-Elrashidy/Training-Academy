import 'backend_providers.dart';

abstract class AppConfigurations {
  static const String supabaseUrl = String.fromEnvironment('SUPABASE_URL');
  static const String supabaseKey = String.fromEnvironment('SUPABASE_ANON_KEY');
  static BackendProviders backendService = BackendProviders.getByName(
    String.fromEnvironment('BACKEND_SERVICE'),
    defaultValue: 'SUPABASE',
  );
}
