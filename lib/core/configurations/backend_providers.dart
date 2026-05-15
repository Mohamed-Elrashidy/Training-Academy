enum BackendProviders {
  SUPABASE,
  FIREBASE;

  static BackendProviders getByName(
    String string, {
    required String defaultValue,
  }) {
    try {
      return BackendProviders.values.firstWhere(
        (e) => e.name.toLowerCase() == string.toLowerCase(),
      );
    } catch (e) {
      return BackendProviders.values.firstWhere(
        (e) => e.name.toLowerCase() == defaultValue.toLowerCase(),
      );
    }
  }
}
