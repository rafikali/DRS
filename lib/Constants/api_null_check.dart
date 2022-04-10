class NullCheck {
  static String? value = '';

  // ignore: non_constant_identifier_names
  static String? NullChecker() {
    if (value != null) {
      return 'Updating...';
    } else {
      return null;
    }
  }
}
