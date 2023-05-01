import 'package:demo_object_boxt/src/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/usuer_entity.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ObjectBox Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Add User'),
              onPressed: () {
                final user = User(name: 'emmanuel Renteria');
                Database.userBox.put(user);
              },
            ),
            SizedBox(height: 16),
            Text('Users:', style: TextStyle(fontSize: 20)),
            SizedBox(height: 16),
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
                    return CircularProgressIndicator();
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
