import 'package:intl/intl.dart';

extension StringExtension on String? {
  bool isNullOrEmpty() => this == "" || this == null;
}

extension DoubleExtension on double {
  String get formattedBalance {
    final formatter = NumberFormat("#,##0.00", "en_US");
    return formatter.format(this);
  }
}