class Faq {
  final String question;
  final String answer;

  Faq({required this.question, required this.answer});

  static List<Faq> faqList = [
    Faq(
      question: "Posso fazer uma denúncia de forma anônima?",
      answer:
          "Sim. Você pode optar por não se identificar ao relatar uma ocorrência. Seus dados não serão exibidos publicamente.",
    ),
    Faq(
      question: "Minhas denúncias são visíveis para outras pessoas?",
      answer:
          "Apenas as informações relevantes e públicas da ocorrência (como local e tipo de crime) podem ser compartilhadas para alertar a comunidade. Seus dados pessoais são protegidos.",
    ),
    Faq(
      question: "Como registrar uma ocorrência?",
      answer:
          "Vá até a tela Registrar Ocorrência, preencha os dados solicitados como local, data e descrição, e clique em Enviar.",
    ),
    Faq(
      question: "Posso editar uma ocorrência depois de enviada?",
      answer:
          "Por motivos de segurança e integridade, ocorrências não podem ser editadas após o envio. Em caso de erro, entre em contato com o suporte.",
    ),
    Faq(
        question: "O app usa minha localização?",
        answer:
            "Sim, com sua permissão, usamos sua localização para facilitar o preenchimento automático do local da ocorrência e exibir ocorrências próximas."),
    Faq(
        question: "O app substitui a polícia?",
        answer:
            "Não. O app é um canal colaborativo para compartilhamento e alerta. Em casos urgentes, sempre acione a polícia ou serviços oficiais."),
    Faq(
        question: "As ocorrências são compartilhadas com as autoridades?",
        answer:
            "Estamos trabalhando em parcerias para repassar dados relevantes às forças de segurança locais, com consentimento do usuário."),
  ];
}
