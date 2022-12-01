import 'package:flutter/material.dart';
import 'package:vascomm_test/utility/utility.dart';
import 'package:vascomm_test/widget/color_palette.dart';
import 'package:vascomm_test/widget/component/form_field_custom.dart';
import 'package:vascomm_test/widget/component/primary_button.dart';
import 'package:vascomm_test/widget/drawer_custom.dart';
import 'package:vascomm_test/widget/font_style.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _namaDepanController =
      TextEditingController(text: 'Jhon');
  final TextEditingController _namaBelakangController =
      TextEditingController(text: 'Doe');
  final TextEditingController _namaEmailController = TextEditingController();
  final TextEditingController _noTelpController = TextEditingController();
  final TextEditingController _noKtpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        endDrawer: const DrawerCustom(),
        backgroundColor: Color(0xFFF5F8FA),
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Palette.darkBlue),
          elevation: 0.0,
          leading: IconButton(
            onPressed: () => scaffoldKey.currentState?.openEndDrawer(),
            icon: Image.asset(
              Utility.iconPath('ic_drawer'),
              scale: 4 / 1,
            ),
          ),
          actions: [
            Image.asset(
              Utility.iconPath('ic_notification'),
              scale: 4 / 1,
            ),
            Image.asset(
              Utility.iconPath('ic_basket'),
              scale: 4 / 1,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      elevation: 16.0,
                      shadowColor: const Color(0xFFBEBEBE).withOpacity(0.3),
                      child: Container(
                        height: 40,
                        padding: const EdgeInsets.all(4),
                        width: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Flexible(
                              flex: 2,
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0xFF00D9D5)),
                                child: Center(
                                  child: Text(
                                    'Profile',
                                    style: FontCustomStyle
                                        .fontGilroyDarkBlueBold14,
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 2,
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white),
                                child: Center(
                                  child: Text(
                                    'Pengaturan',
                                    style: FontCustomStyle
                                        .fontGilroyDarkBlueBold14,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            elevation: 20.0,
                            shadowColor:
                                const Color(0xFFBEBEBE).withOpacity(0.5),
                            child: SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 200.0),
                                  Text(
                                    'Pilih data yang ingin ditampilkan',
                                    style: FontCustomStyle
                                        .fontGilroyDarkBlueSemiBold16,
                                  ),
                                  const SizedBox(height: 15.0),
                                  SizedBox(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 36,
                                                height: 36,
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFF00D9D5),
                                                  borderRadius:
                                                      BorderRadius.circular(18),
                                                ),
                                                child: Center(
                                                  child: Image.asset(
                                                    Utility.iconPath('ic_user'),
                                                    scale: 4 / 1,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              SizedBox(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Data Diri',
                                                      style: FontCustomStyle
                                                          .fontGilroyDarkBlueBold14,
                                                    ),
                                                    Text(
                                                      'Data diri anda sesuai KTP',
                                                      style: FontCustomStyle
                                                          .fontProximaNovaDarkBlueRegular11,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 36,
                                          height: 36,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFEBEDF7),
                                            borderRadius:
                                                BorderRadius.circular(18),
                                          ),
                                          child: Center(
                                            child: Image.asset(
                                              Utility.iconPath('ic_location'),
                                              scale: 4 / 1,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 40),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Column(
                                      children: [
                                        FormFieldCustom(
                                          controller: _namaDepanController,
                                          label: 'Nama Depan',
                                        ),
                                        const SizedBox(height: 20),
                                        FormFieldCustom(
                                          controller: _namaBelakangController,
                                          label: 'Nama Belakang',
                                        ),
                                        const SizedBox(height: 20),
                                        FormFieldCustom(
                                          controller: _namaEmailController,
                                          label: 'Email',
                                          hintText: 'Masukkan email anda',
                                        ),
                                        const SizedBox(height: 20),
                                        FormFieldCustom(
                                          controller: _noTelpController,
                                          label: 'No. Telepon',
                                          hintText: 'Masukkan no telepon anda',
                                        ),
                                        const SizedBox(height: 20),
                                        FormFieldCustom(
                                          controller: _noKtpController,
                                          label: 'No. KTP',
                                          hintText: 'Masukkan no KTP anda',
                                        ),
                                        const SizedBox(height: 20),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          Utility.iconPath('ic_information'),
                                          scale: 4 / 1,
                                        ),
                                        const SizedBox(width: 8),
                                        Flexible(
                                          child: Text(
                                            'Pastikan profile anda terisi dengan benar, data pribadi anda terjamin keamanannya',
                                            style: FontCustomStyle
                                                .fontProximaNovaDarkGreyRegular12,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Card(
                                        elevation: 16.0,
                                        shadowColor: const Color(0xFFBEBEBE),
                                        color: Palette.darkBlue,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 40,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(),
                                              const Flexible(
                                                flex: 1,
                                                child: Text(
                                                  'Simpan Profile',
                                                  style: TextStyle(
                                                    fontFamily: FontCustomStyle
                                                        .fontFamilyGilroy,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                              Flexible(
                                                flex: 1,
                                                child: Image.asset(
                                                  Utility.iconPath('ic_save'),
                                                  scale: 3 / 1,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: -60,
                            child: Image.asset(
                              Utility.imagePath('img_banner_profile'),
                              scale: 2.6 / 1,
                              width: MediaQuery.of(context).size.width * 0.92,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.only(left: 16, top: 42),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                    text: 'Angga',
                                                    style: FontCustomStyle
                                                        .fontGilroyWhiteBold18),
                                                TextSpan(
                                                    text: ' Praja',
                                                    style: FontCustomStyle
                                                        .fontGilroyWhiteSemiBold18),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            'Membership BBLK',
                                            style: FontCustomStyle
                                                .fontGilroyWhiteBold12,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Image.asset(
                Utility.imagePath('img_banner_bottom'),
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
