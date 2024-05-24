import 'package:flutter/material.dart';
import 'package:madini/screens/item/item_description_page.dart';


class ProductCard extends StatelessWidget {
  final String category;
  final String name;
  final String imageUrl;
  final String price;

  const ProductCard({
    Key? key,
    required this.category,
    required this.name,
    required this.imageUrl,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemDescriptionPage(
              imageUrl: imageUrl,
              title: name,
              description:
                  '25mm aggregate size lake sand', // Provide actual data
              idealFor:
                  'Ideal for Plaster. Locally sourced from Lwera, Masaka', // Provide actual data
              strength: '7 KN', // Provide actual data
              aggregateSize: '25mm', // Provide actual data
              price: price,
              deliveryInfo: 'Free Delivery in Kampala', // Provide actual data
            ),
          ),
        );
      },
      child: Container(
        width: 200, // Adjust as needed
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imageUrl,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.add),
                      SizedBox(width: 4),
                      Text('Add'),
                    ],
                  ),
                ),
                Text(
                  'UGX $price',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
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
