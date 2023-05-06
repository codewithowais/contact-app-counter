import 'package:b2class/utils/data-constants.dart';
import 'package:flutter/material.dart';

class Contacts extends StatefulWidget {
  const Contacts({super.key});

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();

  addNewContact(context) {
    setState(() {
      Navigator.pop(context);
      DataConstants.contacts.add({
        "name": name.text,
        "userName": "codewithowais",
        "number": number.text,
      });
      name.clear();
    });
    print(DataConstants.contacts);
  }

  editContact(context, index) {
    setState(() {
      Navigator.pop(context);
      DataConstants.contacts[index] = {
        "name": name.text,
        "userName": "codewithowais",
        "number": number.text,
      };
      name.clear();
    });
    print(DataConstants.contacts);
  }

  deletUser(i) {
    setState(() {
      DataConstants.contacts.removeAt(i);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: DataConstants.contacts.length,
        itemBuilder: (context, i) {
          return ListTile(
              title: Text("${DataConstants.contacts[i]['name']}"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      name.text = DataConstants.contacts[i]['name'];
                      showDialog(
                        // barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("My title"),
                            content: Container(
                              height: 130,
                              child: Column(
                                children: [
                                  TextField(
                                    controller: name,
                                    obscureText: false,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Contact Name',
                                    ),
                                  ),
                                  TextField(
                                    controller: number,
                                    obscureText: false,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Contact Name',
                                    ),
                                  )
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                child: const Text("OK"),
                                onPressed: () {
                                  editContact(context, i);
                                },
                              )
                            ],
                          );
                        },
                      );
                    },
                    icon: const Icon(Icons.edit),
                  ),
                  IconButton(
                    onPressed: () {
                      deletUser(i);
                    },
                    icon: const Icon(Icons.delete),
                  ),
                ],
              ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            // barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("My title"),
                content: Container(
                  height: 130,
                  child: Column(
                    children: [
                      TextField(
                        controller: name,
                        obscureText: false,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Contact Name',
                        ),
                      ),
                      TextField(
                        controller: number,
                        obscureText: false,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Contact Name',
                        ),
                      )
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    child: const Text("OK"),
                    onPressed: () {
                      addNewContact(context);
                    },
                  )
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
