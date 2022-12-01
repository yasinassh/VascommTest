import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:vascomm_test/utility/utility.dart';
import 'package:vascomm_test/widget/component/form_field_custom.dart';
import 'package:vascomm_test/widget/component/primary_button.dart';
import 'package:vascomm_test/widget/font_style.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _namaDepanController = TextEditingController();
  final TextEditingController _namaBelakangController = TextEditingController();
  final TextEditingController _nomorKtpController = TextEditingController();
  final TextEditingController _nomorTeleponController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _konfirmasiPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 8.0, right: 6.0),
            // color: Colors.black,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'Hai, ',
                          style: FontCustomStyle.fontGilroyDarkBlueRegular28),
                      TextSpan(
                          text: 'Selamat Datang',
                          style: FontCustomStyle.fontGilroyDarkBlueBold28),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Silahkan login untuk melanjutkan',
                  style: FontCustomStyle.fontGilroyLightBlueSemiBold12,
                ),
                const SizedBox(height: 4),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Stack(
                    children: [
                      Positioned(
                        right: -40,
                        child: Image.asset(
                          Utility.imagePath('img_login_register'),
                          scale: 2.2 / 1,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                _buildRegistrationForm(),
                const SizedBox(height: 40),
                PrimaryButton(
                  label: 'Register',
                  onTap: () {},
                ),
                const SizedBox(height: 32),
                Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: 'Sudah punya akun? ',
                            style: FontCustomStyle
                                .fontProximaNovaLightGreyRegular14),
                        TextSpan(
                          text: 'Login sekarang',
                          style:
                              FontCustomStyle.fontProximaNovaDarkBlueSemiBold14,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RegistrationPage())),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        Utility.iconPath('ic_trademark'),
                        scale: 1.5 / 1,
                      ),
                      Text(
                        ' SILK. all right reserved.',
                        style:
                            FontCustomStyle.fontProximaNovaLightGreyRegular12,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRegistrationForm() {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: FormFieldCustom(
                  controller: _namaDepanController,
                  label: 'Nama Depan',
                  hintText: 'Masukkan nama depan anda',
                ),
              ),
              Flexible(
                flex: 1,
                child: FormFieldCustom(
                  controller: _namaBelakangController,
                  label: 'Nama Belakang',
                  hintText: 'Masukkan nama belakang anda',
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        FormFieldCustom(
          controller: _nomorKtpController,
          label: 'No. KTP',
          hintText: 'Masukkan No. KTP anda',
        ),
        const SizedBox(height: 20),
        FormFieldCustom(
          controller: _emailController,
          label: 'Email',
          hintText: 'Masukkan email anda',
        ),
        const SizedBox(height: 20),
        FormFieldCustom(
          controller: _nomorTeleponController,
          label: 'No. Telepon',
          hintText: 'Masukkan No. Telepon anda',
        ),
        const SizedBox(height: 20),
        FormFieldCustom(
          controller: _passwordController,
          label: 'Password',
          hintText: 'Masukkan password anda',
          isObscure: true,
        ),
        const SizedBox(height: 20),
        FormFieldCustom(
          controller: _konfirmasiPasswordController,
          label: 'Konfirmasi Password',
          hintText: 'Konfirmasi password anda',
          isObscure: true,
        ),
      ],
    );
  }
}
