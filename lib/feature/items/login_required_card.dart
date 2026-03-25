import 'package:flutter/material.dart';

class LoginRequiredCard extends StatelessWidget {
  final VoidCallback onLoginTap;
  final VoidCallback? onSkipTap;

  const LoginRequiredCard({
    super.key,
    required this.onLoginTap,
    this.onSkipTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A), // dark premium
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.white.withOpacity(0.08),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.35),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// 🔐 Icon
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.12),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.lock_outline,
              color: Colors.blue,
              size: 28,
            ),
          ),

          const SizedBox(height: 16),

          /// 🧠 Title
          const Text(
            "Entre na sua conta",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 8),

          /// 📄 Description
          const Text(
            "Acompanhe seus itens, registre ocorrências e receba alertas em tempo real na sua região.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              height: 1.4,
              color: Colors.white70,
            ),
          ),

          const SizedBox(height: 20),

          /// 🚀 Login button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onLoginTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2B5BEE),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text(
                "Entrar agora",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          if (onSkipTap != null) ...[
            const SizedBox(height: 12),

            /// 👀 Skip
            GestureDetector(
              onTap: onSkipTap,
              child: const Text(
                "Continuar sem login",
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
