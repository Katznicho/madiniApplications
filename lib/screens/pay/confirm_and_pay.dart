import 'package:flutter/material.dart';
import 'package:madini/screens/pay/pesapal.dart';
import 'package:madini/services/api_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ConfirmAndPayPage extends StatefulWidget {
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
  _ConfirmAndPayPageState createState() => _ConfirmAndPayPageState();
}

class _ConfirmAndPayPageState extends State<ConfirmAndPayPage> {
  int quantity = 1;
  String address = '';
  String phoneNumber = '';
  String paymentPhoneNumber = '';
  String paymentOption = 'pay_in_full';
  late double totalPrice;
  GoogleSignInAccount? _currentUser;
  String userName = '';
  String userEmail = '';
  String firstName = '';
  String lastName = '';
  bool _isLoading = false;
  // String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    address = widget.deliveryInfo;
    totalPrice = double.parse(widget.price) * quantity;
  }

  void _updateTotalPrice() {
    setState(() {
      totalPrice = double.parse(widget.price) * quantity;
    });
  }

  void _editQuantity(int newQuantity) {
    setState(() {
      quantity = newQuantity > 0 ? newQuantity : 1;
      _updateTotalPrice();
    });
  }

  Future<void> _editAddress() async {
    // Navigate to Google Maps page for address selection
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddressSelectionPage(),
      ),
    );

    if (result != null) {
      setState(() {
        address = result;
      });
    }
  }

  void _editPhoneNumber(String newPhoneNumber) {
    setState(() {
      phoneNumber = newPhoneNumber;
    });
  }

  void _editPaymentPhoneNumber(String newPaymentPhoneNumber) {
    setState(() {
      paymentPhoneNumber = newPaymentPhoneNumber;
    });
  }

  Future<void> _confirmAndPay() async {
    // if (phoneNumber.isEmpty ) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text('Please enter your phone number a')),
    //   );
    //   return;
    // }

    // GoogleSignIn _googleSignIn = GoogleSignIn();
    // try {
    //   var user = await _googleSignIn.signIn();
    //   setState(() {
    //     _currentUser = user;
    //     if (_currentUser != null) {
    //       userName = _currentUser!.displayName ?? '';
    //       userEmail = _currentUser!.email;
    //       List<String> names = userName.split(' ');
    //       firstName = names.first;
    //       lastName = names.length > 1 ? names.sublist(1).join(' ') : '';
    //     }
    //   });
    //   if (_currentUser != null) {
        final apiService = ApiService();
        final response = await apiService.processOrder(
          amount: totalPrice,
          quantity: quantity,
          // phoneNumber: phoneNumber,
          // paymentPhoneNumber: phoneNumber,
          // firstName: firstName,
          // lastName: lastName,
        );

        // final redirectUrl = response['data']['message']['redirect_url'];
        final redirectUrl = response['message']['redirect_url'];

        if (redirectUrl != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Pesapal(
                amount: totalPrice,
                quantity: quantity,
                redirectUrl: redirectUrl,
              ),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error processing the order. Please try again.')),
          );
        }
    //   }
    // } catch (error) {
    //   print(error);
    // }
  }

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
            const Divider(thickness: 0, height: 0),
            const SizedBox(height: 15),
            Row(
              children: [
                Center(
                  child: Image.asset(
                    widget.imageUrl,
                    height: 200,
                    width: 200,
                    fit: BoxFit.fill,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.description,
                      style: TextStyle(fontSize: 10),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'UGX ${widget.price}',
                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [const Icon(Icons.star), Text('5.00 (1)')],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Divider(thickness: 1, height: 30),
            Text(
              'Your payment is protected by Hamlet Group',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
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
                Column(
                  children: [
                    Text(
                      'Quantity',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () => _editQuantity(quantity - 1),
                        ),
                        Text('$quantity Tonne (1 Elf Truck)'),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () => _editQuantity(quantity + 1),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'Deliver To: Muyenga',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(address),
                  ],
                ),
                TextButton(
                  onPressed: _editAddress,
                  child: Text(
                    'Edit',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ),
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
                Text('UGX ${widget.price} x $quantity Tonne'),
                Text('UGX $totalPrice'),
              ],
            ),
            const Divider(thickness: 1, height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: UGX',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text('UGX $totalPrice'),
              ],
            ),
            const Divider(thickness: 1, height: 30),
            Text(
              'Pay With',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: Image.asset(
                'assets/images/visa.jpg',
                width: 30,
                height: 30,
              ),
              title: Text('Credit or debit card'),
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Image.asset(
                'assets/images/apple pay.jpeg',
                width: 30,
                height: 30),
              title: Text('Apple Pay'),
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Image.asset(
                'assets/images/airtel.jpg',
                width: 30,
                height: 30,
              ),
              title: Text('Airtel Money'),
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Image.asset(
                'assets/images/mtn.jpg',
                width: 30,
                height: 30,
              ),
              title: Text('MTN Mobile Money'),
              trailing: Icon(Icons.add),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter ASM Coupon',
                    ),
                  ),
                ),
              ],
            ),
            const Divider(thickness: 1, height: 30),
            const Divider(thickness: 1, height: 30),
            Text(
              'Choose how to Pay',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            RadioListTile(
              value: 'pay_in_full',
              groupValue: paymentOption,
              onChanged: (value) {
                setState(() {
                  paymentOption = value.toString();
                });
              },
              title: Text('Pay in full'),
              subtitle: Text('Pay the total (UGX $totalPrice) now and you\'re all set.'),
            ),
            RadioListTile(
              value: 'pay_on_delivery',
              groupValue: paymentOption,
              onChanged: (value) {
                setState(() {
                  paymentOption = value.toString();
                });
              },
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
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Phone Number',
                    ),
                    onChanged: _editPhoneNumber,
                  ),
                ),
              ],
            ),
            const Divider(thickness: 1, height: 30),
            Text(
              'Cancellation Policy',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('Free cancellation before 1 Mar. Cancel before 20 Mar for a partial refund.'),
            const SizedBox(height: 20),
            Text(
              'By selecting the button below, I agree to Madini\'s policy, delivery and refund policy and that Madini can charge my payment method if items have been delivered on site.',
            ),
            const SizedBox(height: 20),
           ElevatedButton(
  onPressed: () {
    setState(() {
      _isLoading = true; // Set loading state to true
    });
    _confirmAndPay(); // Call your existing function for confirmation and payment
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.red,
    padding: EdgeInsets.symmetric(vertical: 15),
    minimumSize: Size(double.infinity, 50),
  ),
  child: _isLoading
      ? CircularProgressIndicator() // Show circular loader when loading
      : Text(
          'Confirm and Pay',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
)
          ],
        ),
      ),
    );
  }
}

class AddressSelectionPage extends StatefulWidget {
  @override
  _AddressSelectionPageState createState() => _AddressSelectionPageState();
}

class _AddressSelectionPageState extends State<AddressSelectionPage> {
  late GoogleMapController mapController;
  LatLng _selectedLocation = LatLng(-1.2921, 36.8219); // Coordinates of Nairobi

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Delivery Address'),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              Navigator.pop(context, 'Selected Address at (${_selectedLocation.latitude}, ${_selectedLocation.longitude})');
            },
          ),
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _selectedLocation,
          zoom: 14.0,
        ),
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        onTap: (LatLng location) {
          setState(() {
            _selectedLocation = location;
          });
        },
      ),
    );
  }
}
