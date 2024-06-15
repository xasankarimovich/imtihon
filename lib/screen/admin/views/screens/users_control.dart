import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imtihon/screen/messages/views/widgets/search_view_delegate.dart';

class UsersControl extends StatefulWidget {
  const UsersControl({super.key});

  @override
  State<UsersControl> createState() => _UsersControlState();
}

class _UsersControlState extends State<UsersControl> {
  List<String> data = [
    "BMW",
    "MERCEDES",
    "MAZDA",
    "PAGANI",
    "LAMBORGINI",
    "LAMBORGINI",
    "PORCHE",
    "BUGATTI",
    "ASTON MARTIN",
    "SKYLINE",
    "TOYOTA",
    "SUBARU",
  ];
  List filteredData = [];
  bool isBlocked = false;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final imageController = TextEditingController();
  final newNameController = TextEditingController();
  final newEmailController = TextEditingController();
  final newImageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          child: Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(44, 160, 187, 244),
                borderRadius: BorderRadius.circular(30)),
            child: ListTile(
              title: const Text("Search User"),
              trailing: SvgPicture.asset("assets/svg_icons/search.svg"),
            ),
          ),
          onTap: () async {
            String? result = await showSearch(
              context: context,
              delegate: SearchViewDelegate(data),
            );
            if (result != null) filteredData.add(result);
            setState(() {});
          },
        ),
      ),
      body: ListView.builder(
          itemCount: 20,
          itemBuilder: (ctx, index) {
            return Dismissible(
              background: Container(
                color: const Color.fromARGB(255, 158, 195, 226),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: [
                        Text("Edit"),
                      ],
                    ),
                  ),
                ),
              ),
              secondaryBackground: Container(
                color: isBlocked
                    ? const Color.fromARGB(255, 158, 195, 226)
                    : const Color.fromARGB(255, 255, 88, 77),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(isBlocked ? "Unblock" : "Block"),
                      ],
                    ),
                  ),
                ),
              ),
              confirmDismiss: (direction) async {
                if (direction == DismissDirection.endToStart) {
                  setState(() {
                    isBlocked = !isBlocked;
                  });
                } else if (direction == DismissDirection.startToEnd) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              controller: nameController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Name',
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextField(
                              controller: emailController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Email',
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextField(
                              controller: imageController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Image url',
                              ),
                            ),
                          ],
                        ),
                        actions: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                child: const Text('Close'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              FilledButton(
                                child: const Text('Save'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  );
                }
                return null;
              },
              key: UniqueKey(),
              child: GestureDetector(
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                        top: BorderSide(color: Colors.grey, width: 0.7),
                        bottom: BorderSide(color: Colors.grey, width: 0.6)),
                  ),
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg",
                      ),
                      radius: 50,
                    ),
                    title: const Text(
                      "Name",
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: const Text("Adress"),
                    trailing: isBlocked
                        ? const Text(
                            "Blocked",
                            style: TextStyle(fontSize: 16, color: Colors.red),
                          )
                        : const Text(
                            "Free",
                            style: TextStyle(fontSize: 16, color: Colors.blue),
                          ),
                  ),
                ),
                onLongPress: () {
                  print("object");
                },
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: newNameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Name',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: newEmailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Email',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: newImageController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Image url',
                      ),
                    ),
                  ],
                ),
                actions: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        child: const Text('Close'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      FilledButton(
                        child: const Text('Save'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
