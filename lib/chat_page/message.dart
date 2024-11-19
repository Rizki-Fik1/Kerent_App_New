import 'package:flutter/material.dart';
import 'package:kerent_app/home_page/inbox_page.dart';
import 'package:kerent_app/profile_page/profile_public.dart';

class MessagePage extends StatefulWidget {
  final String recipientName;
  final Color profileColor;
  final String? initialMessage;
  final RentRequest? rentRequest;

  const MessagePage({
    super.key,
    required this.recipientName,
    required this.profileColor,
    this.initialMessage,
    this.rentRequest,
  });

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];

  @override
  void initState() {
    super.initState();
    if (widget.initialMessage != null) {
      _messages.add({
        'text': widget.initialMessage!,
        'isMe': true,
        'time': DateTime.now(),
        'isCard': false,
      });
      
      if (widget.rentRequest != null) {
        _messages.add({
          'isCard': true,
          'rentRequest': widget.rentRequest,
          'time': DateTime.now(),
          'isMe': true,
        });
      }
    }
  }

  Widget _buildStatusBadge(String status) {
    final Color backgroundColor;
    final Color textColor;

    switch (status) {
      case 'Pending':
        backgroundColor = Colors.orange.withOpacity(0.2);
        textColor = Colors.orange;
        break;
      case 'Confirmed':
        backgroundColor = Colors.green.withOpacity(0.2);
        textColor = Colors.green;
        break;
      default:
        backgroundColor = Colors.red.withOpacity(0.2);
        textColor = Colors.red;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: textColor,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        _messages.add({
          'text': _messageController.text,
          'isMe': true,
          'time': DateTime.now(),
          'isCard': false,
        });
        _messageController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A1A),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PublicProfilePage(
                  
                ),
              ),
            );
          },
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: widget.profileColor,
                child: Text(
                  widget.recipientName[0].toUpperCase(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                widget.recipientName,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
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
                return message['isCard'] 
                    ? _buildProductCard(message['rentRequest'])
                    : _buildMessageBubble(message);
              },
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildProductCard(RentRequest request) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF262626),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(
              request.product.images,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      request.product.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    _buildStatusBadge(request.status),
                  ],
                ),
                const SizedBox(height: 12),
                _buildDetailRow(Icons.schedule, 'Duration: ${request.rentalDuration}'),
                _buildDetailRow(Icons.person, 'Customer: ${request.customerName}'),
                _buildDetailRow(Icons.phone, 'Contact: ${request.customerGopayOrPhone}'),
                _buildDetailRow(Icons.class_, 'Class: ${request.customerClass}'),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Total: Rp ${request.totalPrice}',
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(Map<String, dynamic> message) {
    return Align(
      alignment: message['isMe'] ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: message['isMe'] ? Colors.blue : const Color(0xFF31363F),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              message['text'],
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 4),
            Text(
              _formatTimestamp(message['time']),
              style: TextStyle(color: Colors.grey[400], fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.all(8),
      color: const Color(0xFF31363F),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Type a message...',
                hintStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.black,
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            backgroundColor: Colors.blue,
            child: IconButton(
              icon: const Icon(Icons.send, color: Colors.white),
              onPressed: _sendMessage,
            ),
          ),
        ],
      ),
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    return '${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}';
  }
}