import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  final String recipientName;
  final Color profileColor;

  const MessagePage({
    Key? key,
    required this.recipientName,
    required this.profileColor,
  }) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];
  int? _editingIndex;

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        if (_editingIndex != null) {
          _messages[_editingIndex!]['text'] = _messageController.text;
          _editingIndex = null;
        } else {
          _messages.add({
            'text': _messageController.text,
            'isMe': true,
            'time': DateTime.now(),
          });
        }
        _messageController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: widget.profileColor,
              child: Text(
                widget.recipientName[0],
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(width: 10),
            Text(widget.recipientName, style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[_messages.length - 1 - index];
                return _buildMessageBubble(message, _messages.length - 1 - index);
              },
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

Widget _buildMessageBubble(Map<String, dynamic> message, int index) {
  return GestureDetector(
    child: Align(
      alignment: message['isMe'] ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: message['isMe'] ? Colors.blue : Color(0xFF31363F),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              message['text'],
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 4),
            Text(
              _formatTimestamp(message['time']),
              style: TextStyle(color: Colors.grey[400], fontSize: 12),
            ),
          ],
        ),
      ),
    ),
  );
}

String _formatTimestamp(DateTime timestamp) {
  return '${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}';
}

  Widget _buildMessageInput() {
    return Container(
      padding: EdgeInsets.all(8),
      color: Color(0xFF31363F),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: _editingIndex != null ? 'Edit message...' : 'Type a message...',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.black,
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
          ),
          SizedBox(width: 8),
          CircleAvatar(
            backgroundColor: Colors.blue,
            child: IconButton(
              icon: Icon(_editingIndex != null ? Icons.check : Icons.send, color: Colors.white),
              onPressed: _sendMessage,
            ),
          ),
        ],
      ),
    );
  }
}