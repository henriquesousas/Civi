import 'package:deehelp/old_core/extension/string_extension.dart';
import 'package:deehelp/v2/core/theme/size_layout_spacing.dart';
import 'package:deehelp/v2/core/theme/size_spacing.dart';
import 'package:deehelp/v2/feature/occurrence/send_alert/presentation/widgets/section_category.dart';
import 'package:deehelp/v2/feature/occurrence/send_alert/presentation/widgets/section_header.dart';
import 'package:deehelp/v2/feature/occurrence/send_alert/presentation/widgets/section_description.dart';
import 'package:deehelp/v2/feature/occurrence/send_alert/presentation/widgets/send_alert_pulse_buttton.dart';
import 'package:deehelp/v2/feature/occurrence/send_alert/presentation/widgets/top_app_bar.dart';
import 'package:deehelp/v2/feature/occurrence/send_alert/presentation/widgets/voice_listening_dialog.dart';
import 'package:flutter/material.dart';

class SendAlertPage extends StatefulWidget {
  const SendAlertPage({super.key});

  @override
  State<SendAlertPage> createState() => _SendAlertPageState();
}

class _SendAlertPageState extends State<SendAlertPage> {
  String? selectedCategory;
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _descriptionController.dispose();
  }

  void _onCategorySelected(String label) {
    setState(() {
      if (selectedCategory == label) {
        selectedCategory = null;
        _descriptionController.clear();
      } else {
        selectedCategory = label;
      }
    });
  }

  Future<void> _toggleListening() async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const VoiceListeningDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: SizeLayoutSpacing.l),
          child: Column(
            children: [
              const TopAppBar(),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: IntrinsicHeight(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: SizeSpacing.xxl),
                                const SectionHeader(),
                                const SizedBox(height: SizeSpacing.xl),
                                SectionCategory(
                                  selectedCategory: selectedCategory,
                                  onSelected: _onCategorySelected,
                                ),
                                const SizedBox(height: SizeSpacing.xl),
                                AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 250),
                                  child: selectedCategory.isNullOrEmpty()
                                      ? const SizedBox.shrink()
                                      : SectionDescription(
                                          key: ValueKey(selectedCategory),
                                          selectedCategory: selectedCategory!,
                                          controller: _descriptionController,
                                          onMicPressed: () =>
                                              _toggleListening(),
                                          onChanged: (_) => setState(() {}),
                                          // onChanged: (_) => _toggleListening,
                                        ),
                                ),
                                const SizedBox(height: SizeSpacing.xl),
                                SenAlertPulseButton(
                                  onTap: () {},
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
