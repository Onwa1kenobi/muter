extension StringExtension on String {
  String capitalize() => this[0].toUpperCase() + this.substring(1);

  int toInt() => int.parse(this);
}