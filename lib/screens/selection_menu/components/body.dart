import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/tasks.dart';
import 'package:flutter_sound/flutter_sound.dart';

class Body extends StatefulWidget {
  Body({GlobalKey key}) : super(key: key);

  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String btn1Text = "Play";
  bool _mPlayerIsInited = false;
  FlutterSoundPlayer _myPlayer = FlutterSoundPlayer();

  @override
  void initState() {
    super.initState();
    _myPlayer.openAudioSession().then((value) {
      setState(() {
        _mPlayerIsInited = true;
      });
    });
  }

  @override
  void dispose() {
    _myPlayer.closeAudioSession();
    _myPlayer = null;
    super.dispose();
  }

  void afterPlayedSound() {
    setState(() {
      btn1Text = "Stop";
    });
  }

  onButtonPressed() async {
    if (!_mPlayerIsInited) return; // Si no se ha iniciado el reproductor
    if (_myPlayer.isPlaying) {
      // Actualmente se está reproduciendo
      _myPlayer.stopPlayer();
      setState(() {
        btn1Text = "Play";
      });
    } else {
      // Reproducir música
      await _myPlayer.startPlayer(
          fromURI: "https://luan.xyz/files/audio/ambient_c_motion.mp3",
          codec: Codec.mp3);
      initializeTasks();
      setState(() {
        btn1Text = "Stop";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/background_forest.jpg",
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height),
        Center(
          child: RaisedButton(
            onPressed: () => {onButtonPressed()},
            child: Text(btn1Text),
            splashColor: Colors.pink[600],
          ),
        )
      ],
    );
  }
}
