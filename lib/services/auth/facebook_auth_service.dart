import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookAuthService {
  Future<AccessToken?> loginWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        return result.accessToken;
      }
    } catch (e) {
      print("====================\n===========================\n Error during Facebook login: $e");
    }
    return null;
  }

}