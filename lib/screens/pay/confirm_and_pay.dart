import 'package:flutter/material.dart';

class ConfirmAndPayPage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String idealFor;
  final String strength;
  final String aggregateSize;
  final String price;
  final String deliveryInfo;

  const ConfirmAndPayPage({
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Confirm and Pay',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
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
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              description,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'UGX $price',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(thickness: 1, height: 30),
            Text(
              'Your payment is protected by Hamlet Group',
              style: TextStyle(fontSize: 16),
            ),
            const Divider(thickness: 1, height: 30),
            Text(
              'Your Order',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Quantity'),
                Text('1 Tonne (1 Elf Truck)'),
                TextButton(onPressed: () {}, child: Text('Edit')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Deliver To:'),
                Text('Munyoyo'),
                TextButton(onPressed: () {}, child: Text('Edit')),
              ],
            ),
            const Divider(thickness: 1, height: 30),
            Text(
              'Price details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('UGX 150,000 x 1 Tonne'),
                Text('UGX $price'),
              ],
            ),
            const Divider(thickness: 1, height: 30),
            Text(
              'Pay With',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.credit_card),
              title: Text('Credit or debit card'),
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text('PayPal'),
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(Icons.mobile_friendly),
              title: Text('Airtel Money'),
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(Icons.mobile_friendly),
              title: Text('MTN Mobile Money'),
              trailing: Icon(Icons.add),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter ASM Coupon',
              ),
            ),
            const Divider(thickness: 1, height: 30),
            Text(
              'Choose how to Pay',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            RadioListTile(
              value: 'pay_in_full',
              groupValue: 'payment_option',
              onChanged: (value) {},
              title: Text('Pay in full'),
              subtitle: Text('Pay the total (UGX $price) now and you\'re all set.'),
            ),
            RadioListTile(
              value: 'pay_on_delivery',
              groupValue: 'payment_option',
              onChanged: (value) {},
              title: Text('Pay Upon Delivery'),
              subtitle: Text('Pay by cash on delivery. Non-refundable COD fees of UGX 10,000 may apply.'),
            ),
            const Divider(thickness: 1, height: 30),
            Text(
              'Required for your delivery',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Phone number'),
                TextButton(onPressed: () {}, child: Text('Add')),
              ],
            ),
            const Divider(thickness: 1, height: 30),
            Text(
              'Cancellation Policy',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Free cancellation before 1 Mar. Cancel before 20 Mar for a partial refund.',
            ),
            const SizedBox(height: 20),
            Text(
              'By selecting the button below, I agree to Madini\'s policy, delivery and refund policy and that Madini can charge my payment method if items have been delivered on site.',
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle payment confirmation
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(vertical: 15),
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Confirm and Pay', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
