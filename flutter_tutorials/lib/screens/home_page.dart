import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorials/bloc/user_bloc.dart';
import 'package:flutter_tutorials/bloc/user_state.dart';
import 'package:flutter_tutorials/widgets/error_ui.dart';
import 'package:flutter_tutorials/widgets/loading.dart';
import 'package:flutter_tutorials/widgets/user_list_ui.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bloc Http Demo')),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoadingState) {
            return const LoadingUI();
          }
          if (state is UserLoadedState) {
            return UserListUI(users: state.users);
          }
          if (state is UserErrorState) {
            return UserErrorUI(message: state.error);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
