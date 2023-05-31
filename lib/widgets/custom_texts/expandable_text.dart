
import 'package:flutter/material.dart';
import 'package:food_app/widgets/custom_texts/small_text.dart';

import '../../utils/app_color/app_colors.dart';
import '../../utils/dimensions/dimensions.dart';


class ExpandableText extends StatefulWidget {
  const ExpandableText({
    Key? key,
    required this.title
    }) : super(key: key);

    final String title;

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firsHalf;
  late String secondHalf;

  bool hiddenText = true;

  double textHeight = Dimensions.screenHeight/5.63;

  @override
  void initState() {

    super.initState();
    if (widget.title.length>textHeight) {
      firsHalf = widget.title.substring(0,textHeight.toInt());
      secondHalf = widget.title.substring(textHeight.toInt()+1,widget.title.length);
    }else{
      firsHalf = widget.title;
      secondHalf = "";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty?SmallText(
        title: firsHalf,
        fontSize: Dimensions.font16,
        color: AppColor.paraColor,
        ):Column(
        children: [
          SmallText(
          title: hiddenText?(firsHalf+"..."):(firsHalf+secondHalf),
          fontSize: Dimensions.font16,
          color: AppColor.paraColor,
          height: 2.5,
          ),
          InkWell(
            onTap: (){
              setState(() {
                hiddenText =!hiddenText;
              });
            },
            child: Row(
              children: [
                SmallText(
                title:hiddenText? "Show more":"Show less",
                color: AppColor.mainColor,
                fontSize: Dimensions.font16,
                ),
                Icon(
                 hiddenText? Icons.arrow_drop_down:Icons.arrow_drop_up,color: AppColor.mainColor
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}