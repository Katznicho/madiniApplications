import 'package:flutter/material.dart';

class ItemDescriptionPage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String idealFor;
  final String strength;
  final String aggregateSize;
  final String price;
  final String deliveryInfo;

  const ItemDescriptionPage({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.idealFor,
    required this.strength,
    required this.aggregateSize,
    required this.price,
    required this.deliveryInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  imageUrl,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const Divider(thickness: 1, height: 30),
              Text(
                description,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              Text(
                idealFor,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const Divider(thickness: 1, height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Strength',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        strength,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Aggregate Size',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        aggregateSize,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(thickness: 1, height: 30),
              Text(
                'Value Added',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'UGX $price',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  deliveryInfo,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Add to cart logic
                  },
                  icon: Icon(Icons.add_shopping_cart),
                  label: Text('Add'),
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Buy now logic
                  },
                  child: Text('Buy Now'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: StadiumBorder(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
