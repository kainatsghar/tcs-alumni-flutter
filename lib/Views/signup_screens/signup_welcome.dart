import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iobm/Views/signup_screens/sign_up_boss/signup_search_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controllers/profile_controller.dart';
import '../../helper_classes/ui_helper.dart';
import '../../local_db/local_db.dart';
import '../../models/error_entity.dart';
import '../../networkcalls/api_calls.dart';
import '../../networkcalls/response_models/login_entity_entity.dart';
import '../../utils/app_color.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_images.dart';
import '../../utils/device_data.dart';
import '../../utils/text_styles.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart' as fb;

import '../bottom_navigationbar.dart';
import 'otp_screen.dart';

class SignupWelcome extends StatefulWidget {
  const SignupWelcome({Key? key}) : super(key: key);

  @override
  State<SignupWelcome> createState() => _SignupWelcomeState();
}

class _SignupWelcomeState extends State<SignupWelcome> {
  final ProfileController _controller = Get.put(ProfileController());
  Future<void>? _launched;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _body()),
    );
  }

  Widget _body(){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 15.h,),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 80.w,
              height: 25.h,
              margin: EdgeInsets.only(right: 10.w),
              child: ElevatedButton(
                onPressed: (){
                  Get.back();
                },
                child: Text(
                  "LOG IN",
                  style: CustomTextStyles.text14SemiBoldW600.copyWith(color: AppColor.white, fontSize: 12.sp),
                ),
                style: ButtonStyle(
                  padding:
                  MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35),
                          side:  const BorderSide(color: AppColor.grey))),
                  backgroundColor: MaterialStateProperty.all<Color>(AppColor.grey),
                  minimumSize: MaterialStateProperty.all<Size>(Size(120.w, 30.h)),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 80.h,
          ),
          profileLogo(),
          SizedBox(
            height: 50.h,
          ),
          _mediaButtons(),
          SizedBox(
            height: 35.h,
          ),
          Text("OR", style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),),
          SizedBox(
            height: 35.h,
          ),
          Container(
              width: double.infinity,
              height: 45.h,
              margin: EdgeInsets.symmetric(horizontal: 25.w),
              child: ElevatedButton(
                onPressed: (){
                  Get.to(() => const OtpScreen(check: 'signup',));
                },
                child: Text(
                  "Email",
                  style: CustomTextStyles.text14SemiBoldW600.copyWith(color: AppColor.white, fontSize: 16.sp),
                ),
                style: ButtonStyle(
                  padding:
                  MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35),
                          side:  BorderSide(color: AppColor.primaryColor))),
                  backgroundColor: MaterialStateProperty.all<Color>(AppColor.primaryColor),
                  minimumSize: MaterialStateProperty.all<Size>(Size(120.w, 30.h)),
                ),
              ),
          ),
          SizedBox(
            height: 130.h,
          ),
          _privacyPolicy(),
        ],
      ),
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
            "Welcome to Cityzen’s Alumni Reunion",
            style: CustomTextStyles.text16SemiBoldW600.copyWith(color: AppColor.primaryColor),
          ),
          Text(
            "Sign up with",
            style: CustomTextStyles.text16SemiBoldW600.copyWith(color: AppColor.primaryColor),
          ),
        ],
      ),
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
              height: 48.h,
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
              height: 45.h,

            ),
          ),
        SizedBox(
          width: 20.w,
        ),

        ///FB login Button
        GestureDetector(
          onTap: () {
            _facebookSingIn();
          },
          child: Image.asset(AppImages.fbicon, height: 45.h,
          ),
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

  Row _privacyPolicy() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'By signing in you agree to our ',
                style: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.black),
              ),
              TextSpan(
                text: 'Privacy Policy',
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    setState(() {_launched = _launchInBrowser(AppConstants.privacyUrl);},
                    );
                  },
                style: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.primaryColor, decoration: TextDecoration.underline),
              ),
            ],
          ),
        ),
      ],
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

  loginCall({String loginWith = 'email',
    required String email,
    required String name,
    required String password}) async {
    UIHelper.apiCallingAlert(context);
    DeviceData device = DeviceData();
    await device.init();

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
      if(response.success == -6){
        if(loginWith == "google" || loginWith == "facebook" || loginWith == "apple"){
          Get.to(() => BossSearchSignupView(
            name: name,
            password: password,
            loginWith: loginWith,
            email: email,
          ));
        }
        else{
          UIHelper.showErrorAlert(context, response.message, action: ()=> Get.to(() => BossSearchSignupView(
            name: name,
            password: password,
            loginWith: loginWith,
            email: email,
          )));
        }
      }
      else{
        UIHelper.showErrorAlert(context, response.message);
      }
    }
    else {
      LoginEntityEntity loginEntity = LoginEntityEntity().fromJson(response);

      if (loginEntity.success == 1 || loginEntity.success == -4) {
       try{
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
         }
         else {
           UIHelper.showErrorAlert(context,
               loginEntity.message);
         }
       }catch(e) {
         UIHelper.showErrorAlert(context,
             loginEntity.message);
       }
      }
      else if (loginEntity.success == -5) {
        UIHelper.showForceUpdateAlert(context);
      }
      else if (loginEntity.success == -1) {
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
      final GoogleSignInAuthentication googleAuth =
      await accountInfos.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      _handleSocialLogin(credential, 'google');
    }
    else {
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

}

