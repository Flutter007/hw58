import 'package:flutter/material.dart';
import 'package:hw58/models/status.dart';

final statuses = [
  Status(
    id: 'want_to_buy',
    title: 'Want to buy',
    icon: Icons.watch_later_outlined,
  ),
  Status(id: 'bought', title: 'Bought', icon: Icons.attach_money_outlined),
  Status(id: 'in_process', title: 'In process', icon: Icons.work_outline),
  Status(id: 'done', title: 'Done', icon: Icons.check_circle_outline),
];
