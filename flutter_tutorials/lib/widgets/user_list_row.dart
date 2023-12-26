import 'package:flutter/material.dart';
import 'package:flutter_tutorials/model/users.dart';

class UserListRow extends StatelessWidget {
  const UserListRow({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        user.name,
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(user.email),
    );
  }
}
