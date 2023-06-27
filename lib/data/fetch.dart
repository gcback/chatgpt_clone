import 'dart:async';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/model.dart';

class FetchUtil {
  final String uri;
  final String apiKey;
  final String organization;
  static const Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  FetchUtil({
    required this.uri,
    required this.apiKey,
    required this.organization,
  });

  Future<List<ChatResponse>> fetch({
    required String model,
    required List<Message> messages,
  }) async {
    final encodedBody = jsonEncode({
      "model": model,
      "messages": messages,
    });

    final Map<String, String> headers = {
      ...defaultHeaders,
      "Authorization": "Bearer $apiKey",
      "OpenAI-Organization": organization,
    };

    try {
      final resp = await http.post(
        Uri.parse(uri),
        headers: headers,
        body: encodedBody,
      );

      if (resp.statusCode == 200) {
        final body = json.decode(resp.body); // as List<Map<String, dynamic>>;
        print(body.toString());

        final chatResult = ChatResponse.fromJson(body);

        return [chatResult];
        // return body.map((dynamic e) => ChatResponse.fromJson(e)).toList();
      }
    } catch (err) {
      print(err);
      return [];
    }
    return [];
  }
}

final fetcheProvider = Provider<FetchUtil>((ref) {
  return FetchUtil(
    uri: dotenv.env['CHAT_ENDPOINT']!,
    apiKey: dotenv.env['API_KEY']!,
    organization: dotenv.env['ORGANIZATION']!,
  );
});

class ResponseNotifier extends AsyncNotifier<List<ChatResponse>> {
  @override
  Future<List<ChatResponse>> build() {
    return Future.value([]);
  }

  Future<void> sendPrompt({required List<Message> prompts}) async {
    final fetcher = ref.watch(fetcheProvider);

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final result =
          await fetcher.fetch(model: dotenv.env['MODEL']!, messages: prompts);

      return [result.first, ...?state.value];
    });
  }
}

final chatProvider =
    AsyncNotifierProvider<ResponseNotifier, List<ChatResponse>>(() {
  return ResponseNotifier();
});
