import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TesteSettings extends StatelessWidget {
  const TesteSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = const Color(0xFF07161D);
    final cardColor = const Color(0xFF0B1E26);
    final borderColor = Colors.white.withOpacity(0.10);
    final primaryText = Colors.white;
    final secondaryText = Colors.white70;
    final accentColor = const Color(0xFF2EA8FF);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Configurações',
          style: TextStyle(
            color: primaryText.withOpacity(0.25),
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: Center(
              child: Text(
                'PRONTO',
                style: TextStyle(
                  color: accentColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 30),
          children: [
            _sectionCard(
              cardColor: cardColor,
              borderColor: borderColor,
              children: [
                _tile(
                  title: 'Perfil',
                  textColor: primaryText,
                ),
                _divider(borderColor),
                _tile(
                  title: 'Notificações',
                  textColor: primaryText,
                ),
                _divider(borderColor),
                _tile(
                  title: 'Cursos',
                  textColor: primaryText,
                ),
                _divider(borderColor),
                _tile(
                  title: 'Score no LinkedIn',
                  textColor: primaryText,
                ),
                _divider(borderColor),
                _tile(
                  title: 'Duolingo for Schools',
                  textColor: primaryText,
                ),
                _divider(borderColor),
                _tile(
                  title: 'Contas em redes sociais',
                  textColor: primaryText,
                ),
                _divider(borderColor),
                _tile(
                  title: 'Configurações de privacidade',
                  textColor: primaryText,
                ),
              ],
            ),
            const SizedBox(height: 34),
            Text(
              'Assinatura',
              style: TextStyle(
                color: secondaryText,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 14),
            _singleCard(
              title: 'Escolha um plano',
              cardColor: cardColor,
              borderColor: borderColor,
              textColor: primaryText,
            ),
            const SizedBox(height: 34),
            Text(
              'Suporte',
              style: TextStyle(
                color: secondaryText,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 14),
            _sectionCard(
              cardColor: cardColor,
              borderColor: borderColor,
              children: [
                _tile(
                  title: 'Central de Ajuda',
                  textColor: primaryText,
                ),
                _divider(borderColor),
                _tile(
                  title: 'Fazer comentários',
                  textColor: primaryText,
                ),
              ],
            ),
            const SizedBox(height: 40),
            Container(
              height: 72,
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(
                  color: borderColor,
                  width: 1.2,
                ),
              ),
              child: Center(
                child: Text(
                  'SAIR',
                  style: TextStyle(
                    color: accentColor,
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionCard({
    required Color cardColor,
    required Color borderColor,
    required List<Widget> children,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: borderColor,
          width: 1.2,
        ),
      ),
      child: Column(children: children),
    );
  }

  Widget _singleCard({
    required String title,
    required Color cardColor,
    required Color borderColor,
    required Color textColor,
  }) {
    return Container(
      height: 74,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: borderColor,
          width: 1.2,
        ),
      ),
      child: _tile(
        title: title,
        textColor: textColor,
      ),
    );
  }

  Widget _tile({
    required String title,
    required Color textColor,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: () {},
      child: SizedBox(
        height: 74,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Icon(
                CupertinoIcons.chevron_right,
                color: Colors.white38,
                size: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _divider(Color color) {
    return Divider(
      height: 1,
      thickness: 1,
      color: color,
    );
  }
}
