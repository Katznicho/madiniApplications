import 'package:flutter/material.dart';
import 'package:madini/screens/item/item_description_page.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;
  final String category;

  const ProductCard({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Image URL Parsed: $imageUrl');
    return GestureDetector(
      onTap: () {
        print("Image URL: $imageUrl");
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
        width: 210, // Adjust as needed
        margin: const EdgeInsets.symmetric(horizontal: 0),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border(
            right: BorderSide(
              color: Colors.grey,
              width: 1.0,
            ),
            bottom: BorderSide(
              color: Colors.grey,
              width: 1.0,
            ),
          ),
          
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                
                imageUrl,

                height: 110,
                width: double.infinity,
                fit: BoxFit.cover,
             
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return _buildPlaceholder();
                },
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
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Text('Add'),
                      SizedBox(width: 4),
                      Image.asset(
                        'assets/images/cart_icon.jpg',
                        width: 30,
                        height: 30,
                      ),
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

  Widget _buildPlaceholder() {
    return Center(
      child: SizedBox(
        width: 110,
        height: 110,
        child: Placeholder(), // Replace with your placeholder widget/image
      ),
    );
  }
}
