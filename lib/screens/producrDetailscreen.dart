import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class ProductDetails extends StatefulWidget {
  
  final int productId;

  const ProductDetails({super.key, required this.productId});
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
   Map productDetails = {};
    @override
  void initState() {
    super.initState();
    fetchProductDetails();
  }
    Future<void> fetchProductDetails() async {
    final response = await http.get(
      Uri.parse('https://fakestoreapi.com/products/${widget.productId}'),
    );

    if (response.statusCode == 200) {
      setState(() {
        productDetails = jsonDecode(response.body);
      });
    } else {
      throw Exception('Failed to load product details');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffb03071E),
      ),
      body: productDetails.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    productDetails['image'],
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 20),
                  Text(
                    productDetails['title'],
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '\$${productDetails['price']}',
                    style: TextStyle(fontSize: 20, color: Colors.green),
                  ),
                  SizedBox(height: 20),
                  Text(
                    productDetails['description'],
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
    );
  }
}
    
  