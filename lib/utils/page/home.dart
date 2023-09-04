import 'package:flutter/material.dart';
import 'package:product_apps/api/list_products.dart';
import 'package:product_apps/models/product.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<ProductData?> data;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    data = _getData();
  }

  Future<ProductData?> _getData() async {
    try {
      final result = await GetListProducts().getData();
      setState(() {
        isLoading = false;
      });
      return result;
    } catch (e) {
      print("ERROR: $e");
      setState(() {
        isLoading = false;
      });
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: FutureBuilder<ProductData?>(
        future: data,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(
              child: Text("No data available."),
            );
          } else {
            final data = snapshot.data!;
            return ListView.builder(
              itemCount: data.products.length,
              itemBuilder: (context, index) {
                final product = data.products[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.network(
                        product.thumbnail,
                        width: 100,
                      ),
                      Text(product.title.toString()),
                      Text("\$${product.price.toString()}"),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
