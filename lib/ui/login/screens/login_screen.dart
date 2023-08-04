import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:rick_and_morty_show/common/utils/global_widgets/global_button.dart';
import 'package:rick_and_morty_show/common/utils/global_widgets/global_input.dart';
import 'package:rick_and_morty_show/ui/login/views/animate_image.dart';
import 'package:rick_and_morty_show/ui/login/views/animate_inputs.dart';

import '../../../common/utils/constants.dart';
import '../../../common/utils/global_widgets/loading_view.dart';

final TextEditingController _controllerUserName = TextEditingController();
final TextEditingController _controllerPassword = TextEditingController();
bool validInput = false;

class LoginScreen extends StatefulWidget {
  static String routeName = "/login";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    loadAudio();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.sizeOf(context).width;
    final sizeHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: WillPopScope(
        onWillPop: _onWillScope,
        child: Container(
          width: sizeWidth,
          height: sizeHeight,
          color: Constants.primaryWhite,
          child: Container(
            margin: Constants.marginContainer16,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const AnimatedImage(
                      imagePath: 'assets/images/splash-rick-and-morty2.png'),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Username: ",
                        style: TextStyle(color: Constants.primaryGreenStrong),
                      ),
                    ],
                  ),
                  AnimateInputs(
                    textFormField: GlobalInput(
                      inputController: _controllerUserName,
                      isSearch: false,
                      validator: validateInput,
                    ),
                  ),
                  SizedBox(
                    height: sizeHeight * 0.03,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Password: ",
                        style: TextStyle(color: Constants.primaryGreenStrong),
                      ),
                    ],
                  ),
                  AnimateInputs(
                    textFormField: GlobalInput(
                      inputController: _controllerPassword,
                      isSearch: false,
                      validator: validateInput,
                    ),
                  ),
                  SizedBox(
                    height: sizeHeight * 0.05,
                  ),
                  GlobalButton(
                      height: Constants.heightButton,
                      label: "Log in",
                      labelColor: validInput
                          ? Constants.secondaryWhite
                          : Constants.thirdGrey,
                      backgroundColor: validInput
                          ? Constants.primaryGreenStrong
                          : Constants.secondaryWhite,
                      action: () {
                        if (validInput &&
                            _controllerUserName.text ==
                                dotenv.env["USERNAME"] &&
                            _controllerPassword.text ==
                                dotenv.env["PASSWORD"]) {
                          stopAudio();
                          WidgetsBinding.instance
                              .addPostFrameCallback((_) async {
                            await LoadingView(context).show();
                          });
                          Future.delayed(const Duration(seconds: 3), () {
                            setState(() {
                              LoadingView(context).dismiss();
                              Navigator.pushNamed(context, "/home");
                            });
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Constants.primaryGreenStrong,
                              content: Text(
                                "Please check your user name or password correctly.",
                                style: TextStyle(
                                  color: Constants.secondaryWhite,
                                ),
                              ),
                            ),
                          );
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future loadAudio() async {
    return await player
        .setSource(AssetSource("sounds/opening-rick-and-morty.mp3"))
        .then((value) {
      player.play(AssetSource("sounds/opening-rick-and-morty.mp3"));
    });
  }

  Future stopAudio() async {
    return await player.stop();
  }

  void validateInput(String valueInput) {
    setState(() {
      if (_controllerUserName.text.isNotEmpty &&
          _controllerPassword.text.isNotEmpty) {
        validInput = true;
      } else {
        validInput = false;
      }
    });
  }

  Future<bool> _onWillScope() async {
    return false;
  }
}
