import 'package:flutter/material.dart';

class TestAlertZonePage extends StatelessWidget {
  const TestAlertZonePage({super.key});

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Colors.black;
    const cardColor = Color(0xFF111111);
    const fieldColor = Color(0xFF1D1D1D);
    const fieldBorderColor = Color(0xFF2A2A2A);
    const primaryTextColor = Colors.white;
    const secondaryTextColor = Color(0xFF9E9E9E);
    const buttonColor = Color(0xFFB8CDE3);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _BackButton(),
              const SizedBox(height: 18),
              const Text(
                'Alert Zone',
                style: TextStyle(
                  color: primaryTextColor,
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Get alerts for incidents within a specific area (home,\nschool, work etc.)',
                style: TextStyle(
                  color: secondaryTextColor,
                  fontSize: 16,
                  height: 1.35,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 28),
              const _SectionLabel('Address'),
              const SizedBox(height: 10),
              const _DarkTextField(
                hintText: 'Enter Address',
              ),
              const SizedBox(height: 24),
              const _SectionLabel('Name'),
              const SizedBox(height: 10),
              const _DarkTextField(
                hintText: 'Enter Location Name (i.e. School)',
              ),
              const SizedBox(height: 28),
              const _SectionLabel('Add Family Plan Members'),
              const SizedBox(height: 14),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: const Color(0xFF1C1C1C)),
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.lock_outline,
                        color: Colors.blue.shade200,
                        size: 18,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const _AvatarStack(),
                    const SizedBox(height: 18),
                    const Text(
                      'Add Arrival and Departure Alerts',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: primaryTextColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        'Get notified the instant your loved ones enter or exit this area.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: secondaryTextColor,
                          fontSize: 14,
                          height: 1.45,
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    SizedBox(
                      width: double.infinity,
                      height: 42,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: buttonColor,
                          foregroundColor: Colors.black,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Subscribe Now',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),
              const _SectionLabel('Notification Distance'),
              const SizedBox(height: 6),
              const Text(
                'Adjust the notification distance from this location.',
                style: TextStyle(
                  color: secondaryTextColor,
                  fontSize: 13,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 18),
              Column(
                children: [
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: buttonColor,
                      inactiveTrackColor: const Color(0xFF2B2B2B),
                      thumbColor: Colors.white,
                      overlayColor: Colors.white24,
                      trackHeight: 4,
                    ),
                    child: Slider(
                      value: 50,
                      min: 1,
                      max: 100,
                      onChanged: (_) {},
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '1 km',
                        style: TextStyle(
                          color: secondaryTextColor,
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        '50 km',
                        style: TextStyle(
                          color: primaryTextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '100 km',
                        style: TextStyle(
                          color: secondaryTextColor,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () => Navigator.of(context).maybePop(),
      child: const Padding(
        padding: EdgeInsets.all(4),
        child: Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String text;

  const _SectionLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class _DarkTextField extends StatelessWidget {
  final String hintText;

  const _DarkTextField({
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
        color: Colors.white,
        fontSize: 15,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color(0xFF8E8E8E),
          fontSize: 15,
        ),
        filled: true,
        fillColor: const Color(0xFF1D1D1D),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 18,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: const BorderSide(
            color: Color(0xFF2A2A2A),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: const BorderSide(
            color: Color(0xFF4B4B4B),
          ),
        ),
      ),
    );
  }
}

class _AvatarStack extends StatelessWidget {
  const _AvatarStack();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      width: 150,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _buildAvatar(
            left: 18,
            image:
                'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=200',
            badge: '🏠',
          ),
          _buildAvatar(
            left: 52,
            image:
                'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=200',
            badge: '❤️',
          ),
          _buildAvatar(
            left: 86,
            image:
                'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=200',
            badge: '👍',
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar({
    required double left,
    required String image,
    required String badge,
  }) {
    return Positioned(
      left: left,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: -4,
            right: -4,
            child: Container(
              width: 18,
              height: 18,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: Text(
                badge,
                style: const TextStyle(fontSize: 9),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
