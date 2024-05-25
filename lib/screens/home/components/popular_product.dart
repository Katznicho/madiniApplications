import 'package:flutter/material.dart';
import 'package:madini/services/api_service.dart';
import 'package:madini/widgets/product_card.dart';

class PopularProducts extends StatefulWidget {

  final int page;
  final int category_id;
  const PopularProducts({super.key,
 required this.page,
  required this.category_id
  
  });
  

  @override
  State<PopularProducts> createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
  List<dynamic> _products = [];
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

Future<void> _fetchProducts() async {
  try {
    final apiService = ApiService();
    final result = await apiService.getProducts(page: widget.page, category_id: widget.category_id);
    final productsData = result['products']['data']; // Access the data list
    setState(() {
      _products = productsData;
      _isLoading = false;
    });
  } catch (e) {
    // Handle error
    print('Error fetching products: $e');
    setState(() {
      _errorMessage = e.toString();
      _isLoading = false;
    });
  }
}




  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_errorMessage.isNotEmpty) {
      return Center(child: Text('Error: $_errorMessage'));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              children: _products.map((product) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ProductCard(
                    imageUrl: product['image_url'] ?? 'https://admin.madinigroup.com/storage/product/01HXS1ADCZWY0D5MZZRZFBM6RE.jpg',
                    name: product['name'] ?? 'No Name',
                    price: product['price'].toString(),
                    category: product['category'] ?? 'Unknown',
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
