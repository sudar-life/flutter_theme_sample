import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_theme_sample/src/components/app_font.dart';
import 'package:flutter_theme_sample/src/components/btn.dart';
import 'package:flutter_theme_sample/src/components/theme_drawer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ThemeDrawer(),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _HeaderWidget(),
              SizedBox(height: 40),
              _Description(),
              SizedBox(height: 40),
              _AgreementBox(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
            left: 25,
            right: 25,
            bottom: 25 + MediaQuery.of(context).padding.bottom),
        child: SizedBox(
          height: 60,
          child: Btn(
            onTap: () {},
            text: '시작하기',
          ),
        ),
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.65,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: SvgPicture.asset(
              'assets/svg/icon_drawer.svg',
              colorFilter: ColorFilter.mode(
                  Theme.of(context).iconTheme.color!, BlendMode.srcIn),
            ),
          ),
          Center(child: Image.asset('assets/images/card_image.png')),
        ],
      ),
    );
  }
}

class _Description extends StatelessWidget {
  const _Description({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppFont(
          '원활한 재무 관리를 위한',
          size: 28,
          fontWeight: FontWeight.w100,
          letterSpacing: -0.5,
          lineHeight: 1.2,
        ),
        AppFont(
          '모바일 뱅킹',
          size: 32,
          fontWeight: FontWeight.bold,
          letterSpacing: -0.5,
          lineHeight: 1.2,
        ),
        SizedBox(height: 20),
        AppFont(
          '재무 워크플로를 간소화하기 위해 예산 책정 앱 및 비용 추적기와 같은 인기 있는 재무 관리 도구 및 서비스와 원활하게 통합됩니다',
          size: 14,
          letterSpacing: -0.5,
          lineHeight: 1.2,
        ),
      ],
    );
  }
}

class _AgreementBox extends StatefulWidget {
  const _AgreementBox({super.key});

  @override
  State<_AgreementBox> createState() => _AgreementBoxState();
}

class _AgreementBoxState extends State<_AgreementBox> {
  bool isCheckedTermsOfUse = false;
  bool isCheckedPrivacyPolicy = false;
  bool isCheckedMarketing = false;

  Widget agreementSingleWidget({
    required String name,
    required bool isChecked,
    required Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: Row(
          children: [
            SvgPicture.asset(
              isChecked
                  ? 'assets/svg/icon_radio_on.svg'
                  : 'assets/svg/icon_radio_off.svg',
              colorFilter: ColorFilter.mode(
                  Theme.of(context).textTheme.labelMedium!.color!,
                  BlendMode.srcIn),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: AppFont(
                name,
                color: isChecked
                    ? Theme.of(context).textTheme.labelMedium!.color
                    : const Color(0xff717171),
                size: 20,
              ),
            ),
            SvgPicture.asset('assets/svg/icon_back.svg'),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).cardTheme.color,
      ),
      child: Column(
        children: [
          agreementSingleWidget(
            name: '이용약관',
            isChecked: isCheckedTermsOfUse,
            onTap: () {
              setState(() {
                isCheckedTermsOfUse = !isCheckedTermsOfUse;
              });
            },
          ),
          const Divider(height: 1),
          agreementSingleWidget(
            name: '개인정보 처리방침',
            isChecked: isCheckedPrivacyPolicy,
            onTap: () {
              setState(() {
                isCheckedPrivacyPolicy = !isCheckedPrivacyPolicy;
              });
            },
          ),
          const Divider(height: 1),
          agreementSingleWidget(
            name: '마케팅정보 수신 동의',
            isChecked: isCheckedMarketing,
            onTap: () {
              setState(() {
                isCheckedMarketing = !isCheckedMarketing;
              });
            },
          ),
        ],
      ),
    );
  }
}
