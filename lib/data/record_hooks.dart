import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:record/record.dart';


///
/// Record 패키지를 hooks 환경에서 사용하기 쉽도록 하는 Wrapper
/// 

typedef RecorderController = ({
  Record audioRecorder,
  RecordState? recordState,
  Amplitude? amplitude,
  StreamSubscription<RecordState>? stateSub,
  // StreamSubscription<Amplitude>? amplitudeSub,
  void Function(Duration duration) setAmplitude,
});



RecorderController useAudioRecord({
  Duration? duration,
}) {
  return use(_RecorderController(duration: duration));
}

class _RecorderController extends Hook<RecorderController> {
  const _RecorderController({
    this.duration,
  });

  final Duration? duration;

  @override
  _RecorderControllerState createState() => _RecorderControllerState();
}

class _RecorderControllerState
    extends HookState<RecorderController, _RecorderController> {
  late Record _audioRecorder; // = Record();

  RecordState? _recordState;
  StreamSubscription<RecordState>? _stateSub;

  Amplitude? _amplitude;
  // late Stream<Amplitude> _amplStream;
  StreamSubscription<Amplitude>? _amplitudeSub;

  @override
  void initHook() {
    _audioRecorder = Record();
    _recordState = RecordState.stop;

    _stateSub = _audioRecorder
        .onStateChanged()
        .listen((state) => setState(() => _recordState = state));

    if (hook.duration != null) {
      _amplitudeSub = _audioRecorder
          .onAmplitudeChanged(hook.duration!)
          .listen((amp) => setState(() => _amplitude = amp));
    }

    super.initHook();
  }

  void setAmplitude(Duration duration) {
    _amplitudeSub = _audioRecorder
        .onAmplitudeChanged(duration)
        .listen((amp) => setState(() => _amplitude = amp));
  }

  @override
  RecorderController build(BuildContext context) {
    return (
      audioRecorder: _audioRecorder,
      recordState: _recordState,
      amplitude: _amplitude,
      stateSub: _stateSub,
      // amplitudeSub: _amplitudeSub,
      setAmplitude: setAmplitude,
    );
  }

  @override
  void dispose() {
    _stateSub?.cancel();
    _amplitudeSub?.cancel();
    _audioRecorder.dispose();

    super.dispose();
  }
}

@immutable
class RecorderState {
  const RecorderState();
}
