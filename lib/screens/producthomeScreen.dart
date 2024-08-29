// ignore_for_file: avoid_print, prefer_const_constructors

import 'dart:convert';

import 'package:fakestore_application/screens/producrDetailscreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<dynamic> products = [];
  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      setState(() {
        products = jsonDecode(response.body);
      });
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffb03071E),
      ),
      body: RefreshIndicator(
        onRefresh: fetchProducts,
        child: products.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.separated(
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.network(
                      products[index]['image'],
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(products[index]['title']),
                    subtitle: Text('\$${products[index]['price']}'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetails(
                            productId: products[index]['id'],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
      ),
    );
  }
}
