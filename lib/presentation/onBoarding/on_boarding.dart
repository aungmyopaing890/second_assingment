import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';
import 'package:second_assingment/presentation/login/login.dart';
import 'package:second_assingment/presentation/resources/color_manager.dart';
import 'package:second_assingment/presentation/resources/route_manager.dart';
import 'package:second_assingment/presentation/resources/values_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late int index;

  final onboardingPagesList = [
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: ColorManager.primary,
          border: Border.all(
            width: 0.0,
            color: ColorManager.primary,
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 45.0,
                  vertical: 90.0,
                ),
                child: Image.asset('assets/images/logo.png',
                    color: ColorManager.white),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: AppPadding.p45),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'First Onboarding page',
                    style: pageTitleStyle,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppPadding.p45, vertical: AppPadding.p10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                    style: pageInfoStyle,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppPadding.p45, vertical: AppPadding.p10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                    style: pageInfoStyle,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: ColorManager.primary,
          border: Border.all(
            width: 0.0,
            color: ColorManager.primary,
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p45,
                  vertical: AppPadding.p90,
                ),
                child: Image.asset('assets/images/logo.png',
                    color: ColorManager.white),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: AppPadding.p45),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Second Onboarding page',
                    style: pageTitleStyle,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppPadding.p45, vertical: AppPadding.p10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                    style: pageInfoStyle,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppPadding.p45, vertical: AppPadding.p10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                    style: pageInfoStyle,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: ColorManager.primary,
          border: Border.all(
            width: 0.0,
            color: ColorManager.primary,
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p45,
                  vertical: AppPadding.p90,
                ),
                child: Image.asset('assets/images/logo.png',
                    color: ColorManager.white),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: AppPadding.p45),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Third On Boarding Page',
                    style: pageTitleStyle,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppPadding.p45, vertical: AppPadding.p10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                    style: pageInfoStyle,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppPadding.p45, vertical: AppPadding.p10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                    style: pageInfoStyle,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  ];

  static const width = 100.0;
  @override
  void initState() {
    super.initState();
    index = 0;
  }

  SizedBox _skipButton({void Function(int)? setIndex}) {
    return SizedBox(
      width: width,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Material(
          borderRadius: defaultSkipButtonBorderRadius,
          color: ColorManager.black,
          child: InkWell(
            borderRadius: defaultSkipButtonBorderRadius,
            onTap: () {
              if (setIndex != null) {
                index = 2;
                setIndex(2);
              }
            },
            child: const Padding(
              padding: defaultSkipButtonPadding,
              child: Text(
                'Skip',
                style: defaultSkipButtonTextStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Route loginRoute = MaterialPageRoute(builder: (context) => const LoginView());
  SizedBox get _signinButton {
    return SizedBox(
      width: width,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Material(
          borderRadius: defaultProceedButtonBorderRadius,
          color: ColorManager.black,
          child: InkWell(
            borderRadius: defaultProceedButtonBorderRadius,
            onTap: () {
              Navigator.pushReplacementNamed(context, Routes.loginRoute);
            },
            child: const Padding(
              padding: defaultProceedButtonPadding,
              child: Text(
                'Signin',
                style: defaultProceedButtonTextStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Onboarding(
          pages: onboardingPagesList,
          onPageChange: (int pageIndex) {
            index = pageIndex;
          },
          footerBuilder: (context, dragDistance, pagesLength, setIndex) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: ColorManager.primary,
                border: Border.all(
                  width: 0.0,
                  color: ColorManager.primary,
                ),
              ),
              child: ColoredBox(
                color: ColorManager.primary,
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.p45),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      index != pagesLength - 1
                          ? _skipButton(setIndex: setIndex)
                          : _signinButton,
                      Padding(
                        padding: const EdgeInsets.only(right: AppPadding.p45),
                        child: CustomIndicator(
                          netDragPercent: dragDistance,
                          pagesLength: pagesLength,
                          indicator: Indicator(
                            indicatorDesign: IndicatorDesign.polygon(
                              polygonDesign: PolygonDesign(
                                polygon: DesignType.polygon_arrow,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
