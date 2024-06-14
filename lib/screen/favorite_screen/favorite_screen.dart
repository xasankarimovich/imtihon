import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  bool isListView = true;
  List<String> sortingOptions = [
    "Lowest Speed",
    "Highest Speed",
    "Lowest Price",
    "Highest Price"
  ];
  String selectedSortOption = "Lowest Speed";

  void _toggleView() {
    setState(() {
      isListView = !isListView;
    });
  }

  void _sortBy(String option) {
    setState(() {
      selectedSortOption = option;
      // Add your sorting logic here
    });
  }

  void _showSortOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          children: sortingOptions.map((option) {
            return ListTile(
              title: Text(option),
              onTap: () {
                _sortBy(option);
                Navigator.pop(context);
              },
            );
          }).toList(),
        );
      },
    );
  }

  void _showMoreOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Edit'),
              onTap: () {
                // Edit action
              },
            ),
            ListTile(
              leading: const Icon(Icons.share),
              title: const Text('Share'),
              onTap: () {
                // Share action
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
        actions: [
          IconButton(
            icon: const Icon(Icons.sort),
            onPressed: () {
              _showSortOptions(context);
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              _showMoreOptions(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: isListView ? _buildListView() : _buildGridView(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleView,
        child: Icon(isListView ? Icons.grid_view : Icons.list),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 2,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          // Handle navigation
        },
      ),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      itemCount: 10, // Replace with your item count
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: Image.network(
                'https://via.placeholder.com/150'), // Replace with your item image
            title: Text('Item $index'), // Replace with your item title
            subtitle: Text(
                'Price: \$${index * 1000}'), // Replace with your item price
            trailing: IconButton(
              icon: const Icon(
                  Icons.favorite_border), // Replace with favorite logic
              onPressed: () {},
            ),
          ),
        );
      },
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: 10, // Replace with your item count
      itemBuilder: (context, index) {
        return Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                  'https://via.placeholder.com/150'), // Replace with your item image
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Item $index'), // Replace with your item title
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                    'Price: \$${index * 1000}'), // Replace with your item price
              ),
              IconButton(
                icon: const Icon(
                    Icons.favorite_border), // Replace with favorite logic
                onPressed: () {},
              ),
            ],
          ),
        );
      },
    );
  }
}
