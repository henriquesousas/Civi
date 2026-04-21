import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class VoiceListeningDialog extends StatefulWidget {
  const VoiceListeningDialog({super.key});

  @override
  State<VoiceListeningDialog> createState() => _VoiceListeningDialogState();
}

class _VoiceListeningDialogState extends State<VoiceListeningDialog>
    with SingleTickerProviderStateMixin {
  late stt.SpeechToText _speech;
  late AnimationController _controller;
  final TextEditingController _descriptionController = TextEditingController();
  bool _isListening = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);

    _speech = stt.SpeechToText();
    _startListener();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // void _stopListening() {
  //   setState(() {
  //     isListening = false;
  //   });

  //   Navigator.of(context).pop();
  // }

  Future<void> _startListener() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        finalTimeout: Duration(seconds: 30),
        onStatus: (status) {
          if (status == 'done') {
            setState(() => _isListening = false);
          }
        },
        onError: (error) {
          setState(() => _isListening = false);
        },
      );

      if (available) {
        setState(() => _isListening = true);

        _speech.listen(
          localeId: 'pt_BR',
          listenFor: const Duration(seconds: 30),
          pauseFor: const Duration(seconds: 5),
          // partialResults: true,
          onResult: (result) {
            setState(() {
              _descriptionController.text = result.recognizedWords;
              _descriptionController.selection = TextSelection.fromPosition(
                TextPosition(offset: _descriptionController.text.length),
              );
            });
          },
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFF111111),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (_, __) {
                final scale = 1 + (_controller.value * 0.12);

                return Transform.scale(
                  scale: scale,
                  child: Container(
                    width: 92,
                    height: 92,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0x22FF2D55),
                      border: Border.all(
                        color: const Color(0x66FF2D55),
                        width: 2,
                      ),
                    ),
                    child: const Icon(
                      Icons.mic_rounded,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Fale agora',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Estamos ouvindo sua descrição do alerta.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white54,
                fontSize: 14,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _descriptionController,
              // onChanged: onChanged,
              maxLength: 300,
              minLines: 4,
              maxLines: 8,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Digite aqui...',
                hintStyle: const TextStyle(color: Colors.white38),
                filled: true,
                fillColor: const Color(0xFF1A1A1A),
                contentPadding: const EdgeInsets.all(16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
                counterStyle: const TextStyle(color: Colors.white54),
                suffixIconConstraints: const BoxConstraints(
                  minHeight: 48,
                  minWidth: 56,
                ),
              ),
            ),
            // SizedBox(
            //   width: double.infinity,
            //   child: ElevatedButton.icon(
            //     onPressed: _stopListening,
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: const Color(0xFFFF2D55),
            //       foregroundColor: Colors.white,
            //       padding: const EdgeInsets.symmetric(vertical: 16),
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(16),
            //       ),
            //     ),
            //     icon: const Icon(Icons.stop_rounded),
            //     label: const Text(
            //       'Parar gravação',
            //       style: TextStyle(
            //         fontSize: 15,
            //         fontWeight: FontWeight.w700,
            //       ),
            //     ),
            //   ),
            // ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'Cancelar',
                style: TextStyle(color: Colors.white70),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
