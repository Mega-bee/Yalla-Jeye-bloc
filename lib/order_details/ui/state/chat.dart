import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

import '../../response/message.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _textController = TextEditingController();
  List<Message> _messages = [
    Message(
      text: 'Yes sure!',
      date: DateTime.now().subtract(
        Duration(days: 3, minutes: 1),
      ),
      isSentByMe: false,
    ),
    Message(
      text: 'no',
      date: DateTime.now().subtract(
        Duration(days: 3, minutes: 2),
      ),
      isSentByMe: true,
    ),
    Message(
      text: 'why',
      date: DateTime.now().subtract(
        Duration(days: 3, minutes: 3),
      ),
      isSentByMe: false,
    ),
    Message(
      text: 'bcz i can',
      date: DateTime.now().subtract(
        Duration(days: 3, minutes: 4),
      ),
      isSentByMe: true,
    ),
    Message(
      text: 'okay',
      date: DateTime.now().subtract(
        Duration(days: 3, minutes: 5),
      ),
      isSentByMe: false,
    ),
  ].reversed.toList();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: GroupedListView<Message, DateTime>(
            padding: const EdgeInsets.all(8),
            reverse: true,
            order: GroupedListOrder.DESC,
            elements: _messages,
            groupBy: (message) => DateTime(
              message.date.year,
              message.date.month,
              message.date.day,
            ),
            groupHeaderBuilder: (Message message) => SizedBox(
              height: 40,
              child: Center(
                child: Card(
                  color: Theme.of(context).primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      DateFormat.yMMMd().format(message.date),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            itemBuilder: (context, Message message) => Align(
              alignment: message.isSentByMe
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Card(
                elevation: 8,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(message.text),
                ),
              ),
            ),
          )),
          Container(
            color: Colors.grey.shade300,
            child: TextField(
              controller: _textController,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(12),
                hintText: 'Type your message here...',
              ),
              onSubmitted: (text) {
                final message = Message(
                  text: text,
                  date: DateTime.now(),
                  isSentByMe: true,
                );
                setState(() {
                  _messages.add(message);
                  _textController.clear();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
