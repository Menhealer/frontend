class PresentFriend {
  final int id;
  final String name;
  final String? group;
  final DateTime? birthday;

  PresentFriend({
    required this.id,
    required this.name,
    this.group,
    this.birthday,
  });
}