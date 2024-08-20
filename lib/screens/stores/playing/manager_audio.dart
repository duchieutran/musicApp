import 'package:just_audio/just_audio.dart';
import 'package:mobx/mobx.dart';
import 'package:music/screens/stores/playing/duration_state.dart';
part 'manager_audio.g.dart';

class ManageAudio = ManageAudioBase with _$ManageAudio;

abstract class ManageAudioBase with Store {
  final player = AudioPlayer();
  ManageAudioBase({required this.songUrl});

  final String songUrl;

  @observable
  DurationState durationState = DurationState(
    progress: Duration.zero,
    buffered: Duration.zero,
    total: Duration.zero,
  );

  @action
  Future<void> init() async {
    await player.setUrl(songUrl);
    player.positionStream.listen((position) {
      durationState = DurationState(
          progress: position,
          total: player.duration ?? Duration.zero,
          buffered: player.bufferedPosition);
    });
  }

  @action
  void play() => player.play();

  @action
  void pause() => player.pause();

  @action
  void seek(Duration position) => player.seek(position);

  void dispose() {
    player.dispose();
  }
}
