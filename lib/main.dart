import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'chat_providers.dart';
import 'chat_view.dart';
import 'model/model.dart';

void main() async {
  ///
  /// assets/config/.env 에 자신의 openai API 이용 정보를 입력하세요.
  ///
  /// ------
  /// CHAT_ENDPOINT="https://api.openai.com/v1/chat/completions"
  /// MODEL= "gpt-3.5-turbo"
  /// ORGANIZATION="org-xxxx"
  /// API_KEY="sk-xxxx"
  /// ------
  await dotenv.load(fileName: "assets/config/.env");

  runApp(const ProviderScope(child: MyApp()));
}

final envProvider = StateProvider((ref) => {});

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatList = ref.watch(chatListProvider);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 0, left: 8, right: 8),
              reverse: true,
              itemCount: chatList.length,
              itemBuilder: (context, index) {
                final chat = chatList[index];

                if (index == 0 && chat.status == ChatStatus.waiting) {
                  return ChatResponseToConinue(query: chat.query);
                }

                assert(chat.response != null);
                return ChatResponseDone(content: chat.reply!);
              },
            ),
          ),
          const ChatEditBar(),
          SizedBox(height: MediaQuery.of(context).padding.bottom)
        ],
      ),
    );
  }
}
