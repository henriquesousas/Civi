import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/utils/url_launcher_utils.dart';
import 'package:deehelp/features/welcome/minimal_new_app_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return MaterialApp(
      title: 'Segurança Comunitária',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1D4ED8),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Inter',
      ),
      home: const WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFEFF6FF),
              Color(0xFFF0F9FF),
              Colors.white,
            ],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Cabeçalho Elegante
                  const SizedBox(height: 20),

                  // Container(
                  //   padding: const EdgeInsets.all(16),
                  //   decoration: BoxDecoration(
                  //     color: const Color(0xFF1D4ED8).withOpacity(0.1),
                  //     borderRadius: BorderRadius.circular(24),
                  //   ),
                  //   child: const Icon(
                  //     Icons.security_rounded,
                  //     size: 48,
                  //     color: Color(0xFF1D4ED8),
                  //   ),
                  // ),

                  Container(
                    width: 80.w,
                    height: 80.h,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2563EB),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF2563EB).withOpacity(0.3),
                          blurRadius: 15,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.security_rounded,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 24),

                  Text(
                    'Tizzo',
                    style: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E293B),
                      height: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  Text(
                    'Segurança colaborativa na palma de sua mão',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textColorHeader,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 20),

                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFEF3C7),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Versão Inicial • Em Desenvolvimento',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF92400E),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  const SizedBox(height: 48),

                  // const NewAppAnnouncementCard(),
                  const MinimalNewAppCard(),

                  // Card de Apresentação
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(28),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF1D4ED8).withOpacity(0.08),
                          blurRadius: 32,
                          offset: const Offset(0, 12),
                        ),
                      ],
                      border: Border.all(
                        color: const Color(0xFFE2E8F0),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: const Color(0xFFDBEAFE),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.favorite,
                                color: Color(0xFF1D4ED8),
                                size: 22,
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Expanded(
                              child: Text(
                                'Nossa Razão de Existir',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1E293B),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          'Por Que Criamos Este Aplicativo?',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1D4ED8),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Em uma sociedade onde a criminalidade cresce diariamente, sentimos a necessidade urgente de criar ferramentas que protejam e empoderem as pessoas. Este aplicativo nasceu do desejo de transformar preocupação em ação concreta.',
                          style: TextStyle(
                            fontSize: 16,
                            height: 1.7,
                            color: Colors.grey[800],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Acreditamos que a tecnologia deve servir para unir comunidades e criar ambientes mais seguros para todos. Cada recurso foi pensado com cuidado para oferecer proteção real e promover a ajuda mútua.',
                          style: TextStyle(
                            fontSize: 16,
                            height: 1.7,
                            color: Colors.grey[800],
                          ),
                        ),
                        const SizedBox(height: 24),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFFFEF3C7),
                                Color(0xFFFDE68A),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.verified_user,
                                color: Color(0xFF92400E),
                                size: 22,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  'Sua segurança e privacidade são nossas maiores prioridades. Trabalhamos constantemente para melhorar sua experiência.',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[800],
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Card de Colaboração
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(28),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF1D4ED8),
                          Color(0xFF1E40AF),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF1D4ED8).withOpacity(0.3),
                          blurRadius: 24,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.people,
                          size: 48,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Contamos Com Sua Colaboração',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: -0.3,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Como estamos começando esta importante jornada, cada feedback é valioso. Sua experiência nos ajuda a criar um aplicativo melhor e mais seguro para toda a comunidade.',
                          style: TextStyle(
                            fontSize: 16,
                            height: 1.7,
                            color: Colors.white.withOpacity(0.95),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.3),
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _buildFeatureIcon(
                                      Icons.bug_report, Colors.white),
                                  const SizedBox(width: 8),
                                  _buildFeatureIcon(
                                      Icons.lightbulb, Colors.white),
                                  const SizedBox(width: 8),
                                  _buildFeatureIcon(
                                      Icons.feedback, Colors.white),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'Reporte bugs, sugira melhorias ou compartilhe suas ideias conosco.',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white.withOpacity(0.9),
                                  fontStyle: FontStyle.italic,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Ações Principais
                  Column(
                    children: [
                      // Botão Primário
                      Container(
                        width: double.infinity,
                        height: 56,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF10B981),
                              Color(0xFF059669),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF10B981)
                                  .withValues(alpha: 0.4),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(16),
                            onTap: () {
                              // Navegação para o app principal
                              // _showThankYouDialog(context);
                              context.pop();
                            },
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.rocket_launch,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 10),
                                  const Text(
                                    'Explorar o Aplicativo',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Botão Secundário
                      Container(
                        width: double.infinity,
                        height: 56,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: const Color(0xFFE2E8F0),
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(16),
                            onTap: () {
                              // _showFeedbackOptions(context);
                              UrlLauncherUtils.launchWhatsAppSupport(
                                context,
                                "5511972732245",
                                "Teste",
                              );
                            },
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.chat_bubble_outline,
                                    color: Colors.grey[700],
                                    size: 20,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    'Falar com nosso suporte',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Texto Informativo
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Este é apenas o começo. Com sua ajuda, podemos construir uma ferramenta que realmente faça a diferença na segurança de todos.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                            fontStyle: FontStyle.italic,
                            height: 1.6,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      // const SizedBox(height: 32),

                      // // Link para Suporte
                      // GestureDetector(
                      //   onTap: () {
                      //     _showSupportDialog(context);
                      //   },
                      //   child: Container(
                      //     padding: const EdgeInsets.symmetric(
                      //         vertical: 12, horizontal: 24),
                      //     decoration: BoxDecoration(
                      //       color: Colors.grey[50],
                      //       borderRadius: BorderRadius.circular(12),
                      //       border: Border.all(color: Colors.grey.shade200),
                      //     ),
                      //     child: Row(
                      //       mainAxisSize: MainAxisSize.min,
                      //       children: [
                      //         Icon(
                      //           Icons.help_outline,
                      //           color: Colors.grey[600],
                      //           size: 18,
                      //         ),
                      //         const SizedBox(width: 8),
                      //         Expanded(
                      //           child: Text(
                      //             'Precisa de ajuda? Fale com nosso suporte',
                      //             style: TextStyle(
                      //               fontSize: 12.sp,
                      //               color: Colors.grey[700],
                      //               fontWeight: FontWeight.w500,
                      //             ),
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureIcon(IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 18, color: color),
    );
  }

  void _showThankYouDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFF10B981).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_circle,
                  color: Color(0xFF10B981),
                  size: 36,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Obrigado!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E293B),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Agradecemos por se juntar a nós nesta missão de criar comunidades mais seguras.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    // Aqui você navegaria para a tela principal do app
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1D4ED8),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Começar a Usar',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
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

  void _showFeedbackOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Como podemos melhorar?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Escolha como deseja nos ajudar',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 24),
            _buildFeedbackOption(
              context,
              icon: Icons.bug_report,
              title: 'Reportar Bug',
              subtitle: 'Encontrou um problema técnico?',
              color: const Color(0xFFDC2626),
              onTap: () {
                Navigator.pop(context);
                _openBugReport();
              },
            ),
            const SizedBox(height: 12),
            _buildFeedbackOption(
              context,
              icon: Icons.lightbulb_outline,
              title: 'Sugerir Melhoria',
              subtitle: 'Tem uma ideia para melhorar o app?',
              color: const Color(0xFF059669),
              onTap: () {
                Navigator.pop(context);
                _openSuggestionForm();
              },
            ),
            const SizedBox(height: 12),
            _buildFeedbackOption(
              context,
              icon: Icons.shield,
              title: 'Feedback de Segurança',
              subtitle: 'Algo relacionado à proteção?',
              color: const Color(0xFF1D4ED8),
              onTap: () {
                Navigator.pop(context);
                _openSecurityFeedback();
              },
            ),
            const SizedBox(height: 32),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancelar',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeedbackOption(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: color.withOpacity(0.05),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: color.withOpacity(0.2)),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: color, size: 22),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: color,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: Colors.grey[400],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSupportDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Suporte e Contato'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Estamos aqui para ajudar você:',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16),
            _buildContactInfo(
              Icons.email,
              'suporte@segurancacomunitaria.com',
            ),
            const SizedBox(height: 12),
            _buildContactInfo(
              Icons.security,
              'Relatórios de segurança têm prioridade',
            ),
            const SizedBox(height: 12),
            _buildContactInfo(
              Icons.access_time,
              'Resposta em até 24 horas',
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Fechar'),
          ),
          ElevatedButton(
            onPressed: () {
              // Abrir cliente de email
              Navigator.pop(context);
            },
            child: const Text('Enviar Email'),
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfo(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 18, color: const Color(0xFF1D4ED8)),
        const SizedBox(width: 10),
        Expanded(child: Text(text)),
      ],
    );
  }

  void _openBugReport() {
    // Implementar abertura do formulário de bug
  }

  void _openSuggestionForm() {
    // Implementar abertura do formulário de sugestões
  }

  void _openSecurityFeedback() {
    // Implementar abertura do formulário de segurança
  }
}
