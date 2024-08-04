import 'package:equatable/equatable.dart';

class Expense extends Equatable {
  final int? id;
  final String title;
  final String time;
  final int amount;
  final bool isRecent;

  const Expense(
      {required this.id,
      required this.title,
      required this.time,
      required this.amount,
      required this.isRecent,
      });

  @override
  List<Object> get props {
    return [id!, title, time, amount,isRecent];
  }
}
