import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'data/fetch_openai.dart';
import 'model/model.dart';

class ChatListProvider extends Notifier<ChatList> {
  @override
  ChatList build() => [];

  void add(Chat chat) {
    assert(chat.status == ChatStatus.waiting);

    state = [chat, ...state];
  }

  /// Response 수신이 완료되면 상태를 업데이트 합니다.
  void replace(Chat chat) {
    assert(chat.status == ChatStatus.complete);

    state = [chat, for (final el in state.skip(1)) el];
  }
}

final chatListProvider =
    NotifierProvider<ChatListProvider, ChatList>(ChatListProvider.new);

final newChatProvider =
    StreamProvider.family.autoDispose<String, String>((ref, query) async* {
  final api = ref.watch(apiProvider);

  final Stream<String?> wordsStream = api.chatCompletion(
    messages: [Message(content: query)],
  );

  var content = "";
  await for (final word in wordsStream) {
    if (word == null) {
      yield kChatEndToken;
    } else {
      content += word;
      yield content;
    }
  }
});
