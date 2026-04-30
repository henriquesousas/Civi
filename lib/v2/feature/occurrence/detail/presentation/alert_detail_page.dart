import 'package:deehelp/v2/feature/occurrence/detail/presentation/widgets/floating_chat_bar.dart';
import 'package:deehelp/v2/feature/occurrence/detail/presentation/widgets/section_distance.dart';
import 'package:deehelp/v2/feature/occurrence/detail/presentation/widgets/section_detail.dart';
import 'package:deehelp/v2/feature/occurrence/detail/presentation/widgets/section_media.dart';
import 'package:deehelp/v2/feature/occurrence/detail/presentation/widgets/section_summary.dart';
import 'package:flutter/material.dart';

class AlertDetail extends StatefulWidget {
  const AlertDetail({super.key});

  @override
  State<AlertDetail> createState() => _AlertDetailState();
}

class _AlertDetailState extends State<AlertDetail> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SectionDistance(),
                SectionDetail(),
                SectionMedia(
                  images: [
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrWiHzTRTryiZ_rqe_ntQSQZiG1ZPlttn1xQ&s',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7LjPNOGgJyuAhhqsTB_VOTSoFGB3Nsn3frg&s',
                    'https://www.estadao.com.br/resizer/v2/SQSY3VV5NFIU3MI5UFZMKHBBLA.jpg?quality=80&auth=091167d4400fea315e8beb4b23310262935671b2b87a47270ab8a659ebb40afb&width=380',
                  ],
                ),
                SectionSummary(),
                SizedBox(height: 120),
              ],
            ),
          ),
          FloatingChatBar(),
        ],
      ),
    );
  }
}
