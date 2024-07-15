import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/provider/favouriteItem%20Provider.dart';

class myFavouriteScreen extends StatefulWidget {
  const myFavouriteScreen({super.key});

  @override
  State<myFavouriteScreen> createState() => _myFavouriteScreenState();
}

class _myFavouriteScreenState extends State<myFavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    print('build');
    final favouriteProvider = Provider.of<FavouriteItemProvider>(context);
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
              itemCount: favouriteProvider.selectedItem.length,
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
