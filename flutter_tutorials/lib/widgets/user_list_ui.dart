import 'package:flutter/material.dart';
import 'package:flutter_tutorials/model/users.dart';
import 'package:flutter_tutorials/widgets/user_list_row.dart';

class UserListUI extends StatelessWidget {
  const UserListUI({super.key, required this.users});

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: users.length,
      itemBuilder: (_, index) => UserListRow(user: users[index]),
      separatorBuilder: (context, index) => const Divider(),
    );
  }
}
