import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:vascomm_test/feature/dashboard_page.dart';
import 'package:vascomm_test/feature/registration_page.dart';
import 'package:vascomm_test/utility/utility.dart';
import 'package:vascomm_test/widget/color_palette.dart';
import 'package:vascomm_test/widget/component/form_field_custom.dart';
import 'package:vascomm_test/widget/component/primary_button.dart';
import 'package:vascomm_test/widget/font_style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 8.0, right: 6.0),
            // color: Colors.black,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1.1,
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
                const SizedBox(height: 16),
                _buildLoginForm(),
                const SizedBox(height: 40),
                PrimaryButton(
                  label: 'Login',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DashboardPage()));
                  },
                ),
                const SizedBox(height: 32),
                Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: 'Belum punya akun? ',
                            style: FontCustomStyle
                                .fontProximaNovaLightGreyRegular14),
                        TextSpan(
                          text: 'Daftar sekarang',
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

  Widget _buildLoginForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormFieldCustom(
          controller: _emailController,
          label: 'Email',
          hintText: 'Masukkan email anda',
        ),
        const SizedBox(height: 20),
        FormFieldCustom(
          controller: _passwordController,
          label: 'Password',
          hintText: 'Masukkan password anda',
          isObscure: true,
          isShowForgotPassword: true,
        ),
      ],
    );
  }
}
