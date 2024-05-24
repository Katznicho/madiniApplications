import 'package:flutter/material.dart';
import 'package:madini/screens/home/components/popular_product.dart';
import 'package:madini/screens/pay/confirm_and_pay.dart';

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
                child: Image.network(
                  imageUrl ??
                      'https://admin.madinigroup.com/storage/product/01HXS1ADCZWY0D5MZZRZFBM6RE.jpg',
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
                    decoration: TextDecoration.underline),
              ),
              // const Divider(thickness: 0, height: 30),
              const SizedBox(height: 30),

              Text(
                description,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 15),
              const Divider(thickness: 0, height: 30),
              const SizedBox(height: 15),
              Text(
                idealFor,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 15),
              const Divider(thickness: 0, height: 30),
              const SizedBox(height: 15),
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
              const SizedBox(height: 15),
              const Divider(thickness: 0, height: 30),
              const SizedBox(height: 15),

              Row(children: [
                Column(children: [
                  Text(
                    'UGX $price / Elf',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    deliveryInfo,
                    style: TextStyle(fontSize: 12),
                  ),
                ]),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Handle Add action
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/cart_icon.jpg',
                            height: 20,
                            width: 20,
                          ),
                          const SizedBox(width: 5),
                          Text('Add'),
                        ],
                      ),
                    ),

                    //add horizontal space
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ConfirmAndPayPage(
                              imageUrl: imageUrl,
                              title: title,
                              description: description,
                              idealFor: idealFor,
                              strength: strength,
                              aggregateSize: aggregateSize,
                              price: price,
                              deliveryInfo: deliveryInfo,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                      child: Text(
                        'Buy Now',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
              ]),
            const SizedBox(height: 15),
              const Divider(thickness: 0, height: 30),
              const SizedBox(height: 25),
              Text(
                'Value Added',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    decoration: TextDecoration.underline),
              ),
              const SizedBox(height: 50),
              PopularProducts(page: 1, category_id: 2),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
