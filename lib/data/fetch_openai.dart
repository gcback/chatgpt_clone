import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/model.dart';

class FetchUtil {
  const FetchUtil({
    required this.uri,
    required this.apiKey,
    required this.organization,
  });

  final String uri;
  final String apiKey;
  final String organization;

  Stream<String?> fetch({
    required String model,
    required List<Message> messages,
  }) async* {
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $apiKey',
      'OpenAI-Organization': organization,
    };
    final client = http.Client();
    final request = http.Request('POST', Uri.parse(uri));

    request.headers.addAll(headers);
    request.body = jsonEncode({
      "model": model,
      "stream": true, // <----- stream mode for chat completion mode
      "messages": messages,
    });

    final response = await client.send(request);

    ///
    /// HTTP Response는 Stream이며 SSE 포맷이기 때문에 별도 Parsing이 필요
    /// Parsing 결과는 String이며 Model 데이터로 변환한다.(json to ChatResponse)
    String? id, event, data;
    await for (final line in response.stream
        .transform(utf8.decoder)
        .transform(const LineSplitter())) {
      if (line.isEmpty) {
        if (data == '[DONE]') {
          yield null;
        } else {
          final json = jsonDecode(data!);
          final chunk = ChatResponse.fromJson(json);

          final result = chunk.choices.first.delta == null
              ? ''
              : chunk.choices.first.delta!.content == null
                  ? ''
                  : chunk.choices.first.delta!.content!;

          yield result;
        }

        id = event = data = null;
      } else if (line.startsWith('id:')) {
        id = line.substring(3).trim();
      } else if (line.startsWith('event:')) {
        event = line.substring(6).trim();
      } else if (line.startsWith('data:')) {
        final chunk = line.substring(5).trimLeft();
        data = data != null ? '$data\n$chunk' : chunk;
      }
    }

    client.close();
  }
}

final fetchProvider = Provider<FetchUtil>(
  (ref) => FetchUtil(
    uri: dotenv.env['CHAT_ENDPOINT']!,
    apiKey: dotenv.env['API_KEY']!,
    organization: dotenv.env['ORGANIZATION']!,
  ),
);
