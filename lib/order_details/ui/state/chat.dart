import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record_mp3/record_mp3.dart';
import 'package:voice_message_package/voice_message_package.dart';
import '../../../utils/Colors/colors.dart';
import '../../request/sens-message-request.dart';
import '../../response/order_response.dart';
import '../screens/order_details_screen.dart';

class ChatScreen extends StatefulWidget {
  final OrderDetailsResponse orderDetailsResponse;
  final OrderDetailsScreenState screenState;
  List<Messages>? chatMessage;

  ChatScreen(
      {required this.orderDetailsResponse,
      required this.screenState,
      this.chatMessage});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>
    with AutomaticKeepAliveClientMixin<ChatScreen> {
  final _textController = TextEditingController();
  final StreamController<List<Messages>> _chatMessageStreamController =
      StreamController<List<Messages>>.broadcast();
  final _focusNode = FocusNode();

  @override
  bool get wantKeepAlive => true;

  int? chat = 1;
  int? voice = 2;
  AudioPlayer audioPlayer = AudioPlayer();
  bool playing = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  String path = "";
  bool paused = false;
  bool isRecording = false;
  String audioUrl = "";
  bool isSending = false; // Set this to true when sending the audio file

  int count = 0;

  @override
  void dispose() {
    // Stop any playing audio before disposing of the AudioPlayer instance
    audioPlayer.stop();
    audioPlayer.dispose();
    _chatMessageStreamController.close();
    _focusNode.dispose();

    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    audioPlayer.onDurationChanged.listen((Duration dur) {
      setState(() {
        duration = dur;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((Duration pos) {
      setState(() {
        position = pos;
      });
    });
  }

  // Future<String> getFilePath() async {
  //   count++;
  //   Directory storageDirectory = await getTemporaryDirectory();
  //   String sdPath = storageDirectory.path + "/record/";
  //   var d = Directory(sdPath);
  //   if (!d.existsSync()) {
  //     d.createSync(recursive: true);
  //   }
  //   return sdPath + "audio_${count}.mp3";
  // }

  AudioPlayer audioPlayerr = AudioPlayer();
  bool playingg = false;
  Duration durationn = Duration.zero;
  Duration positionn = Duration.zero;

  void _playAudio(String path) async {
    await audioPlayer.play(path);
  }

  void _stopAudio() async {
    await audioPlayer.stop();
  }

  Future<String> getFilePath() async {
    int count = 0;
    Directory? storageDirectory;
    if (Platform.isAndroid) {
      storageDirectory = await getExternalStorageDirectory();
    } else if (Platform.isIOS) {
      storageDirectory = await getApplicationSupportDirectory();
    } else {
      print("unununun");
      throw Exception("Unsupported platform");
    }
    String sdPath = storageDirectory!.path + "/record/";
    var d = Directory(sdPath);
    if (!d.existsSync()) {
      d.createSync(recursive: true);
    }
    print("Path: $path");

    count = d.listSync().length;
    return sdPath + "audio_${count}.mp3";
  }

  Future uploadAudioFile(String path) async {
    final file = File(path);
    final audioBytes = await file.readAsBytes();

    widget.screenState.sendMessage(SendMessageRequest(
      audiofile: MultipartFile.fromBytes(audioBytes, filename: 'audio.mp3'),
      Message: '',
      IsFromAdmin: false,
      MessageTypeId: voice,
      OrderId: widget.orderDetailsResponse.id,
    ));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: GroupedListView<Messages, DateTime>(
            padding: const EdgeInsets.all(8),
            reverse: true,
            order: GroupedListOrder.DESC,
            elements: widget.chatMessage ?? [],
            groupBy: (message) => DateTime(
              message.createdDate.year,
              message.createdDate.month,
              message.createdDate.day,
            ),
            groupHeaderBuilder: (Messages message) => SizedBox(
              height: 40,
              child: Center(
                child: Card(
                  color: Theme.of(context).primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      DateFormat.yMMMd().format(message.createdDate),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            itemBuilder: (context, Messages message) => Align(
              alignment: message.isFromUser
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Card(
                elevation: 0,
                // color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: message.messageTypeId == 1
                      ? Text(message.message ?? "")
                      : Container(
                          width: 300,
                          child: Stack(
                            children: [
                              VoiceMessage(
                                      contactPlayIconColor: Colors.black,
                                      contactFgColor: Colors.red,
                                      noiseCount: 20,
                                      audioSrc: message.message ?? "",
                                      played: true,
                                      me: false,
                                      onPlay: () {
                                        // Do something when voice played
                                      },
                                    ),

                              if (isSending) // Show the loading indicator if sending
                                Positioned.fill(
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                            ],
                          )),
                ),
              ),
            ),
          )),
          Container(
            color: Colors.transparent,
            child: Row(
              children: [
                Expanded(
                  child: isRecording
                      ? Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text(
                            "Recording...",
                            style: TextStyle(color: redColor),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(bottom: 0),
                          child: TextField(
                            focusNode: _focusNode,
                            controller: _textController,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(20),
                              hintText: 'Type your message here...',
                              border: InputBorder.none,
                              // prefixIcon: Icon(Icons.send)
                            ),
                            onChanged: (text) {
                              setState(() {});
                            },
                            onSubmitted: (text) {
                              widget.screenState.sendMessage(SendMessageRequest(
                                OrderId: widget.orderDetailsResponse.id,
                                MessageTypeId: chat,
                                Message: _textController.text,
                                IsFromAdmin: false,
                              ));
                              final message = Messages(
                                  isFromUser: true,
                                  createdDate: DateTime.now(),
                                  message: _textController.text,
                                  messageTypeId: 1);
                              setState(() {
                                widget.chatMessage!.add(message);
                                // widget.chatMessage!.insert(0, message); // add at the beginning of the list

                                _textController.clear();
                              });
                            },
                          ),
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: _textController.text.isEmpty
                      ? GestureDetector(
                          child: Container(
                            width: 50,
                            height: 50,
                            child: Card(
                              color: redColor,
                              shape: const CircleBorder(),
                              child: Icon(
                                Icons.mic,
                                color:
                                    !isRecording ? Colors.white : Colors.yellow,
                              ),
                            ),
                          ),
                          onLongPress: () async {
                            AudioPlayer.players.forEach((key, value) {
                              value.stop();
                            });

                            setState(() {
                              isRecording = true;
                            });
                            path = await getFilePath();
                            // final status = await Permission.microphone.request();
                            SystemChannels.textInput
                                .invokeMethod('TextInput.show');

                            if (await Permission.microphone.isGranted) {
                              RecordMp3.instance.start(path, (type) {
                                return setState(() {});
                              });
                            } else {
                              await Permission.microphone.request();
                            }

                            // record.startRecord(path);
                          },
                          onLongPressEnd: (val) async {
                            print("isSending : $isSending:");
                            final message = Messages(
                                isFromUser: true,
                                createdDate: DateTime.now(),
                                message: path,
                                messageTypeId: 2);
                            setState(() {
                              widget.chatMessage!.add(message);
                              isRecording = false;
                              print("Path:${path}");
                            });
                            RecordMp3.instance.stop();
                            await uploadAudioFile(path);
                            // isSending = false;
                            print("path stop : $path:");
                          },
                          onTap: () {},
                        )
                      : IconButton(
                          onPressed: () {
                            widget.screenState.sendMessage(SendMessageRequest(
                              OrderId: widget.orderDetailsResponse.id,
                              MessageTypeId: chat,
                              Message: _textController.text,
                              IsFromAdmin: false,
                            ));
                            final message = Messages(
                                isFromUser: true,
                                createdDate: DateTime.now(),
                                message: _textController.text,
                                messageTypeId: 1);
                            setState(() {
                              widget.chatMessage!.add(message);
                              _textController.clear();
                            });
                          },
                          icon: Icon(Icons.send),
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
