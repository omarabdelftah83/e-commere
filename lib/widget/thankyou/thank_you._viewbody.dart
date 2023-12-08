
import 'package:chats/widget/thankyou/thank_you_card.dart';
import 'package:flutter/material.dart';

import 'custom_check_icon.dart';
import 'custom_dashed_line.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 35),
        child: Container(
          height: size.height*.99 ,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                const ThankYouCard(),
                ////line ___///
                Positioned(
                  bottom: MediaQuery.sizeOf(context).height * .2 + 20,
                  left: 20 + 8,
                  right: 20 + 8,
                  child: const CustomDashedLine(),
                ),
                //circle left..///
                Positioned(
                    left: -20,
                    bottom: MediaQuery.sizeOf(context).height * .2,
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                    )),
                //circle right..///
                Positioned(
                    right: -20,
                    bottom: MediaQuery.sizeOf(context).height * .2,
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                    )),
                 //circle avtar
                 const Positioned(
                  top: -50,
                  left: 0,
                  right: 0,
                  child: CircleAvatarIcon(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
