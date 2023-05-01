import 'dart:async';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record_mp3/record_mp3.dart';
import 'package:voice_message_package/voice_message_package.dart';
import '../../../abstracts/model/WebServiceResponse.dart';
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

class _ChatScreenState extends State<ChatScreen> {
  final _textController = TextEditingController();
  final StreamController<List<Messages>> _chatMessageStreamController =
      StreamController<List<Messages>>.broadcast();

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  String _message = '';
  final List<String> bannedWords = [
    "🖕",
  ]; // list of banned words

  bool containsBannedWord(String text) {
    for (String word in bannedWords) {
      if (text.toLowerCase().contains(word)) {
        return true;
      }
    }
    return false;
  }

  bool _showSendIcon = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final status = await Permission.microphone.status;
      if (!status.isGranted) {
        await Permission.microphone.request();
      }
    });
    // Initialize Firebase Messaging
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Handle the received message here
      String msg = message.notification?.body ?? '';
      setState(() {
        _message = msg;
        final messages = Messages(
            isFromUser: false,
            createdDate: DateTime.now(),
            message: _message,
            messageTypeId: 1
        );
        widget.chatMessage!.add(messages);
        _textController.clear();
      });
    });

    _textController.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    setState(() {
      _showSendIcon = _textController.text.isNotEmpty;
    });
  }

  final FocusNode _focusNode = FocusNode();

  int? chat = 1;
  int? voice = 2;
  AudioPlayer audioPlayer = AudioPlayer();
  String path = "";
  bool isRecording = false;
  bool isSending = false;

  @override
  void dispose() {
    // Stop any playing audio before disposing of the AudioPlayer instance
    audioPlayer.stop();
    audioPlayer.dispose();
    _chatMessageStreamController.close();
    super.dispose();
  }

  Future<String> getFilePath() async {
    int count = 0;
    Directory? storageDirectory;
    if (Platform.isAndroid) {
      storageDirectory = await getExternalStorageDirectory();
    } else if (Platform.isIOS) {
      storageDirectory = await getApplicationSupportDirectory();
    } else {
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

  Future<WebServiceResponse?> uploadAudioFile(String path) async {
    final file = File(path);
    final audioBytes = await file.readAsBytes();

    WebServiceResponse? response = await widget.screenState.sendMessage(
      SendMessageRequest(
        audiofile: MultipartFile.fromBytes(audioBytes, filename: 'audio.mp3'),
        Message: '',
        IsFromAdmin: false,
        MessageTypeId: voice,
        OrderId: widget.orderDetailsResponse.id,
      ),
    );

    if (response != null) {
      final messageResponse = Messages.fromJson(response.data.insideData);
      setState(() {
        isRecording = false;
        print("Path: $path");
        // widget.chatMessage = widget
        //     .chatMessage!.reversed
        //     .toList();
        widget.chatMessage!.add(
            messageResponse); // Append the new message to the end of the list
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
                  child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: message.messageTypeId == 1
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "${message.message}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      DateFormat('hh:mm a')
                                          .format(message.createdDate),
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    VoiceMessage(
                                      contactPlayIconColor: Colors.black,
                                      contactFgColor: Colors.red,
                                      audioSrc: message.message ?? "",
                                      played: true,
                                      me: false,
                                      onPlay: () {
                                        // Do something when voice played
                                      },
                                    ),
                                  ],
                                ),
                                Text(
                                  DateFormat('hh:mm a')
                                      .format(message.createdDate),
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            )),
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
                            padding:
                                const EdgeInsets.only(left: 10, bottom: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: <Widget>[
                                  // SizedBox(width: 10),
                                  // Icon(Icons.insert_emoticon, color: Colors.grey),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: TextField(
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        hintText: 'Recording...',
                                        hintStyle: TextStyle(color: redColor),
                                        border: InputBorder.none,
                                        isCollapsed: true,
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 10),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, bottom: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    // spreadRadius: 2,
                                    // blurRadius: 2,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  // SizedBox(width: 10),
                                  // Icon(Icons.insert_emoticon, color: Colors.grey),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: TextField(
                                      controller: _textController,
                                      decoration: InputDecoration(
                                        hintText: 'Message',
                                        border: InputBorder.none,
                                        isCollapsed: true,
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 10),
                                      ),
                                      maxLines: null,
                                    ),
                                  ),
                                  // Icon(Icons.attach_file, color: Colors.grey),
                                  // SizedBox(width: 10),
                                  // Icon(Icons.camera_alt, color: Colors.grey),
                                  // SizedBox(width: 10),
                                ],
                              ),
                            ),
                          ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 20),
                      child: _showSendIcon
                          ? IconButton(
                              onPressed: _textController.text.trim().isEmpty
                                  ? null
                                  : () {
                                      if (containsBannedWord(
                                          _textController.text)) {
                                        // check if the input contains a banned word
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text('Error'),
                                              content: Text(
                                                  'Your message contains a banned word.'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text('OK'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      } else {
                                        widget.screenState
                                            .sendMessage(SendMessageRequest(
                                          OrderId:
                                              widget.orderDetailsResponse.id,
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
                                      }
                                    },
                              icon: Icon(
                                Icons.send,
                                color: redColor,
                              ),
                            )
                          : GestureDetector(
                              child: Container(
                                width: 50,
                                height: 50,
                                child: Card(
                                  color: redColor,
                                  shape: const CircleBorder(),
                                  child: Icon(
                                    Icons.mic,
                                    color: !isRecording
                                        ? Colors.white
                                        : Colors.yellow,
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

                                if (!await Permission.microphone.isGranted) {
                                  // Ask for microphone permission if it's not already granted
                                  final status =
                                      await Permission.microphone.request();
                                  if (status != PermissionStatus.granted) {
                                    // Permission not granted, exit the function
                                    setState(() {
                                      isRecording = false;
                                    });
                                    return;
                                  }
                                }

                                RecordMp3.instance.start(path, (type) {
                                  return setState(() {});
                                });
                              },
                              onLongPressEnd: (val) async {
                                final message = Platform.isIOS
                                    ? Messages(
                                        isFromUser: true,
                                        createdDate: DateTime.now(),
                                        message: "file://$path",
                                        messageTypeId: 2,
                                      )
                                    : Messages(
                                        isFromUser: true,
                                        createdDate: DateTime.now(),
                                        message: path,
                                        messageTypeId: 2,
                                      );
                                setState(() {
                                  widget.chatMessage!.add(message);
                                  isRecording = false;
                                  print("Path: $path");
                                  // widget.chatMessage = widget
                                  //     .chatMessage!.reversed
                                  //     .toList(); // reverse the order of chat messages
                                });
                                RecordMp3.instance.stop();
                                await uploadAudioFile(path);
                              },
                              onTap: () {},
                            ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
