
class JobItem {
  final String label;
  final String value;
  final bool isHighlighted;

  JobItem({
    required this.label,
    required this.value,
    this.isHighlighted = false,
  });
}