import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:iobm/Views/bottom_navigationbar.dart';
import 'package:iobm/Views/signup_screens/otp_screen.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart' as fb;
import 'package:iobm/Views/signup_screens/sign_up_boss/signup_search_screen.dart';
import 'package:iobm/Views/signup_screens/sign_up_iobm/iobm_signup_search_screen.dart';
import 'package:iobm/Views/signup_screens/sign_up_screen.dart';
import 'package:iobm/Views/signup_screens/sign_up_tle/sign_up_tle_screen.dart';

import 'package:iobm/Widgets/custom_widgets.dart';

import 'package:iobm/Widgets/widget_styles.dart';
import 'package:iobm/controllers/profile_controller.dart';
import 'package:iobm/helper_classes/ui_helper.dart';
import 'package:iobm/local_db/local_db.dart';
import 'package:iobm/models/error_entity.dart';

import 'package:iobm/networkcalls/api_calls.dart';

import 'package:iobm/networkcalls/response_models/login_entity_entity.dart';

import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_constants.dart';
import 'package:iobm/utils/app_images.dart';
import 'package:iobm/utils/device_data.dart';

import 'package:iobm/utils/strings.dart';
import 'package:linkedin_login/linkedin_login.dart';

import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:local_auth/local_auth.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'boss_forget_password.dart';

String? chapterId;
bool fromLogout = false;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> fKey = GlobalKey<FormState>();
  final ProfileController _controller = Get.put(ProfileController());
  Future<void>? _launched;
  bool showPass = true;
  String rEmail = '';
  String rPass = '';

  //biometric
  final LocalAuthentication auth = LocalAuthentication();

  bool? canAuthenticate;
  Future? fetchSupport;

  void bioMetCheck() async {
    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    canAuthenticate =
    (canAuthenticateWithBiometrics || await auth.isDeviceSupported());
    setState(() {});
  }

  bioMetricFunc() {
    bioMetCheck();
    Future.delayed(const Duration(milliseconds: 100), () {
      return bioMetCheck();
    });
    fromLogout
        ? null
        : Future.delayed(const Duration(milliseconds: 1000), () {
      if(rEmail.isNotEmpty && rPass.isNotEmpty) {
        return _authenticateWithBiometrics();
      }
    });

  }
  //biometric closed

  void toggle() {
    setState(
          () {
        showPass = !showPass;
      },
    );
  }

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  String? toLaunch = AppConstants.privacyUrl;

  bool? remember = false;

  void getData() async {
    print(fromLogout);
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    // _emailController.text = localStorage.getString('rEmail') ?? '';
    // _passwordController.text = localStorage.getString('rPass') ?? "";
    rEmail = localStorage.getString('fingerEmail') ?? '';
    rPass = localStorage.getString('fingerPass') ?? '';
    print(rEmail);
    print(rPass);
  }

  @override
  void initState() {

    getData();
    bioMetricFunc();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100.h,
                    ),
                    profileLogo(),
                    SizedBox(
                      height: 40.h,
                    ),

                    _form(),
                    SizedBox(
                      height: 20.h,
                    ),
                    rememberMe(),
                    SizedBox(
                      height: 20.h,
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomWidget.myButton(
                                isBorder: false,
                                name: AppConstants.signin,
                                // size: Size(110.w, 30.h),
                                onClicked: () {
                                  if (fKey.currentState!.validate()) {
                                    loginCall(
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                      name: "",
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                        canAuthenticate == true && canAuthenticate != null
                            ? Positioned(
                          right: 40.w,
                          child: GestureDetector(
                            onTap: () {
                              print('fingerprint called');
                              if(rEmail.isNotEmpty && rPass.isNotEmpty){
                                _authenticateWithBiometrics();
                              }
                              else{
                                print('No user found');
                                ScaffoldMessenger.of(context).showSnackBar(snackBarRed('User not remembered yet'));
                              }
                            },
                            child: SizedBox(
                              height: 45.w,
                              width: 45.w,
                              child: const ImageIcon(
                                AssetImage(
                                  AppImages.biometric,
                                ),
                                color: AppColor.blue,
                              ),
                            ),
                          ),
                        )
                            : const SizedBox(),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    // WidgetStyle.title(title: "Or continue with"),
                    Text(
                      'Or continue with',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(16),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 18.h,
                    ),

                    ///Social login Buttons Row

                    _mediaButtons(),
                    SizedBox(
                      height: 18.h,
                    ),

                    ///sign button text
                    _signup(),
                    SizedBox(
                      height: 18.h,
                    ),
                    _privacyPolicy(),
                    SizedBox(
                      height: 18.h,
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  profileLogo() {
    return Center(
      child: Column(
        children: [
          Image(
            image: const AssetImage(AppImages.alumniLogo),
            height: 53.h,
            width: 197.w,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            Strings.welcomeback,
            style: TextStyle(
                fontSize: ScreenUtil().setSp(22),
                color: AppColor.primaryColor,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _form() {
    return Form(
      key: fKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email*',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(16),
              color: AppColor.black,
            ),
          ),
          TextFormField(
            style: TextStyle(fontSize: 15.sp),
            cursorHeight: 15.h,
            textInputAction: TextInputAction.next,
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              return value!.isEmpty
                  ? 'Email is required'
                  : validateEmail(value) == 1
                  ? 'Invalid email'
                  : null;
            },
            decoration: WidgetStyle.emailTextFieldDecoration(),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Password*',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(16),
              color: AppColor.black,
            ),
            // GoogleFonts.poppins(
            //   color: AppColor.shadeegray,
            //   fontSize: ScreenUtil().setSp(16),
            // ),
          ),
          Stack(
            children: [
              TextFormField(
                style: TextStyle(fontSize: 15.sp),
                cursorHeight: 15.h,
                validator: (value) {
                  return value!.isEmpty ? 'Password is required' : null;
                },
                keyboardType: TextInputType.visiblePassword,
                controller: _passwordController,
                obscureText: showPass,
                obscuringCharacter: '*',
                decoration: WidgetStyle.passwordDecoration(),
              ),
              Positioned(
                right: 10,
                top: 5,
                child: GestureDetector(
                  onTap: toggle,
                  child: Icon(
                    showPass ? Icons.visibility_off : Icons.visibility,
                    // color: showPass ? AppColor.black26 : AppColor.red,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  rememberMe() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _checkbox(),
        //  WidgetStyle.title(title: ""),
        GestureDetector(
          onTap: () {
            if (AppConstants.appName == "BOSS") {
              Get.to(
                    () => const BossForgetPassScreen(),
              );
            } else {
              Get.to(
                    () => const OtpScreen(
                  check: 'forget',
                ),
              );
            }
          },
          child: Text(
            "Forgot Password?",
            style: WidgetStyle.underLineTextStyle(
              color: AppColor.black,
              fontSize: ScreenUtil().setSp(14),
            ),
          ),
        )
      ],
    );
  }

  Widget _checkbox() {
    return Row(
      children: [
        SizedBox(
          height: 20,
          width: 20,
          child: Checkbox(
              activeColor: AppColor.primaryColor,
              value: remember!,
              onChanged: (value) {
                setState(() {
                  remember = value!;
                });
              }),
        ),
        const SizedBox(width: 8),
        Text(
          'Remember Me',
          style: WidgetStyle.forgotTExtStyle(
            fontSize: ScreenUtil().setSp(14),
            color: AppColor.greyshade700,
          ),
        ),
      ],
    );
  }

  Widget _mediaButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (Platform.isAndroid)
          GestureDetector(
            onTap: () {
              _googleSingIn();
            },
            child: Image.asset(
              AppImages.googleicon,
              height: 27,
              width: 27,
            ),
            // child: SvgPicture.asset(
            //   AppImages.googleicon,
            //   // height: 25.h,
            //   // width: 25.w,
            // ),
          ),

        ///Apple login Button
        if (Platform.isIOS)
          GestureDetector(
            onTap: () {
              _appleSingIn();
            },
            child: SvgPicture.asset(
              AppImages.apple,
              height: 25.h,
              width: 25.w,
            ),
          ),
        const SizedBox(
          width: 10,
        ),

        ///FB login Button
        GestureDetector(
          onTap: () {
            _facebookSingIn();
          },
          child: Image.asset(AppImages.fbicon, height: 25, width: 25),
          // child: SvgPicture.asset(
          //   AppImages.fbicon,
          //   height: 25.h,
          //   width: 25.w,
          // ),
        ),
        // AppConstants.appName != 'TLE'
        //     ? Row(
        //         children: [
        //           const SizedBox(
        //             width: 10,
        //           ),
        //           GestureDetector(
        //             onTap: () {
        //               Navigator.push(
        //                 context,
        //                 MaterialPageRoute(
        //                   builder: (BuildContext context) => LinkedInUserWidget(
        //                     appBar: AppBar(
        //                       backgroundColor: AppColor.white,
        //                       elevation: 0,
        //                     ),
        //                     redirectUrl: AppConstants.linkedinUrl,
        //                     clientId: AppConstants.linkedInClientId,
        //                     clientSecret: AppConstants.linkedInClientSecret,
        //                     projection: const [
        //                       ProjectionParameters.id,
        //                       ProjectionParameters.localizedFirstName,
        //                       ProjectionParameters.localizedLastName,
        //                       ProjectionParameters.firstName,
        //                       ProjectionParameters.lastName,
        //                       ProjectionParameters.profilePicture,
        //                     ],
        //                     onError: (UserFailedAction e) {
        //                       print('Error: ${e.toString()}');
        //                       print('Error: ${e.stackTrace.toString()}');
        //                     },
        //                     onGetUserProfile:
        //                         (UserSucceededAction linkedInUser) {
        //                       loginCall(
        //                         loginWith: 'linkedin',
        //                         email: linkedInUser.user.email!.elements!.first
        //                                 .handleDeep!.emailAddress ??
        //                             '',
        //                         name:
        //                             "${linkedInUser.user.firstName!.localized!.label} ${linkedInUser.user.lastName!.localized!.label}",
        //                         password: "dow_alumni_social_login@4gs55^&!",
        //                       );
        //
        //                       print(
        //                         'Access token ${linkedInUser.user.token.accessToken}',
        //                       );
        //
        //                       print('User id: ${linkedInUser.user.userId}');
        //
        //                       // setState(() {
        //                       //   //  logoutUser = false;
        //                       // });
        //
        //                       Navigator.pop(context);
        //                     },
        //                   ),
        //                   fullscreenDialog: true,
        //                 ),
        //               );
        //             },
        //             child: SvgPicture.asset(
        //               AppImages.linkedin,
        //               height: 25.h,
        //               width: 25.w,
        //             ),
        //           ),
        //         ],
        //       )
        //     : const SizedBox(),
      ],
    );
  }

  Row _signup() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Don\'t have an account? ',
                style: TextStyle(
                  fontFamily: 'Gotham',
                  fontSize: ScreenUtil().setSp(13),
                  color: AppColor.black,
                ),
              ),
              TextSpan(
                text: 'Sign Up',
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    /// **********
                    /// Dow Signup

                    Get.to(
                          () => const OtpScreen(
                        check: 'signup',
                      ),
                    );

                    /// **********
                    /// Boss
                    // Get.to(
                    //   () => const BossSearchSignupView(
                    //     email: "",
                    //     password: "",
                    //     loginWith: "email",
                    //     name: "",
                    //   ),
                    // );

                    /// ***************
                    /// IOBM
                    // Get.to(
                    //   () => const IOBMSearchSignupView(
                    //     email: "",
                    //     password: "",
                    //     loginWith: "email",
                    //     name: "",
                    //   ),
                    // );
                    /// ***************
                    /// TLE
                    // Get.to(() => const SignUpTLE(
                    //       name: '',
                    //       loginWith: 'email',
                    //       email: '',
                    //       password: '',
                    //     ));
                  },
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontFamily: 'Gotham',
                  fontSize: ScreenUtil().setSp(13),
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row _privacyPolicy() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'By signing in you agree to our ',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(13),
                  color: AppColor.black,
                  fontFamily: 'Gotham',
                ),
              ),
              TextSpan(
                text: 'Privacy Policy',
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    setState(
                          () {
                        _launched = _launchInBrowser(toLaunch!);
                      },
                    );
                  },
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: ScreenUtil().setSp(13),
                  color: AppColor.primaryColor,
                  fontFamily: 'Gotham',
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  loginCall(
      {String loginWith = 'email',
        required String email,
        required String name,
        required String password}) async {
    UIHelper.apiCallingAlert(context);
    DeviceData device = DeviceData();
    await device.init();
    print('loginEmail from logincall $email');

    var response = await ApiCalls.login(
      email: email,
      password: password,
      loginWith: loginWith,
      latitude: "",
      longitude: "",
      manufacturer: device.manufacturer,
      model: device.model,
      platform: device.platform,
      osVersion: device.osVersion,
      token: device.token,
      serial: device.serial,
      appVersion: device.appVersion,
    );

    UIHelper.hideApiCallingAlert(context);
    if (response is ErrorEntity) {
      UIHelper.showErrorAlert(context, response.message);
    } else {
      LoginEntityEntity loginEntity = LoginEntityEntity().fromJson(response);

      if (loginEntity.success == 1 || loginEntity.success == -4) {
        print(
            'This is token from Alumni LoginScreen ${loginEntity.result!.token}');
        if (loginEntity.result!.isVerified == "1") {
          AppConstants.myId = loginEntity.result!.userId ?? '';
          print(AppConstants.myId);
          AppConstants.userName = loginEntity.result!.firstName ?? '';
          AppConstants.bearerToken = loginEntity.result!.token ?? '';
          AppConstants.chapterId = loginEntity.result!.chapterId ?? '';
          SharedPreferences localStorage =
          await SharedPreferences.getInstance();
          localStorage.setString('email', loginEntity.result!.email ?? '');
          localStorage.setString('password', password);
          localStorage.setString('loginWith', loginWith);
          localStorage.setString(
              'firstName', loginEntity.result!.firstName ?? '');
          localStorage.setString(
              'lastName', loginEntity.result!.lastName ?? '');
          localStorage.setString(
              'selectedIndustry', loginEntity.result!.industryName ?? '');
          localStorage.setString(
            'userImage',
            loginEntity.result!.image ?? '',
          );
          localStorage.setString(
            'branchId',
            loginEntity.result!.branchId ?? '',
          );
          localStorage.setString(
            'branchName',
            loginEntity.result!.branchName ?? '',
          );

          localStorage.setString(
            'count',
            loginEntity.unreadCount ?? '',
          );
          localStorage.setString(
              'currentCity', loginEntity.result!.currentCityName ?? '');
          localStorage.setString(
              'sharingLoc', loginEntity.result!.isSharingLoc ?? '');
          localStorage.setString('user_id', loginEntity.result!.userId ?? '');
          localStorage.setBool('is_first', false);
          localStorage.setString('loginStatus', '1');
          localStorage.setString('token', loginEntity.result!.token ?? '');
          if (remember == true && loginWith == 'email') {
            localStorage.setString("rEmail", email);
            localStorage.setString('rPass', password);
          }

          localStorage.setString("fingerEmail", email);
          localStorage.setString('fingerPass', password);

          DBAllUser allUser = DBAllUser(
            userId: loginEntity.result!.userId,
            firstName: loginEntity.result!.firstName,
            lastName: loginEntity.result!.lastName,
            description: loginEntity.result!.description,
            designation: loginEntity.result!.designation,
            branchName: loginEntity.result!.branchName,
            organizationName: loginEntity.result!.organizationName,
            email: loginEntity.result!.email,
            currentCityName: loginEntity.result!.currentCityName,
            isMentor: loginEntity.result!.isMentor,
            isVerified: loginEntity.result!.isVerified,
            connectionStatus: loginEntity.result!.connectionStatus,
            image: loginEntity.result!.image,
            graduationYear: loginEntity.result!.graduationYear,
            chatStatus: loginEntity.result!.chatInvitationStatus,
            linkedinUrl: loginEntity.result!.userLinkedinUrl,
            sharingLoc: loginEntity.result!.isSharingLoc,
            industryName: loginEntity.result!.industryName,
            companyId: loginEntity.result!.companyId,
            branchId: loginEntity.result!.branchId,
          );
          await database.insertUser(allUser);
          _controller.getInfo();
          if (loginEntity.success == 1) {
            Get.offUntil(
                GetPageRoute(page: () => const BottomNavigationScreen()),
                    (route) => false);
          } else {
            UIHelper.showOptionalUpdateAlert(
              context,
              loginEntity.message,
            );
          }
        } else {
          UIHelper.showErrorAlert(context,
              "Dear user, your profile is under review. You will receive an email of approval soon. Thank you for signing up");
        }
      } else if (loginEntity.success == -5) {
        UIHelper.showForceUpdateAlert(context);
      } else if (loginEntity.success == -1) {
        /// **************************************
        /// DOW SignUp
        // Get.to(
        //   () => SignUpScreen(
        //     phone: "",
        //     name: name,
        //     email: email,
        //     loginWith: loginWith,
        //     password: password,
        //   ),
        // );

        /// **************************************
        /// Boss Signup
        print('email $email');
        Get.to(
              () => BossSearchSignupView(
            name: name,
            password: password,
            loginWith: loginWith,
            email: email,
          ),
        );
        /// **************************************
        /// IOBM Signup
        // Get.to(
        //   () => IOBMSearchSignupView(
        //     name: name,
        //     password: password,
        //     loginWith: loginWith,
        //     email: email,
        //   ),
        // );
        // Get.to(() => SignUpTLE(
        //       name: name,
        //       loginWith: loginWith,
        //       email: email,
        //       password: password,
        //     ));
      }
    }
  }

  void cancelOptionalUpdate() {
    Get.offUntil(GetPageRoute(page: () => const BottomNavigationScreen()),
            (route) => false);
  }

  _googleSingIn() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      FirebaseAuth.instance.signOut();
    }
    var provider = GoogleAuthProvider();
    provider.setCustomParameters({'prompt': 'select_account'});

    if (await GoogleSignIn().isSignedIn()) {
      await GoogleSignIn().signOut();
    }
    final GoogleSignInAccount? accountInfos = await GoogleSignIn().signIn();
    if (accountInfos != null) {
      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
      await accountInfos.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      _handleSocialLogin(credential, 'google');
    } else {
      UIHelper.showErrorAlert(context,
          'Unable to fetch Google\'s account details. Please try again');
      debugPrint('google user sign in object is null');
    }
  }

  _facebookSingIn() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      FirebaseAuth.instance.signOut();
    }
    // Trigger the sign-in flow
    final fb.LoginResult result = await fb.FacebookAuth.instance.login();

    if (result.accessToken != null) {
      // Create a credential from the access token
      final facebookAuthCredential =
      FacebookAuthProvider.credential(result.accessToken!.token);
      _handleSocialLogin(facebookAuthCredential, 'facebook');
    } else {
      UIHelper.showErrorAlert(context,
          'Unable to fetch Facebook account details. Please try again');
      debugPrint('${result.message}');
    }
  }

  _appleSingIn() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      FirebaseAuth.instance.signOut();
    }

    final rawNonce = ApiCalls.generateNonce();
    final nonce = ApiCalls.sha256ofString(rawNonce);

    // Request credential for the currently signed in Apple account.
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    // Create an `OAuthCredential` from the credential returned by Apple.
    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
    );
    _handleSocialLogin(oauthCredential, 'apple');
  }

  void _handleSocialLogin(OAuthCredential credential, String loginWith) async {
    try {
      UserCredential user =
      await FirebaseAuth.instance.signInWithCredential(credential);
      _handleLoggedUser(user, loginWith);
    } catch (e) {
      print(e);
      if (e is FirebaseAuthException) {
        if (e.code == 'account-exists-with-different-credential') {
          UIHelper.showErrorAlert(context,
              'Your ${e.email} is not registered with $loginWith. Please login with the same provider to continue');
        } else {
          UIHelper.showErrorAlert(context, e.message);
        }
      } else {
        UIHelper.showErrorAlert(context,
            'An unknown error is occurred during continue with social login. Please try again.');
      }
    }
  }

  void _handleLoggedUser(UserCredential? userCredentials, String loginWith) {
    if (userCredentials != null && userCredentials.user != null) {
      _callLoginCallWithSocialLogin(
          email: userCredentials.user?.email,
          name: userCredentials.user?.displayName,
          signInWith: loginWith);
    } else {
      print('user credential or user data is null');
    }
  }

  _callLoginCallWithSocialLogin(
      {String? email, String? name, String? signInWith}) async {
    print(email);
    print(signInWith);

    if (email != null && signInWith != null) {
      print(email);
      print(name);
      print(signInWith);
      await loginCall(
        email: email,
        name: name ?? '',
        password: "dow_alumni_social_login@4gs55^&!",
        loginWith: signInWith,
      );
      print('done');
      // FirebaseAuth.instance.signOut();
    } else {
      debugPrint('user object is null in social login $email $signInWith');
    }
  }

  Future<void> _authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
        localizedReason: 'Scan your fingerprint to authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );

      if (authenticated && rEmail!.isNotEmpty && rPass!.isNotEmpty) {
        print('login called with fingerPrint');
        loginCall(email: rEmail!, name: '', password: rPass!);
      }
    } on PlatformException catch (e) {
      print(e);
      // ScaffoldMessenger.of(context).showSnackBar(snackBarRed(e));
      return ;
    }
    if (!mounted) {
      return;
    }
    final String message = authenticated ? 'Authorized' : 'Not Authorized';
  }
}

int validateEmail(String value) {
  if (value.isEmpty) return 2;

  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regex = RegExp(pattern.toString());

  if (!regex.hasMatch(value.trim())) {
    return 1;
  }
  return 0;
}
