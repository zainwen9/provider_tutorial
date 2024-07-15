import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/provider/favouriteItem%20Provider.dart';
import 'package:provider_app/screens/favourite/myFavouriteScreen.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});
  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<int> selectedItems = [];
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          'Favourite App',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => myFavouriteScreen(),
                  ),
                );
              },
              child: const Icon(Icons.favorite)),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return Consumer<FavouriteItemProvider>(
                    builder: (context, value, child) {
                  return ListTile(
                    onTap: () {
                      if (value.selectedItem.contains(index)) {
                        value.removeItem(index);
                      } else {
                        value.addItem(index);
                      }
                    },
                    title: Text(
                      'Item' + index.toString(),
                    ),
                    trailing: value.selectedItem.contains(index)
                        ? const Icon(Icons.favorite)
                        : const Icon(Icons.favorite_outline),
                  );
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
