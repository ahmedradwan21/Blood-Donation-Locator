import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:translator/translator.dart';
import 'package:bldapp/generated/l10n.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> _messages = [];
  List<String> _currentResponseWords = [];
  int _currentWordIndex = 0;
  bool _isTyping = false;

  Future<void> sendUserInput(String userInput) async {
    final url = Uri.parse('https://hello-h.onrender.com/chat');
    final translator = GoogleTranslator();
    final headers = {"Content-Type": "application/json"};
    String translatedText = userInput;
    bool isArabic = false;
    if (_isArabic(userInput)) {
      isArabic = true;
      translatedText =
          (await translator.translate(userInput, from: 'ar', to: 'en')).text;
    }
    final body = json.encode({"user_input": translatedText});
    try {
      setState(() {
        _messages.add({
          'text': userInput,
          'isUser': true,
        });
        _isTyping = true;
      });
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        var responseText = response.body;
        if (isArabic) {
          responseText =
              (await translator.translate(responseText, from: 'en', to: 'ar'))
                  .text;
        }
        _currentResponseWords = responseText.split(' ');
        setState(() {
          _messages.add({
            'text': '',
            'isUser': false,
          });
          _currentWordIndex = 0;
          _isTyping = false;
        });
        await animateMessage();
      } else {
        print('Failed to send user input: ${response.statusCode}');
        setState(() {
          _isTyping = false;
        });
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        _isTyping = false;
      });
    }
  }

  Future<void> animateMessage() async {
    while (_currentWordIndex < _currentResponseWords.length) {
      setState(() {
        _messages[_messages.length - 1]['text'] +=
            '${_currentResponseWords[_currentWordIndex]} ';
      });
      await Future.delayed(const Duration(milliseconds: 100));
      _currentWordIndex++;
    }
  }

  bool _isArabic(String text) {
    final arabicRegExp = RegExp(r'[\u0600-\u06FF]');
    return arabicRegExp.hasMatch(text);
  }

  void onUserInputSubmitted() {
    final input = _controller.text.trim();
    if (input.isNotEmpty) {
      sendUserInput(input);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).ChatBot),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Align(
                  alignment: message['isUser']
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: message['isUser']
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: message['isUser']
                                ? Colors.blue[300]
                                : Colors.grey[300],
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 16.0),
                          child: Text(message['text']),
                        ),
                        if (index == _messages.length - 1 && _isTyping)
                          const Padding(
                              padding: EdgeInsets.only(top: 8.0, left: 10),
                              child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text('Typing...'))),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: S.of(context).Enter_your_Meaasge,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    onSubmitted: (_) => onUserInputSubmitted(),
                  ),
                ),
                const SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: onUserInputSubmitted,
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(16.0),
                  ),
                  child: const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
