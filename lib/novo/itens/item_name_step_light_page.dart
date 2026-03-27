import 'package:flutter/material.dart';

class ItemNameStepLightPage extends StatefulWidget {
  final String itemTypeLabel;

  const ItemNameStepLightPage({
    super.key,
    required this.itemTypeLabel,
  });

  @override
  State<ItemNameStepLightPage> createState() => _ItemNameStepLightPageState();
}

class _ItemNameStepLightPageState extends State<ItemNameStepLightPage> {
  final _controller = TextEditingController();

  bool get _isEnabled => _controller.text.trim().isNotEmpty;

  String get _hintExample {
    switch (widget.itemTypeLabel.toLowerCase()) {
      case 'carro':
        return 'Ex: Onix, Fox, Sandero';
      case 'moto':
        return 'Ex: CG 160, Biz, XRE 300';
      case 'celular':
        return 'Ex: iPhone 13, Galaxy S23';
      default:
        return 'Digite o nome do item';
    }
  }

  String get _titleText {
    switch (widget.itemTypeLabel.toLowerCase()) {
      case 'carro':
        return 'Qual é o nome do seu carro?';
      case 'moto':
        return 'Qual é o nome da sua moto?';
      case 'celular':
        return 'Qual é o nome do seu celular?';
      default:
        return 'Qual é o nome do seu item?';
    }
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    _controller.dispose();
    super.dispose();
  }

  void _onContinue() {
    final itemName = _controller.text.trim();

    debugPrint('Nome do item: $itemName');

    // Exemplo:
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (_) => NextStepPage(itemName: itemName),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    const bgColor = Color(0xFFF7F9FC);
    const cardColor = Colors.white;
    const borderColor = Color(0xFFE5E7EB);
    const primaryColor = Color(0xFF2B5BEE);
    const titleColor = Color(0xFF111827);
    const subtitleColor = Color(0xFF6B7280);
    const textFieldTextColor = Color(0xFF111827);
    const hintColor = Color(0xFF9CA3AF);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bgColor,
        surfaceTintColor: Colors.transparent,
        title: Text(
          'Cadastro de item',
          style: theme.textTheme.titleLarge?.copyWith(
            color: titleColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _titleText,
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: titleColor,
                  fontWeight: FontWeight.w800,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Informe um nome para identificar seu item com mais facilidade.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: subtitleColor,
                  height: 1.45,
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: borderColor),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x0D101828),
                      blurRadius: 18,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nome do item',
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: const Color(0xFF374151),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _controller,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: textFieldTextColor,
                        fontWeight: FontWeight.w600,
                      ),
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        hintText: _hintExample,
                        hintStyle: theme.textTheme.bodyMedium?.copyWith(
                          color: hintColor,
                        ),
                        filled: true,
                        fillColor: const Color(0xFFF9FAFB),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 18,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: const BorderSide(
                            color: Color(0xFFE5E7EB),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: const BorderSide(
                            color: primaryColor,
                            width: 1.4,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Esse nome será usado para facilitar a identificação do item dentro do app.',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: subtitleColor,
                        height: 1.45,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: FilledButton(
                  onPressed: _isEnabled ? _onContinue : null,
                  style: FilledButton.styleFrom(
                    backgroundColor: primaryColor,
                    disabledBackgroundColor:
                        primaryColor.withValues(alpha: 0.35),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: Text(
                    'Continuar',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
