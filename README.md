# chatgpt_clone

## 플러터로 만든 chatgpt clone 앱입니다.

OpenAI가 제공하는 API에서 Chat에 필요한 필수 기능을 활용합니다.
 - chat completion : 질의 응답. openai 언어모델을 이용합니다.
 - speech-to-text : 음성녹음을 text로 변환하여 chat completion을 수행합니다. 변환은 openai whisper 모델을 이용합니다.

![b](https://github.com/gcback/chatgpt_clone/assets/10203092/300ea7b0-340b-4cde-9adf-5f294a35b557)
![c](https://github.com/gcback/chatgpt_clone/assets/10203092/86176ae2-fb78-4554-a755-cf82f4ddf171)

# 준비
- API KEY
  - OpenAI api 사용을 위해서는 OpenAI가 제공하는 **유료 KEY**를 받으셔야 합니다. 
  - openai.com 본인 계정에서 확인하실 수 있습니다.
    - https://platform.openai.com/account/api-keys

- Record 패키지를 이용하기 위해 [플랫폼별 설정](https://pub.dev/packages/record#platforms)이 필요합니다.

- Environments 파일
  - key를 비롯해 API에 필요한 설정 정보는 아래 화일에 기록합니다.
    - assets/config/.env

# 주요 플러터 패키지 활용
  - 음성녹음 : Record 패키지. 이용의 편의를 위해 custom hook으로 wrapping 하였습니다.
  - 상태관리 : riverpod, flutter_hooks

# 설치 및 실행
  - git https://github.com/gcback/chatgpt_clone.git
  - cd chatgpt_clone
  - flutter pub get
  - flutter pub run build_runner watch
  - flutter run



* * *
A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
