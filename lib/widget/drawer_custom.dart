import 'package:flutter/material.dart';
import 'package:vascomm_test/feature/profile_page.dart';
import 'package:vascomm_test/utility/utility.dart';
import 'package:vascomm_test/widget/font_style.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      key: key,
      child: Column(
        children: [
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 2,
                  child: SizedBox(
                    child: Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.2),
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    Utility.imagePath('img_profile'),
                                    scale: 2 / 1,
                                    width: 40,
                                    height: 40,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Flexible(
                                child: SizedBox(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                                text: 'Angga',
                                                style: FontCustomStyle
                                                    .fontGilroyDarkBlueRegular14),
                                            TextSpan(
                                                text: 'Praja',
                                                style: FontCustomStyle
                                                    .fontGilroyDarkBlueBold14),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        'Membership BBLK',
                                        style: FontCustomStyle
                                            .fontProximaNovaDarkBlueRegular11,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        ListTile(
                          title: Text(
                            'Profile Saya',
                            style: FontCustomStyle
                                .fontProximaNovaDarkGreyRegular12,
                          ),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ProfilePage()),
                            );
                          },
                        ),
                        ListTile(
                          title: Text(
                            'Pengaturan',
                            style: FontCustomStyle
                                .fontProximaNovaDarkGreyRegular12,
                          ),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {},
                        ),
                        const SizedBox(height: 40),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.35,
                          height: 35,
                          decoration: BoxDecoration(
                            color: Color(0xFFEB0004),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Center(
                            child: Text('Logout',
                                style: FontCustomStyle.fontGilroyWhiteBold12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(child: Container()),
              ],
            ),
          ),
          const SizedBox(height: 70),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 4,
                  child: Text(
                    'Ikuti kami di ',
                    style: FontCustomStyle.fontGilroyDarkBlueSemiBold16,
                  ),
                ),
                Flexible(
                  child: Image.asset(
                    Utility.iconPath('ic_facebook'),
                    scale: 4 / 1,
                  ),
                ),
                Flexible(
                  child: Image.asset(
                    Utility.iconPath('ic_instagram'),
                    scale: 4 / 1,
                  ),
                ),
                Flexible(
                  child: Image.asset(
                    Utility.iconPath('ic_twitter'),
                    scale: 4 / 1,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'FAQ',
                  style: FontCustomStyle.fontProximaNovaLightGreySemiBold16,
                ),
                Text(
                  'Terms and Conditions',
                  style: FontCustomStyle.fontProximaNovaLightGreySemiBold16,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
