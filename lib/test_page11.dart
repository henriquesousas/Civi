import 'package:flutter/material.dart';

class TestPage11 extends StatelessWidget {
  const TestPage11({super.key});

  static const _primary = Color(0xFF2157F8);
  static const _bg = Color(0xFFF5F7FD);
  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      body: Stack(
        children: [
          const _BlueHeaderBubbles(),
          SafeArea(
            child: Column(
              children: [
                // top spacing
                const SizedBox(height: 18),

                // header
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: _Header(
                    onSkip: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Pular (entrar sem login)')),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 14),

                // content
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 18),
                    children: [
                      const _HeroCard(),
                      const SizedBox(height: 14),
                      const _InfoCard(
                        title: 'Por que criamos o Kotto?',
                        icon: Icons.shield_outlined,
                        child: Text(
                          'Criamos o Kotto para ajudar pessoas a entenderem melhor o nível de risco '
                          'na região onde vivem e a reagirem mais rápido quando algo acontece.\n\n'
                          'A informação vem da comunidade: quanto mais gente usando, mais útil e preciso fica.',
                          style: TextStyle(
                            color: _ink,
                            fontWeight: FontWeight.w600,
                            height: 1.35,
                            fontSize: 13.5,
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),
                      const _HowItWorksCard(),
                      const SizedBox(height: 14),
                      _EngagementCard(
                        onShare: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Compartilhar app')),
                          );
                        },
                      ),
                      const SizedBox(height: 18),
                    ],
                  ),
                ),

                // bottom actions
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 14),
                  child: _BottomActions(
                    onContinue: () async {
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   const SnackBar(content: Text('Continuar')),
                      // );
                      await showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        barrierColor: Colors.black.withOpacity(0.25),
                        builder: (_) => _LoginBottomSheet(
                          onGoogleTap: () {},
                          onGuestTap: () {},
                        ),
                      );
                    },
                    onLogin: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Ir para login')),
                      );
                    },
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

/* --------------------------- UI Blocks --------------------------- */

class _Header extends StatelessWidget {
  final VoidCallback onSkip;
  const _Header({required this.onSkip});

  static const _primary = Color(0xFF2157F8);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // fake logo mark
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: _primary,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: _primary.withOpacity(0.25),
                blurRadius: 18,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: const Icon(Icons.visibility_outlined, color: Colors.white),
        ),
        const SizedBox(width: 10),
        const Expanded(
          child: Text(
            'Kotto',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              letterSpacing: 0.2,
            ),
          ),
        ),
        TextButton(
          onPressed: onSkip,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
              side: BorderSide(color: Colors.white.withOpacity(0.22)),
            ),
          ),
          child: const Text(
            'Pular',
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
        ),
      ],
    );
  }
}

class _HeroCard extends StatelessWidget {
  const _HeroCard();

  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);
  static const _primary = Color(0xFF2157F8);

  @override
  Widget build(BuildContext context) {
    return _Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // badge row
            Row(
              children: [
                _Pill(
                  label: 'NOVO',
                  bg: _primary.withOpacity(0.12),
                  fg: _primary,
                ),
                const SizedBox(width: 8),
                _Pill(
                  label: 'BETA',
                  bg: const Color(0xFFFFF3E0),
                  fg: const Color(0xFFFB8C00),
                ),
                const Spacer(),
                const Icon(Icons.info_outline, color: _muted, size: 18),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              'Bem-vindo ao Kotto 👋',
              style: TextStyle(
                fontSize: 18.5,
                fontWeight: FontWeight.w900,
                color: _ink,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Estamos em desenvolvimento e sua participação faz diferença. '
              'Aqui você registra itens, acompanha ocorrências e ajuda sua comunidade a ficar mais segura.',
              style: TextStyle(
                fontSize: 13.5,
                height: 1.35,
                fontWeight: FontWeight.w600,
                color: _muted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HowItWorksCard extends StatelessWidget {
  const _HowItWorksCard();

  static const _ink = Color(0xFF1F2A44);

  @override
  Widget build(BuildContext context) {
    return _InfoCard(
      title: 'Como funciona',
      icon: Icons.auto_awesome_outlined,
      child: Column(
        children: const [
          _StepTile(
            index: 1,
            title: 'Cadastre seus itens',
            subtitle: 'Carro, moto ou celular — rápido e organizado.',
            icon: Icons.inventory_2_outlined,
          ),
          _DividerIndented(),
          _StepTile(
            index: 2,
            title: 'Reporte ocorrências',
            subtitle: 'Imediato (na hora) ou detalhado (com mais informações).',
            icon: Icons.report_outlined,
          ),
          _DividerIndented(),
          _StepTile(
            index: 3,
            title: 'Acompanhe o mapa',
            subtitle: 'Veja ocorrências na sua área e compartilhe alertas.',
            icon: Icons.map_outlined,
          ),
        ],
      ),
    );
  }
}

class _EngagementCard extends StatelessWidget {
  final VoidCallback onShare;
  const _EngagementCard({required this.onShare});

  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);
  static const _primary = Color(0xFF2157F8);

  @override
  Widget build(BuildContext context) {
    return _InfoCard(
      title: 'Precisamos da sua ajuda',
      icon: Icons.favorite_border_rounded,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'O Kotto melhora com o uso da comunidade.',
            style: TextStyle(
              color: _ink,
              fontWeight: FontWeight.w900,
              fontSize: 13.5,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            '• Registre ocorrências com responsabilidade\n'
            '• Compartilhe o app com vizinhos e familiares\n'
            '• Envie sugestões — cada feedback conta',
            style: TextStyle(
              color: _muted,
              fontWeight: FontWeight.w700,
              fontSize: 12.8,
              height: 1.35,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: OutlinedButton.icon(
              onPressed: onShare,
              icon: const Icon(Icons.share_outlined),
              label: const Text(
                'Compartilhar o Kotto',
                style: TextStyle(fontWeight: FontWeight.w900),
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: _primary,
                side: BorderSide(color: _primary.withOpacity(0.32)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/* --------------------------- Bottom Actions --------------------------- */

class _BottomActions extends StatelessWidget {
  final VoidCallback onContinue;
  final VoidCallback onLogin;

  const _BottomActions({
    required this.onContinue,
    required this.onLogin,
  });

  static const _primary = Color(0xFF2157F8);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 54,
          child: ElevatedButton(
            onPressed: onContinue,
            style: ElevatedButton.styleFrom(
              backgroundColor: _primary,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            child: const Text(
              'Continuar',
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          height: 54,
          child: OutlinedButton(
            onPressed: onLogin,
            style: OutlinedButton.styleFrom(
              foregroundColor: _primary,
              side: BorderSide(color: _primary.withOpacity(0.30)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            child: const Text(
              'Entrar com minha conta',
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
          ),
        ),
      ],
    );
  }
}

/* --------------------------- Shared Pieces --------------------------- */

class _InfoCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget child;

  const _InfoCard({
    required this.title,
    required this.icon,
    required this.child,
  });

  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);

  @override
  Widget build(BuildContext context) {
    return _Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _LeadingIcon(icon: icon),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                      color: _ink,
                    ),
                  ),
                ),
                const Icon(Icons.chevron_right, color: _muted),
              ],
            ),
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }
}

class _StepTile extends StatelessWidget {
  final int index;
  final String title;
  final String subtitle;
  final IconData icon;

  const _StepTile({
    required this.index,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);
  static const _primary = Color(0xFF2157F8);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: _primary.withOpacity(0.10),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                '$index',
                style: const TextStyle(
                  color: _primary,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: _ink.withOpacity(0.06),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: _ink, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w900,
                    color: _ink,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w700,
                    color: _muted,
                    height: 1.25,
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

class _LeadingIcon extends StatelessWidget {
  final IconData icon;
  const _LeadingIcon({required this.icon});

  static const _ink = Color(0xFF1F2A44);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: _ink.withOpacity(0.08),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Icon(icon, color: _ink, size: 20),
    );
  }
}

class _DividerIndented extends StatelessWidget {
  const _DividerIndented();

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 1,
      indent: 52,
      color: Color(0xFFE6EAF6),
    );
  }
}

class _Pill extends StatelessWidget {
  final String label;
  final Color bg;
  final Color fg;

  const _Pill({required this.label, required this.bg, required this.fg});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(99),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: fg,
          fontWeight: FontWeight.w900,
          fontSize: 11,
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  final Widget child;
  const _Card({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color(0x142B5BEE),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: child,
    );
  }
}

/* --------------------------- Background (blue + bubbles) --------------------------- */

class _BlueHeaderBubbles extends StatelessWidget {
  const _BlueHeaderBubbles();

  static const _primary = Color(0xFF2157F8);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        children: [
          Container(
            height: 210,
            decoration: const BoxDecoration(
              color: _primary,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(34)),
            ),
          ),
          Positioned(
            top: -40,
            right: -50,
            child: _Bubble(size: 160, opacity: 0.12),
          ),
          Positioned(
            top: 60,
            left: -40,
            child: _Bubble(size: 120, opacity: 0.10),
          ),
          Positioned(
            top: 120,
            right: 40,
            child: _Bubble(size: 80, opacity: 0.10),
          ),
        ],
      ),
    );
  }
}

class _Bubble extends StatelessWidget {
  final double size;
  final double opacity;
  const _Bubble({required this.size, required this.opacity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(opacity),
        shape: BoxShape.circle,
      ),
    );
  }
}

class _LoginBottomSheet extends StatelessWidget {
  final VoidCallback onGoogleTap;
  final VoidCallback onGuestTap;

  const _LoginBottomSheet({
    required this.onGoogleTap,
    required this.onGuestTap,
  });

  static const _primary = Color(0xFF2157F8);
  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);
  static const _bg = Color(0xFFF5F7FD);

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: EdgeInsets.only(bottom: bottomInset),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
        ),
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 14),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // handle
                Container(
                  width: 44,
                  height: 5,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE6EAF6),
                    borderRadius: BorderRadius.circular(99),
                  ),
                ),
                const SizedBox(height: 12),

                Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: _primary.withOpacity(0.10),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(Icons.lock_outline,
                          color: _primary, size: 22),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Entrar no Kotto',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: _ink,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Faça login para salvar seus itens e acompanhar suas ocorrências.',
                            style: TextStyle(
                              fontSize: 12.8,
                              fontWeight: FontWeight.w700,
                              color: _muted,
                              height: 1.25,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close, color: _muted),
                      tooltip: 'Fechar',
                    ),
                  ],
                ),

                const SizedBox(height: 14),

                // main actions
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                      onGoogleTap();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _primary,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    icon: const _GoogleGMark(),
                    label: const Text(
                      'Continuar com Google',
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      onGuestTap();
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: _ink,
                      side: const BorderSide(color: Color(0xFFE6EAF6)),
                      backgroundColor: _bg,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: const Text(
                      'Continuar sem login',
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // helper/info card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: _primary.withOpacity(0.06),
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: _primary.withOpacity(0.16)),
                  ),
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.info_outline, color: _primary, size: 18),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Você pode usar o app sem login, mas algumas funcionalidades '
                          'como salvar itens e editar ocorrências exigem autenticação.',
                          style: TextStyle(
                            fontSize: 12.3,
                            fontWeight: FontWeight.w700,
                            color: _muted,
                            height: 1.25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                // fine print
                Text(
                  'Ao continuar, você concorda com nossos Termos e Política de Privacidade.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 11.5,
                    color: _muted.withOpacity(0.95),
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 6),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Ícone simples do "G" do Google (sem asset)
class _GoogleGMark extends StatelessWidget {
  const _GoogleGMark();

  @override
  Widget build(BuildContext context) {
    // “G” minimalista (pode trocar por asset depois)
    return Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
      ),
      child: const Center(
        child: Text(
          'G',
          style: TextStyle(
            color: Color(0xFF1F2A44),
            fontWeight: FontWeight.w900,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
