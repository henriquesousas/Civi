import 'package:deehelp/test_router_preview.dart';
import 'package:flutter/material.dart';

class TestNotification extends StatelessWidget {
  const TestNotification({super.key});

  @override
  Widget build(BuildContext context) {
    final alerts = [
      AlertItem(
        time: '4 days',
        title: 'Offset Shooter At Large',
        description:
            'The FBI has released photos of suspects who attempted to rob the rapper before shooting him in the leg outside a Florida casino on April 6.',
      ),
      AlertItem(
        time: '5 days',
        title: 'One Dead in Airport Shooting',
        description:
            'A juvenile victim was hurt and the suspect is dead after gunfire inside the terminal at Elko Regional Airport in Nevada this afternoon.',
      ),
      AlertItem(
        time: '6 days',
        title: '🐐 Un-baaa-lievable Goats',
        description:
            'A large herd of goats was seen running along an LA County hillside and into the road after briefly escaping containment.',
        image:
            'https://images.unsplash.com/photo-1500595046743-cd271d694d30?q=80&w=300',
      ),
      AlertItem(
        time: '6 days',
        title: 'Shooting at NJ Chick-fil-A',
        description:
            'One person was killed and six others hurt in last night\'s shooting at a Chick-fil-A in Union, New Jersey.',
      ),
      AlertItem(
        time: '8 days',
        title: '🚀 Historic Mission Concludes',
        description:
            'The astronauts have returned home after traveling farther from Earth than anyone in human history.',
        image:
            'https://images.unsplash.com/photo-1446776811953-b23d57bd21aa?q=80&w=300',
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Alerts',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.settings),
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: alerts.length,
        separatorBuilder: (_, __) => const Divider(
          color: Color(0xFF1A1A1A),
          height: 1,
        ),
        itemBuilder: (context, index) {
          return AlertTile(item: alerts[index]);
        },
      ),
    );
  }
}

class AlertItem {
  final String time;
  final String title;
  final String description;
  final String? image;

  AlertItem({
    required this.time,
    required this.title,
    required this.description,
    this.image,
  });
}

class AlertTile extends StatelessWidget {
  final AlertItem item;

  const AlertTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // tempo
          // RoutePreviewCard(
          //   distanceKm: 2.4,
          //   startPoint: const Offset(0.25, 0.35), // ocorrência
          //   endPoint: const Offset(0.72, 0.70), // usuário
          //   onTap: () {},
          // ),
          Text(
            item.time,
            style: const TextStyle(
              color: Colors.white54,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 8),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // DOT azul
              Container(
                margin: const EdgeInsets.only(top: 6),
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: Color(0xFF2B5BEE), // azul Civi 👀
                  shape: BoxShape.circle,
                ),
              ),

              const SizedBox(width: 10),

              // Conteúdo
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // título
                    Text(
                      item.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 6),

                    // descrição
                    Text(
                      item.description,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),

              // imagem opcional
              if (item.image != null) ...[
                const SizedBox(width: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    item.image!,
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
