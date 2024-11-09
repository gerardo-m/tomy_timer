import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

class MeetingItem {
  int id;
  String name;
  String role;
  Duration duration;
  DateTime startTime;

  Duration? greenTime;
  Duration? ambarTime;
  Duration redTime;

  Color? color;

  MeetingItem({
    required this.id,
    required this.name,
    required this.role,
    required this.duration,
    required this.startTime,
    this.greenTime,
    this.ambarTime,
    required this.redTime,
    this.color,
  });

  factory MeetingItem.createEmptyMeetingItem(){
    return MeetingItem(id: Isar.autoIncrement, name: 'Nombre', role: 'Rol', duration: Duration.zero, startTime: DateTime.now(), redTime: const Duration(minutes: 1));
  }

  EMeetingItem toEMeetingItem() {
    return EMeetingItem(
      id: id,
      name: name,
      role: role,
      duration: duration,
      startTime: startTime,
      greenTime: greenTime,
      ambarTime: ambarTime,
      redTime: redTime,
      color: color,
    );
  }
}

class EMeetingItem with EquatableMixin {
  final int id;
  final String name;
  final String role;
  final Duration duration;
  final DateTime startTime;

  final Duration? greenTime;
  final Duration? ambarTime;
  final Duration redTime;

  final Color? color;

  EMeetingItem({
    required this.id,
    required this.name,
    required this.role,
    required this.duration,
    required this.startTime,
    this.greenTime,
    this.ambarTime,
    required this.redTime,
    this.color,
  });

  @override
  List<Object?> get props => [id, name, role, duration, startTime, greenTime, ambarTime, redTime, color];
}
