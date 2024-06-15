import 'package:imtihon/screen/messages/models/chat.dart';

class ChatsController {
  final List<Chat> _list = [
    Chat(
      name: "Tursunali",
      lastText: "qani",
      profileImage:
          "https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg",
      message: "salom",
      time: "12:2",
    )
  ];
  List<Chat> get list {
    return [..._list];
  }
}
