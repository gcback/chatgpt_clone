import 'package:chatgpt_clone/data/fetch_openai.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import 'package:record/record.dart';
import 'data/record_hooks.dart';
import 'util/mylib.dart';

class RecrdingSheet extends HookConsumerWidget {
  const RecrdingSheet({super.key});

  static const double maxAmplitude = 100.0;
  static const double sheetHeight = 250.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ampl = useRef<({double max, double cur})>((max: 0.0, cur: 0.0));
    final controller =
        useAudioRecord(duration: const Duration(milliseconds: 100));

    /// BottomSheet가 열리면 바로 음성녹음 시작
    useEffectOnce(() => startRecordAudio(controller.audioRecorder));

    /// amplitude는 최대값이 0.0이며 최소값은 임의로 설정(-40.0)
    ///  따라서 0 ~ -40.0 값을 취하고 이것을 0.0 ~ 1.0 되도록 nomalization 합니다.
    ///  추가적으로 초기값은 20%(0.2) 정도로 적당히 설정합니다.
    ampl.value = controller.amplitude == null
        ? (max: 0.2, cur: 0.2) // 초기값
        : (
            max: 1.0 - max(0.2, controller.amplitude!.max.abs() / maxAmplitude),
            cur: 1.0 -
                max(0.2, controller.amplitude!.current.abs() / maxAmplitude)
          );

    // print('max: ${ampl.value.max}, cur: ${ampl.value.cur}');

    return Container(
      alignment: Alignment.center,
      height: sheetHeight,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.0),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Expanded(
                flex: 2,
                child: AnimatedContainer(
                  duration: 200.msecs,
                  curve: Curves.easeIn,
                  alignment: Alignment.center,
                  child: Container(
                    height: ampl.value.cur * (sheetHeight * 0.5),
                    decoration: BoxDecoration(
                      color: Colors.red.shade300,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: IconButton(
                  icon: const Icon(Icons.stop_circle_outlined, size: 64.0),
                  onPressed: () async {
                    final filepath =
                        await stopRecoding(controller.audioRecorder);

                    debugPrint(filepath);

                    if (filepath != null) {
                      ref
                          .read(apiProvider)
                          .transcriptions(filepath: filepath)
                          .then((result) =>
                              Navigator.pop(context, result['text']));
                    } else {
                      Future(
                        () => ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Recording Failed'),
                          ),
                        ),
                      ).then((value) => Navigator.pop(context));
                    }
                  },
                ),
              ),
              SizedBox(height: MediaQuery.of(context).padding.bottom),
            ],
          ),
        ],
      ),
    );
  }

  startRecordAudio(Record record) async {
    if (await record.isRecording()) return;

    final dtByInt = DateTime.timestamp().millisecondsSinceEpoch;
    final temppath = await getTemporaryDirectory();

    final fullpath = '${temppath.path}/$dtByInt.m4a';

    if (await record.hasPermission()) {
      await record.start(
        path: fullpath,
        encoder: AudioEncoder.aacLc, // by default
        bitRate: 128000, // by default
        samplingRate: 44100, // by default
      );
    }
  }

  Future<String?> stopRecoding(Record record) async {
    String? filepath;

    if (await record.isRecording()) {
      filepath = await record.stop();
    }
    // print(filepath);

    return filepath;
  }
}
