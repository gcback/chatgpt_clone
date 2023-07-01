import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/model.dart';

class FetchUtil {
  const FetchUtil({
    required this.apiKey,
    required this.organization,
  });

  final String apiKey;
  final String organization;

  ///
  /// Creates a model response for the given chat conversation
  Stream<String?> chatCompletion({
    required List<Message> messages,
  }) async* {
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $apiKey',
      'OpenAI-Organization': organization,
    };
    final client = http.Client();
    final request =
        http.Request('POST', Uri.parse(dotenv.env['CHAT_ENDPOINT']!));

    request.headers.addAll(headers);
    request.body = jsonEncode({
      "model": dotenv.env['CHAT_MODEL']!,
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

  ///
  /// Transcribes audio into the input language.
  Future<Map<String, dynamic>> transcriptions({
    // required String uri,
    required String filepath,
  }) async {
    final Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
      // 'Accept': 'application/json',
      'Authorization': 'Bearer $apiKey',
      'OpenAI-Organization': organization,
    };

    ///
    /// File 전송은 http.MultipartFile.fromPath를 이용합니다.
    final request =
        http.MultipartRequest('POST', Uri.parse(dotenv.env['AUDIO_ENDPOINT']!));
    request.headers.addAll(headers);
    request.fields['model'] = dotenv.env['AUDIO_MODEL']!;
    request.files.add(
      await http.MultipartFile.fromPath('file', filepath),
    );

    final streamedResponse = await request.send();
    if (streamedResponse.statusCode == 200) {
      var response = await http.Response.fromStream(streamedResponse);
      var responseBody = utf8.decode(response.bodyBytes);

      Map<String, dynamic> resultJson = jsonDecode(responseBody);
      final resultCode = {'result': 200};
      resultJson.addEntries(resultCode.entries);

      return resultJson;
    }

    return {
      'result': streamedResponse.statusCode,
      'cause': streamedResponse.reasonPhrase,
    };
  }
}

final apiProvider = Provider<FetchUtil>(
  (ref) => FetchUtil(
    apiKey: dotenv.env['API_KEY']!,
    organization: dotenv.env['ORGANIZATION']!,
  ),
);
