import 'package:eyic/api/models/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eyic/api/services/firebase/chats_database.dart';

import 'widgets/chat_details.dart';

final _messagesCtr = Get.put(ChatsDBCtr());

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Mentor"),
          ),
          body: FutureBuilder(
            future: _messagesCtr.getChats(),
            builder: (context, AsyncSnapshot<List<ChatModel>> snapshot) {
              if (snapshot.hasError) {
                debugPrint(snapshot.error.toString());
              }
              if (snapshot.hasData) {
                if (snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text(
                      "No chats",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: ClipOval(
                        child: Image.network(
                          "https://avatars.dicebear.com/api/initials/:${snapshot.data![index].mentorname}.png",
                          height: 36,
                          width: 36,
                          fit: BoxFit.cover,
                        ),
                      ),
                      onTap: () {
                        Get.to(ChatDetails(chat: snapshot.data![index]));
                      },
                      title: Text(snapshot.data![index].mentorname),
                    );
                  },
                  itemCount: snapshot.data!.length,
                );
              }
              return Container();
            },
          ),
        );
      },
    );
  }
}
