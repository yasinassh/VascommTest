import 'package:flutter/material.dart';
import 'package:vascomm_test/utility/utility.dart';
import 'package:vascomm_test/widget/color_palette.dart';
import 'package:vascomm_test/widget/component/primary_button.dart';
import 'package:vascomm_test/widget/drawer_custom.dart';
import 'package:vascomm_test/widget/font_style.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<ChipsClass> listChips = [
    ChipsClass(label: 'All Product', isClicked: true),
    ChipsClass(label: 'Layanan Kesehatan', isClicked: false),
    ChipsClass(label: 'Alat Kesehatan', isClicked: false),
  ];

  List<TipePelayanan> listTipePelayanan = const [
    TipePelayanan(
        label: 'PCR Swab Test (Drive Thru) Hasil 1 Hari Kerja',
        price: 'Rp. 1.400.000',
        location: 'Lenmarc Surabaya',
        locationAddress: 'Dukuh Pakis, Surabaya',
        imagePath: 'img_place_1'),
    TipePelayanan(
        label: 'PCR Swab Test (Drive Thru) Hasil 1 Hari Kerja',
        price: 'Rp. 1.400.000',
        location: 'Lenmarc Surabaya',
        locationAddress: 'Dukuh Pakis, Surabaya',
        imagePath: 'img_place_2'),
  ];

  List<bool> listToggle = [true, false];

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        endDrawer: DrawerCustom(),
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Palette.darkBlue),
          elevation: 0.0,
          leading: IconButton(
            onPressed: () => scaffoldKey.currentState?.openEndDrawer(),
            icon: Image.asset(
              Utility.iconPath('ic_drawer'),
              scale: 4/1,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    _buildMainCard(),
                    const SizedBox(height: 46),
                    _buildSimpleCard(
                      label: 'Layanan Khusus',
                      description: 'Tes Covid 19, Cegah Corona Sedini Mungkin',
                      buttonText: 'Daftar Test',
                      imagePath: 'img_vaccine',
                      isLeft: false,
                    ),
                    const SizedBox(height: 46),
                    _buildSimpleCard(
                        label: 'Track Pemeriksaan',
                        description:
                            'Kamu dapat mengecek progress pemeriksaanmu disini',
                        buttonText: 'Daftar Test',
                        imagePath: 'img_magnifyng_glass',
                        isLeft: true,
                        top: -10,
                        scale: 2.5 / 1),
                    const SizedBox(height: 20),
                    _buildSearchPage(),
                    const SizedBox(height: 20),
                    _buildChips(),
                    const SizedBox(height: 20),
                    _buildProduct(),
                    const SizedBox(height: 40),
                    _buildTipePelayanan(),
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

  Widget _buildMainCard() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            elevation: 20.0,
            shadowColor: const Color(0xFFBEBEBE).withOpacity(0.5),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.18,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Utility.imagePath('img_mask_card')),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: 'Solusi, ',
                            style: FontCustomStyle.fontGilroyDarkBlueRegular18),
                        TextSpan(
                            text: 'Kesehatan Anda',
                            style: FontCustomStyle.fontGilroyDarkBlueBold18),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      'Update informasi seputar kesehatan semua bisa disini !',
                      style: FontCustomStyle.fontProximaNovaLightGreyRegular12,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        flex: 1,
                        child: SizedBox(
                          width: 110,
                          height: 45,
                          child: PrimaryButton(
                            label: 'Selengkapnya',
                            fontSize: 12,
                            withArrow: false,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Image.asset(
                          Utility.imagePath('img_white_line'),
                          scale: 3 / 1,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: -40,
          right: 0,
          child: Image.asset(
            Utility.imagePath('img_calendar'),
            scale: 3.5 / 1,
          ),
        ),
      ],
    );
  }

  Widget _buildSimpleCard({
    String? label,
    String? description,
    String? buttonText,
    double top = -40,
    double scale = 3.5 / 1,
    required String imagePath,
    bool isLeft = false,
  }) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            elevation: 16.0,
            shadowColor: const Color(0xFFBEBEBE).withOpacity(0.3),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.18,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  isLeft == true ? Flexible(child: Container()) : Container(),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          label ?? '-',
                          style: FontCustomStyle.fontGilroyDarkBlueBold14,
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Text(
                            description ?? '-',
                            style: FontCustomStyle
                                .fontProximaNovaLightGreyRegular12,
                          ),
                        ),
                        const SizedBox(height: 4),
                        SizedBox(
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  buttonText ?? '-',
                                  style:
                                      FontCustomStyle.fontGilroyDarkBlueBold14,
                                ),
                              ),
                              Flexible(
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Palette.darkBlue,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: top,
          left: isLeft == true ? 20 : null,
          right: isLeft == true ? null : 20,
          child: Image.asset(
            Utility.imagePath(imagePath),
            scale: scale,
          ),
        ),
      ],
    );
  }

  Widget _buildSearchPage() {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 5,
              child: SizedBox(
                width: 40,
                height: 40,
                child: Image.asset(
                  Utility.iconPath('ic_filter'),
                  scale: 3 / 1,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Card(
              elevation: 16.0,
              shadowColor: const Color(0xFFBEBEBE).withOpacity(0.3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: ClipPath(
                clipper: ShapeBorderClipper(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: TextFormField(
                  cursorColor: const Color(0xFFBEBEBE),
                  style: FontCustomStyle.fontProximaNovaBlackRegular12,
                  decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle:
                          FontCustomStyle.fontProximaNovaDarkGreyRegular16,
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: const EdgeInsets.fromLTRB(
                        24.0,
                        13.0,
                        20.0,
                        13.0,
                      ),
                      border: InputBorder.none,
                      suffixIcon: Image.asset(
                        Utility.iconPath('ic_search'),
                        scale: 4 / 1,
                      )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChips() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 40,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listChips.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  listChips.forEach((element) => element.isClicked = false);
                  listChips[index].isClicked = true;
                });
              },
              child: _buildChipsItem(listChips[index].label ?? '-',
                  listChips[index].isClicked ?? false),
            );
          }),
    );
  }

  Widget _buildChipsItem(String label, bool isClicked) {
    return Card(
      elevation: 5.0,
      shadowColor: const Color(0xFFBEBEBE).withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        height: 40,
        decoration: BoxDecoration(
          color: isClicked == true ? Palette.darkBlue : Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: Text(
            label,
            style: isClicked == true
                ? FontCustomStyle.fontGilroyWhiteBold12
                : FontCustomStyle.fontGilroyDarkBlueBold12,
          ),
        ),
      ),
    );
  }

  Widget _buildProduct() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.28,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (context, index) {
          return _buildProductItem();
        },
      ),
    );
  }

  Widget _buildProductItem() {
    return Card(
      elevation: 16.0,
      shadowColor: const Color(0xFFBEBEBE).withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        width: MediaQuery.of(context).size.width * 0.45,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 2,
                    child: Image.asset(
                      Utility.imagePath('img_lab'),
                      scale: 3 / 1,
                    ),
                  ),
                  Flexible(
                    child: SizedBox(
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Text(
                            '5',
                            style: FontCustomStyle
                                .fontProximaNovaLightGreySemiBold16,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Suntik Steril',
              style: FontCustomStyle.fontGilroyDarkBlueBold14,
            ),
            const SizedBox(height: 8),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      'Rp. 10.000',
                      style: FontCustomStyle.fontGilroyOrangeSemiBold12,
                    ),
                  ),
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      decoration: const BoxDecoration(
                          color: Color(0xFFB3FFCB),
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      child: const Center(
                        child: Text(
                          'Ready Stock',
                          style: TextStyle(
                            fontFamily: FontCustomStyle.fontFamilyProximaNova,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTipePelayanan() {
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Pilih Tipe Pelayanan Kesehatan Anda',
                style: FontCustomStyle.fontGilroyDarkBlueSemiBold16,
              ),
            ),
            const SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 16.0,
              shadowColor: const Color(0xFFBEBEBE).withOpacity(0.3),
              child: Container(
                height: 40,
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Flexible(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            listToggle[0] = true;
                            listToggle[1] = false;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: listToggle[0] == true
                                  ? const Color(0xFF00D9D5)
                                  : Colors.white),
                          child: Center(
                            child: Text(
                              'Satuan',
                              style: FontCustomStyle.fontGilroyDarkBlueBold14,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            listToggle[0] = false;
                            listToggle[1] = true;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: listToggle[1] == true
                                  ? const Color(0xFF00D9D5)
                                  : Colors.white),
                          child: Center(
                            child: Text(
                              'Paket Pemeriksaan',
                              style: FontCustomStyle.fontGilroyDarkBlueBold14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildLayanan(),
          ],
        ),
      ),
    );
  }

  Widget _buildLayanan() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.55,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: listTipePelayanan.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: _buildLayananItem(
              imagePath: listTipePelayanan[index].imagePath ?? '',
              label: listTipePelayanan[index].label ?? '',
              location: listTipePelayanan[index].location ?? '',
              locationAddress: listTipePelayanan[index].locationAddress ?? '',
              price: listTipePelayanan[index].price ?? '',
            ),
          );
        },
      ),
    );
  }

  Widget _buildLayananItem({
    required String label,
    required String price,
    required String location,
    required String locationAddress,
    required String imagePath,
  }) {
    return Card(
      elevation: 16.0,
      shadowColor: const Color(0xFFBEBEBE).withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.22,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: FontCustomStyle.fontGilroyDarkBlueSemiBold14,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Text(
                      price,
                      style: FontCustomStyle.fontGilroyOrangeSemiBold14,
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.015),
                    SizedBox(
                      child: Row(
                        children: [
                          Image.asset(
                            Utility.iconPath('ic_hospital'),
                            scale: 4 / 1,
                          ),
                          Text(
                            ' $location',
                            style: FontCustomStyle
                                .fontProximaNovaDarkBlueSemiBold14,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            Utility.iconPath('ic_location'),
                            scale: 4 / 1,
                          ),
                          Text(
                            ' $locationAddress',
                            style: FontCustomStyle
                                .fontProximaNovaLightGreyRegular14,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  Utility.imagePath(imagePath),
                  fit: BoxFit.cover,
                  scale: 3 / 1,
                  height: MediaQuery.of(context).size.height * 0.22,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChipsClass {
  final String? label;
  bool? isClicked;

  ChipsClass({this.label, this.isClicked});
}

class TipePelayanan {
  final String? label;
  final String? price;
  final String? location;
  final String? locationAddress;
  final String? imagePath;

  const TipePelayanan({
    this.label,
    this.price,
    this.location,
    this.locationAddress,
    this.imagePath,
  });
}
