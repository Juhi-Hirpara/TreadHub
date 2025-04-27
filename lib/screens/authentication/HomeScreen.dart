import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home-screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Define a list of categories and items for each category
  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.category, 'title': 'Category 1', 'color': Colors.teal},
    {'icon': Icons.category, 'title': 'Category 2', 'color': Colors.blue},
    {'icon': Icons.category, 'title': 'Category 3', 'color': Colors.orange},
    // Add more categories as needed
  ];

  // Define items for each category
  final Map<String, List<Map<String, String>>> itemsByCategory = {
    'Category 1': [
      {'imageUrl': 'https://your-image-url.com/item1.jpg', 'title': 'Item 1', 'price': 'Price: \$100', 'details': 'Details about Item 1'},
      // Add more items
    ],
    'Category 2': [
      {'imageUrl': 'https://your-image-url.com/item2.jpg', 'title': 'Item 2', 'price': 'Price: \$200', 'details': 'Details about Item 2'},
      // Add more items
    ],
    'Category 3': [
      {'imageUrl': 'https://your-image-url.com/item3.jpg', 'title': 'Item 3', 'price': 'Price: \$300', 'details': 'Details about Item 3'},
      // Add more items
    ],
    // Add more categories and their items
  };

  String selectedCategory = 'Category 1'; // Default category

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.network(
              'https://your-image-url.com/background.jpg', // Replace with your background image URL
              fit: BoxFit.cover,
            ),
          ),
          // Main Content
          Column(
            children: [
              // Search Bar
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Colors.teal),
                      hintText: 'Search',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              // Categories
              Container(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return _buildCategoryCard(
                      category['icon'],
                      category['title'],
                      category['color'],
                          () {
                        setState(() {
                          selectedCategory = category['title'];
                        });
                      },
                    );
                  },
                ),
              ),
              // Location Filter
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: DropdownButton<String>(
                        hint: Text('Select State'),
                        items: [
                          DropdownMenuItem(value: 'State 1', child: Text('State 1')),
                          DropdownMenuItem(value: 'State 2', child: Text('State 2')),
                          // Add more states as needed
                        ],
                        onChanged: (value) {
                          // Handle state selection
                        },
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: DropdownButton<String>(
                        hint: Text('Select City'),
                        items: [
                          DropdownMenuItem(value: 'City 1', child: Text('City 1')),
                          DropdownMenuItem(value: 'City 2', child: Text('City 2')),
                          // Add more cities as needed
                        ],
                        onChanged: (value) {
                          // Handle city selection
                        },
                      ),
                    ),
                  ],
                ),
              ),
              // Item Display
              Expanded(
                child: ListView(
                  children: _buildItemCardsForCategory(selectedCategory),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(IconData icon, String title, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.all(8.0),
        color: color,
        child: Container(
          width: 120,
          child: ListTile(
            leading: Icon(icon, color: Colors.white),
            title: Text(title, style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildItemCardsForCategory(String category) {
    final items = itemsByCategory[category] ?? [];
    return items.map((item) => _buildItemCard(
      item['imageUrl']!,
      item['title']!,
      item['price']!,
      item['details']!,
    )).toList();
  }

  Widget _buildItemCard(String imageUrl, String title, String price, String details) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.network(imageUrl, width: 80, height: 80, fit: BoxFit.cover),
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(price, style: TextStyle(color: Colors.green)),
            Text(details),
          ],
        ),
      ),
    );
  }
}
