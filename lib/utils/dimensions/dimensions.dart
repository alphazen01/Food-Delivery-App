import 'package:get/get.dart';

class Dimensions{
 
 static double screenHeight = Get.context!.height;
 static double screenWidth = Get.context!.width;
//aikhane screenHeigth ta build method er vitore print("screen"+MediaQuery.of(context).size.height.toString()); aivabe ber kore
//container er heigt die divide korle 3.10 paowa jabe
static double pageView = screenHeight/2.13;
static double pageViewContainer = screenHeight/3.10;
static double pageViewTextContainer = screenHeight/5.69;

//dynamic height padding and mergin
static double height10 = screenHeight/68.3;
static double height15 = screenHeight/45.53;
static double height20 = screenHeight/34.15;
static double height30 = screenHeight/22.77;
static double height45 = screenHeight/15.18;
//dynamic width padding and mergin
static double width10 = screenHeight/68.3;
static double width15 = screenHeight/45.53;
static double width20 = screenHeight/34.15;
static double width30 = screenHeight/22.77;
static double width45 = screenHeight/15.18;


//font size
static double font16 = screenHeight/42.69;
static double font20 = screenHeight/34.15;
static double font26 = screenHeight/26.27;

//radius
static double radius15 = screenHeight/45.53;
static double radius20 = screenHeight/34.15;
static double radius30 = screenHeight/22.77;

//iconSize

static double iconSize24 = screenHeight/28.45;
static double iconSize16 = screenHeight/42.69;


//list view size

static double listViewImgSize = screenWidth/3.43;
static double listViewTextContainerSize = screenWidth/4.11;


//popular food
static double popularFoodImageSize = screenWidth/1.95;


//bottom height
static double bottomHeightBar = screenHeight/5.69;
}