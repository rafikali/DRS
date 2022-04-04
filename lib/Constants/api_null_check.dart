class NullCheck {
  static String? value = '';

  static String? NullChecker() {
    if (value != null) {
      return 'Updating...';
    } else {
      return null;
    }
  }
}
