import 'package:flutter/material.dart';
import 'package:product_apps/api/list_products.dart';
import 'package:product_apps/models/product.dart';
import 'package:dropdown_search/dropdown_search.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late Future<ProductData?> data;
  bool isLoading = true;

  List<Product> allProducts = [];
  List<Product> filteredProducts = [];
  String? selectedItem = "Semua";

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
        allProducts = result?.products ?? [];
        filteredProducts = allProducts;
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
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownSearch<String>(
                items: allProducts.map((e) => e.title).toList(),
                onChanged: (selectedItem) {
                  setState(
                    () {
                      this.selectedItem = selectedItem;
                      if (selectedItem == "Semua") {
                        filteredProducts = allProducts;
                      } else {
                        filteredProducts = allProducts
                            .where((product) =>
                                product.title.toString() == selectedItem)
                            .toList();
                      }
                    },
                  );
                },
              ),
            ),
            listProducts(),
          ],
        ),
      ),
    );
  }

  Expanded listProducts() {
    return Expanded(
      child: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : filteredProducts.isEmpty
              ? const Center(
                  child: Text("No data available."),
                )
              : ListView.builder(
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) {
                    final product = filteredProducts[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 4,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 150,
                              height: 150,
                              child: Image.network(
                                product.thumbnail,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.title.toString(),
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "\$${product.price.toString()}",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.green,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    product.description.toString(),
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
