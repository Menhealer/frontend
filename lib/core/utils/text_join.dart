String joinLines(List<String?> items) {
  final cleaned = items
      .where((e) => e != null)
      .map((e) => e!.trim())
      .where((e) => e.isNotEmpty)
      .toList();

  return cleaned.join('\n');
}

String joinSections(List<List<String?>> sections) {
  final blocks = sections
      .map(joinLines)
      .map((s) => s.trim())
      .where((s) => s.isNotEmpty)
      .toList();

  return blocks.join('\n\n');
}