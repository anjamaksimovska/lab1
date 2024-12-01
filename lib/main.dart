import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clothing App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> clothingItems = [
    {
      "name": "T-Shirt",
      "image": "https://via.placeholder.com/150",
      "description": "A comfortable cotton T-Shirt.",
      "price": "\$20"
    },
    {
      "name": "Jeans",
      "image": "https://via.placeholder.com/150",
      "description": "Classic blue denim jeans.",
      "price": "\$50"
    },
    {
      "name": "Jacket",
      "image": "https://via.placeholder.com/150",
      "description": "A warm winter jacket.",
      "price": "\$80"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('201044'),
      ),
      body: ListView.builder(
        itemCount: clothingItems.length,
        itemBuilder: (context, index) {
          final item = clothingItems[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Image.network(item['image']!),
              title: Text(item['name']!),
              subtitle: Text(item['price']!),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(item: item),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final Map<String, String> item;

  DetailScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item['name']!),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(item['image']!),
            SizedBox(height: 16),
            Text(
              item['name']!,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              item['description']!,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              item['price']!,
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
