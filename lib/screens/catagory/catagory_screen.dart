import 'package:flutter/material.dart';
import 'package:mini_store/models/product_model.dart';
import 'package:mini_store/screens/catagory/widgets/product_card.dart';
import 'package:mini_store/services/api_handler.dart';

class CatagoryScreen extends StatelessWidget {
  const CatagoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Categories",
        ),
      ),
      body: SafeArea(
        child: FutureBuilder<List<ProductModel>>(
          future: ApiHandler.getProduct(),
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
            return GridView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 0.0,
                mainAxisSpacing: 0.0,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                return ProductCards(categeory: snapshot.data![index].category!,);
              },
            );
          },
        ),
      ),
    );
  }
}
