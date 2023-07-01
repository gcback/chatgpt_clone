# chatgpt_clone

## 플러터로 만든 chatgpt clone 앱입니다.

OpenAI가 제공하는 API에서 Chat에 필요한 필수 기능을 활용합니다.
 - chat completion : 질의 응답. openai 언어모델을 이용합니다.
 - speech-to-text : 음성녹음을 text로 변환하여 chat completion을 수행합니다. 변환은 openai whisper 모델을 이용합니다.

|                                       |
|:-------------------------------------:|
| ![](https://github.com/gcback/chatgpt_clone/assets/10203092/9ba494c7-88d8-472b-9bb2-a471a1b302f4 "Tonejito") | ![](https://github.com/gcback/chatgpt_clone/assets/10203092/f1934625-e1fa-4e4c-8a34-4e114a507d73 "Tonejito") | ![](https://github.com/gcback/chatgpt_clone/assets/10203092/f745060a-c5ff-40b6-9e2a-c8e03f3920d9 "Tonejito") |




# 준비
- API KEY
  - OpenAI api 사용을 위해서는 OpenAI가 제공하는 **유료 KEY**를 받으셔야 합니다. 

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
