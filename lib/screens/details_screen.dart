import 'package:covid19_info_ui/constants.dart';
import 'package:covid19_info_ui/widgets/weekly_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildDetailsAppBar(context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 21),
                    blurRadius: 55,
                    color: Colors.black.withOpacity(0.1),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTitleWithMoreIcon(),
                  SizedBox(
                    height: 15.0,
                  ),
                  buildCaseNumber(context),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    'From Health Center',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                      color: kTextMediumColor,
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  WeeklyChart(),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildInfoTextWithPercentage(title: 'From last Week', percentage: '6.43'),
                      buildInfoTextWithPercentage(title: 'Recovery Rate', percentage: '9.43'),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 21),
                    blurRadius: 55,
                    color: Colors.black.withOpacity(0.1),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text(
                      'Global Map',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                      SvgPicture.asset('assets/icons/more.svg'),],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  SvgPicture.asset('assets/icons/map.svg'),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  RichText buildInfoTextWithPercentage({String title, String percentage}) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$percentage% \n',
            style: TextStyle(
              fontSize: 20.0,
              color: kPrimaryColor,
            ),
          ),
          TextSpan(
              text: title,
              style: TextStyle(
                color: kTextMediumColor,
                height: 1.5,
              )),
        ],
      ),
    );
  }

  Row buildCaseNumber(BuildContext context) {
    return Row(
      children: [
        Text(
          '576 ',
          style: Theme.of(context)
              .textTheme
              .display3
              .copyWith(color: kPrimaryColor, height: 1.2),
        ),
        Text(
          '5.7%',
          style: TextStyle(
            color: kPrimaryColor,
          ),
        ),
        SvgPicture.asset('assets/icons/increase.svg'),
      ],
    );
  }

  Row buildTitleWithMoreIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'New Cases',
          style: TextStyle(
            color: kTextColor,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
        SvgPicture.asset('assets/icons/more.svg'),
      ],
    );
  }

  AppBar buildDetailsAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: kBackgroundColor,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: kPrimaryColor,
        ),
        onPressed: () => Navigator.pop(context),
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
