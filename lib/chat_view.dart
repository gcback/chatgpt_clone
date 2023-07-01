import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'chat_providers.dart';
import 'model/model.dart';
import 'speech_sheet.dart';

///
/// chat title bar
const titleWidget = Text('chatME',
    style: TextStyle(color: Colors.black45, fontWeight: FontWeight.bold));

///
/// Response가 완료된 chat 항목 표시
class ChatResponseDone extends StatelessWidget {
  const ChatResponseDone({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      decoration: const BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 32.0, child: Icon(Icons.chat)),
              titleWidget,
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 32.0),
              Expanded(child: Text(content)),
            ],
          ),
        ],
      ),
    );
  }
}

///
/// stream 형태로 수신되는 chat response를 word 단위로 append하여 표시합니다.
/// 종료 word(kChatEndToken)가 수신되면 ChatResponseDone가 처리할 수 있도록 status를 업데이트합니다.
///  - ChatStatus.wating --> ChatStatus.complete
class ChatResponseToConinue extends HookConsumerWidget {
  const ChatResponseToConinue({super.key, required this.query});

  final String query;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatResponseProvider = ref.watch(newChatProvider(query));
    final paragraph = useRef('');

    return Container(
      margin: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          const Row(
            children: [
              SizedBox(width: 32.0, child: Icon(Icons.chat)),
              titleWidget,
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 32.0),
              Expanded(
                child: chatResponseProvider.when(
                  data: (data) {
                    // Response가 끝은 마지막 token을 확인합니다.
                    if (data.contains(kChatEndToken)) {
                      final chat = ref.watch(chatListProvider).first;

                      // build cycle 중 Provider의 상태 업데이트는 허용되지 않습니다.
                      //  따라서 build cycle을 지나 실행될 수 있도록 callback을 등록합니다.
                      Future(
                        () => ref.watch(chatListProvider.notifier).replace(
                              chat.copyWith(
                                status: ChatStatus.complete,
                                response: ChatResponse.withReply(
                                  reply: paragraph.value,
                                  dt: 0.0, // dummy value
                                ),
                              ),
                            ),
                      );
                    } else {
                      paragraph.value = data;
                    }
                    // 수신된 token들을 이어붙이고 마지막에 Unicode 이모티콘(⚫)을 추가합니다.
                    return Text('${paragraph.value}\u{26AB}');
                  },
                  error: (error, stackTrace) => Text(error.toString()),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

///
/// openai로 보낼 chat message를 위한 TextField Widget입니다.
///   타이핑과 음성레코딩 두가지를 지원하니다.
///   - chat in typing
///   - voice record
class ChatEditBar extends HookConsumerWidget {
  const ChatEditBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editController = useTextEditingController(text: 'Message?');
    final focus = useFocusNode();
    final send = useCallback((String query) {
      if (query.isEmpty) return;

      ref.read(chatListProvider.notifier).add(
            Chat(
              request: ChatRequest(
                model: dotenv.env['CHAT_MODEL']!,
                messages: [Message(content: query)],
              ),
            ),
          );

      editController.clear();
      focus.requestFocus();
    }, []);

    return Container(
      margin: const EdgeInsets.all(8.0),
      height: 48,
      child: Row(
        children: [
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28.0),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 2),
                    blurRadius: 4,
                    color: Colors.grey,
                  )
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                        hintText: "Message?",
                        border: InputBorder.none,
                      ),
                      textInputAction: TextInputAction.send,
                      focusNode: focus,
                      controller: editController,
                      onSubmitted: (value) => send(value),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        showModalBottomSheet<String>(
                          context: context,
                          builder: (context) => const RecrdingSheet(),
                        ).then((value) {
                          editController.text = value ?? '';
                        });
                      },
                      icon: const Icon(Icons.graphic_eq)),
                  const SizedBox(width: 8.0),
                ],
              ),
            ),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            alignment: Alignment.centerRight,
            iconSize: 32.0,
            onPressed: () => send(editController.text),
            icon: const Icon(Icons.arrow_circle_up_rounded),
          ),
        ],
      ),
    );
  }
}
