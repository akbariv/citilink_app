import 'package:equatable/equatable.dart';

class Expenses extends Equatable {
  final int? id;
  final String title;
  final String day;
  final String time;
  final int amount;
  final bool isRecent;

  const Expenses(
      {required this.id,
      required this.title,
      required this.day,
      required this.time,
      required this.amount,
      required this.isRecent,
      });

  @override
  List<Object> get props {
    return [id!, title, day, time, amount,isRecent];
  }
}
