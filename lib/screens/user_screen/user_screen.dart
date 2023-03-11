import 'package:flutter/material.dart';
import 'package:mini_store/models/user_model.dart';
import 'package:mini_store/screens/user_screen/widgets/user_details.dart';
import 'package:mini_store/services/api_handler.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "User",
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<UserModel>>(
        future: ApiHandler.getUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
                strokeWidth: 2,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "${snapshot.error}",
                style: const TextStyle(color: Colors.black),
              ),
            );
          } else if (snapshot.data == null) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return ChangeNotifierProvider.value(
                value: snapshot.data![index],
                child: const UsersWidget());
            },
          );
        },
      ),
    );
  }
}
