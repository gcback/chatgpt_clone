import 'package:chatgpt_clone/data/fetch.dart';
import 'package:chatgpt_clone/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  await dotenv.load(fileName: "assets/config/.env");

  //...runapp
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
      ),
      home: Builder(builder: (context) {
        return Scaffold(
          body: Center(
            child: OutlinedButton(
              child: const Text('Start'),
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const HomePage())),
            ),
          ),
        );
      }),
    );
  }
}

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  static String title = 'Home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editController = useTextEditingController(text: 'hello!');
    final focus = useFocusNode();
    final send = useCallback(() {
      if (editController.text.isEmpty) return;

      final message = Message(content: editController.text);

      ref.watch(chatProvider.notifier).sendPrompt(
        prompts: [message],
      );

      editController.clear();
      focus.requestFocus();
    }, []);

    final chat = ref.watch(chatProvider);

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: Center(
                child: chat.when(
                  data: (data) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ListView.builder(
                        reverse: true,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return UnconstrainedBox(
                            alignment: Alignment.topRight,
                            child: ChatBubble(
                              message:
                                  data[index].choices.first.message.content,
                            ),
                          );
                        },
                      ),
                    );
                  },
                  error: (error, stackTrace) => Text(error.toString()),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
            const Expanded(
              flex: 1,
              child: ChatBar(),
              // Row(
              //   children: [
              //     Expanded(
              //       child:
              //       TextField(
              //         decoration: textFieldInputDecoration('enter'),
              //         //textFieldInputDecoration,
              //         textInputAction: TextInputAction.send,
              //         focusNode: focus,
              //         controller: editController,
              //         onSubmitted: (value) => send(),
              //       ),
              //     ),
              //     const VerticalDivider(width: 8.0),
              //     IconButton(onPressed: send, icon: const Icon(Icons.upload)),
              //   ],
              // ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration textFieldInputDecoration(String hintText) {
    return InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white54),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white)));
  }
}

class ChatBubble extends HookWidget {
  const ChatBubble({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.7;

    return Container(
      width: width,
      padding: const EdgeInsets.all(8.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.blue.withAlpha(200),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Text(message),
    );
  }
}

class ChatBar extends HookConsumerWidget {
  const ChatBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      height: 60,
      child: Row(
        children: [
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28.0),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 2), blurRadius: 7, color: Colors.grey)
                ],
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 12.0),
                          hintText: "Message",
                          border: InputBorder.none),
                    ),
                  ),
                  IconButton(
                    onPressed: () => (),
                    icon: const Icon(Icons.graphic_eq),
                  ),
                  const SizedBox(width: 8.0),
                ],
              ),
            ),
          ),
          // const SizedBox(width: 8.0),
          IconButton(
            padding: EdgeInsets.zero,
            alignment: Alignment.centerRight,
            iconSize: 32.0,
            onPressed: () => (),
            icon: const Icon(Icons.arrow_circle_up_rounded),
          ),
        ],
      ),
    );
  }
}
