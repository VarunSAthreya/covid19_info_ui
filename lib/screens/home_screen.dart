import 'package:covid19_info_ui/constants.dart';
import 'package:covid19_info_ui/widgets/info_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'details_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(0.05),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50.0),
                bottomRight: Radius.circular(50.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Wrap(
                spacing: 20.0,
                runSpacing: 20.0,
                children: [
                  InfoCard(
                    press: () {},
                    title: 'Confirmed Cases',
                    iconColor: Color(0xFFFF9c00),
                    effectedNum: 10169,
                  ),
                  InfoCard(
                    press: () {},
                    title: 'Total Deaths',
                    iconColor: Color(0xFFFF2055),
                    effectedNum: 175,
                  ),
                  InfoCard(
                    press: () {},
                    title: 'Total Recovered',
                    iconColor: Color(0xFF30E3C2),
                    effectedNum: 986,
                  ),
                  InfoCard(
                    press: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsScreen())),
                    title: 'New Cases',
                    iconColor: Color(0xFF3836D6),
                    effectedNum: 152,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Prevention',
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  buildPreventionCard(),
                  SizedBox(
                    height: 40.0,
                  ),
                  buildHelpCard(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row buildPreventionCard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PreventionCard(
          title: 'Hand Wash',
          svgSource: 'assets/icons/hand_wash.svg',
        ),
        PreventionCard(
          title: 'Use Masks',
          svgSource: 'assets/icons/use_mask.svg',
        ),
        PreventionCard(
          title: 'Clean Disinfect',
          svgSource: 'assets/icons/Clean_Disinfect.svg',
        ),
      ],
    );
  }

  Container buildHelpCard(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            //left side padding as 40% of total width
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.4,
              top: 20,
              right: 20,
            ),
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFF60BE93), Color(0xFF1B8059)]),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'Dial 108 for \nMedical Help\n',
                  style: Theme.of(context).textTheme.title.copyWith(
                        color: Colors.white,
                      ),
                ),
                TextSpan(
                  text: 'If any symptoms appear',
                  style: TextStyle(color: Colors.white.withOpacity(0.7)),
                ),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: SvgPicture.asset('assets/icons/nurse.svg'),
          ),
          Positioned(
            child: SvgPicture.asset('assets/icons/virus,svg'),
            top: 30,
            right: 10,
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor.withOpacity(0.05),
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset('assets/icons/menu.svg'),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset('assets/icons/search.svg'),
          onPressed: () {},
        ),
      ],
    );
  }
}

class PreventionCard extends StatelessWidget {
  final String title;
  final String svgSource;

  const PreventionCard({
    Key key,
    @required this.title,
    @required this.svgSource,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(svgSource),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText2.copyWith(
                color: kPrimaryColor,
              ),
        ),
      ],
    );
  }
}
