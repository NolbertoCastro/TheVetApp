import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_vet_app/src/routes/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Vet App', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Navigator.pushNamed(context, Routes.userProfile),
            iconSize: 27.0,
            color: Colors.white,
          )
        ],
        backgroundColor: Colors.cyan,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('animals')
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.data?.docs.isEmpty ?? true) {
            return const Center(child: Text('No animals found'));
          }
          return Padding(
            padding: const EdgeInsets.all(8),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                // Aumenta la proporción para más espacio vertical
                childAspectRatio: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: snapshot.data?.size ?? 0,
              itemBuilder: (context, index) {
                var data = snapshot.data!.docs[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceAround, // Cambiado a spaceAround para una distribución más uniforme
                      children: [
                        Flexible(
                          child: Image.network(
                            'https://firebasestorage.googleapis.com/v0/b/the-vet-app-fa9d6.appspot.com/o/perro.png?alt=media&token=25ffdcb8-c6e7-4df8-8673-5214040a27b9', // Reemplaza con la URL de la imagen correspondiente
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          data['name'],
                          style: const TextStyle(
                            fontSize: 16, // Ajusta el tamaño como necesites
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("Age: ${data['age']} Weight: ${data['weight']}"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                Navigator.pushNamed(context, Routes.editPet,
                                    arguments: {
                                      'name': data['name'],
                                      'age': data['age'],
                                      'weight': data['weight'],
                                      'id': data.id,
                                    });
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(FirebaseAuth.instance.currentUser!.uid)
                                    .collection('animals')
                                    .doc(data.id)
                                    .delete();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerFloat, // To position the card
      floatingActionButton: Card(
        color: Colors.cyan, // Set the background color of the Card
        margin: const EdgeInsets.all(20.0), // Provide some margin
        child: InkWell(
          onTap: () => Navigator.pushNamed(
              context, Routes.addPet), // The same action as the button
          child: Padding(
            padding: const EdgeInsets.all(16.0), // Padding inside the card
            child: Row(
              mainAxisSize: MainAxisSize.min, // To wrap content inside the card
              children: [
                Icon(Icons.add,
                    color: Colors.white), // Set the icon color to white
                SizedBox(width: 8.0), // Spacing between icon and text
                Text(
                  'Add Pet',
                  style: TextStyle(
                    color: Colors.white, // Text color set to white
                    fontWeight: FontWeight.bold, // Text is bold
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
