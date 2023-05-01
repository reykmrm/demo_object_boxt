import 'package:demo_object_boxt/src/model/personas.dart';
import 'package:demo_object_boxt/src/store.dart';
import 'package:flutter/material.dart';

import 'model/usuer_entity.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ObjectBox Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Add User'),
              onPressed: () {
                final persona = Personas(name: 'Juan Perez', email: 'emmanuel@gmail.com');
                Database.personasBox.put(persona);
              },
            ),
            const SizedBox(height: 16),
            const Text('Users:', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 16),
            Expanded(
              child: FutureBuilder<List<User>>(
                initialData: Database.userBox.getAll(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final users = snapshot.data!;
                    return ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        final user = users[index];
                        return ListTile(
                          title: Text('${user.name}'),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
