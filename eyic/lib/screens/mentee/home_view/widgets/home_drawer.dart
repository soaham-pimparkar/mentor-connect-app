import 'package:eyic/api/services/firebase/authentication.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../auth_view/signin_view.dart';
import '../../chat_view/chat_view.dart';

final _authCtr = Get.put(Authentication());

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: GestureDetector(
              onTap: () => Get.toNamed("profile"),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.account_circle,
                      size: 68,
                    ),
                    SizedBox(height: 14),
                    Text("My profile"),
                  ],
                ),
              ),
            ),
          ),
          StreamBuilder(
            stream: _authCtr.userChanges,
            builder: (context, AsyncSnapshot<User?> snapshot) {
              if (snapshot.data == null) {
                return ListTile(
                  onTap: () => Get.to(() => const SignInView()),
                  title: const Text("Login"),
                  trailing: const Icon(Icons.login),
                );
              }
              return Container();
            },
          ),
          ListTile(
            onTap: () => Get.to(() => const ChatView()),
            title: const Text("Chats"),
            trailing: const Icon(Icons.chat),
          ),
          ListTile(
            onTap: () => Get.toNamed('perks_view'),
            title: const Text("MentorSpace Perks"),
            trailing: const Icon(Icons.card_giftcard),
          ),
          ListTile(
            onTap: () => Get.toNamed('connection_page'),
            title: const Text("Connections"),
            trailing: const Icon(Icons.handshake),
          ),
          ListTile(
            onTap: () => Get.toNamed('connection_page'),
            title: const Text("MarketPlace"),
            trailing: const Icon(Icons.shop),
          ),
          ListTile(
            onTap: () => Get.toNamed('contact_us'),
            title: const Text("Contact us"),
            trailing: const Icon(Icons.contact_support_sharp),
          ),
          StreamBuilder(
            stream: _authCtr.userChanges,
            builder: (context, AsyncSnapshot<User?> snapshot) {
              if (snapshot.data != null) {
                return ListTile(
                  onTap: () => _authCtr.signOut(),
                  title: const Text("Logout"),
                  trailing: const Icon(Icons.logout),
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
