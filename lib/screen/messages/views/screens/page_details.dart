import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imtihon/utils/extension/extension.dart';

class PageDetails extends StatefulWidget {
  final int id;
  const PageDetails({super.key, required this.id});

  @override
  State<PageDetails> createState() => _PageDetailsState();
}

class _PageDetailsState extends State<PageDetails> {
  final messageController = TextEditingController();
  List messages = [
    [
      "salom",
      "alik",
      "ana",
    ],
    [
      "salom",
      "",
    ],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat Details"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: ListView.builder(
                  itemCount: messages[widget.id].length,
                  itemBuilder: (ctx, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                    offset: Offset(8, 4),
                                    blurRadius: 2,
                                    color: Colors.blue)
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 12),
                            child: Text(
                              messages[widget.id][index],
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        10.boxH(),
                        Text(DateTime.now().dateFormatToString()),
                        30.boxW(),
                      ],
                    );
                  }),
            ),
          ),
          Container(
            decoration: const BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(255, 188, 223, 252), blurRadius: 6)
            ]),
            width: double.infinity,
            height: 80,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: TextField(
                        controller: messageController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (messageController.text != "" &&
                              messageController.text.isNotEmpty) {
                            print("object");
                            messages[widget.id].add(messageController.text);
                          }
                          print(messages[widget.id]);
                          messageController.text = "";
                        });
                      },
                      icon: SvgPicture.asset("assets/svg_icons/send.svg"),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
