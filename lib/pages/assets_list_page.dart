import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterhw/widgets/custom_card.dart';
import 'package:flutterhw/widgets/user_card.dart';

class AssetsListPage extends StatelessWidget {
  const AssetsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    void handleBack() {
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        leading:
            IconButton(icon: const Icon(Icons.west), onPressed: handleBack),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              CustomCard(
                  title: 'FAQ',
                  icon: Image.asset(
                    'assets/images/FAQ.png',
                    width: 25,
                    height: 26,
                  ),
                  onPress: () {}),
              CustomCard(
                  title: 'Contact Us',
                  icon: Image.asset(
                    'assets/images/Group.png',
                    width: 25,
                    height: 26,
                  ),
                  onPress: () {}),
              CustomCard(
                  title: 'Terms & Conditions',
                  icon: Image.asset(
                    'assets/images/terms.png',
                    width: 25,
                    height: 26,
                  ),
                  onPress: () {}),
              const Divider(),
              const UserCard(
                id: '@bahanh',
                name: 'Cached Image',
                useCachedImage: true,
              ),
              const UserCard(
                id: '@bahanh',
                name: 'Not Cached',
              ),
              const Divider(),
              CustomCard(
                  title: 'FAQ (SVG)',
                  icon: SvgPicture.asset(
                    'assets/svgs/FAQ.svg',
                    width: 25,
                    height: 25,
                    semanticsLabel: 'FAQ',
                  ),
                  onPress: () {}),
              CustomCard(
                  title: 'Contact Us (SVG)',
                  icon: SvgPicture.asset(
                    'assets/svgs/Contact.svg',
                    width: 25,
                    height: 25,
                    semanticsLabel: 'Contact',
                  ),
                  onPress: () {}),
              CustomCard(
                  title: 'Terms & Conditions (SVG)',
                  icon: SvgPicture.asset(
                    'assets/svgs/terms.svg',
                    width: 25,
                    height: 25,
                    semanticsLabel: 'Terms & Conditions',
                  ),
                  onPress: () {}),
            ],
          )),
    );
  }
}
