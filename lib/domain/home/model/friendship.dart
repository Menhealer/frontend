class Friendship {
  final int id;
  final String name;
  final String? group;
  final String? birthday;
  final String info;

  Friendship({
    required this.id,
    required this.name,
    this.group,
    this.birthday,
    required this.info,
  });
}