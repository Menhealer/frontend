extension MapWithoutNull on Map<String, dynamic> {
  Map<String, dynamic> withoutNulls() {
    final result = <String, dynamic>{};
    forEach((key, value) {
      if (value == null) return;
      result[key] = value;
    });
    return result;
  }
}