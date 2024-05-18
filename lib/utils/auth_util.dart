import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

class AuthUtil {
  static Future<String> getBearerToken() async {
    try {
      final cognitoPlugin =
          Amplify.Auth.getPlugin(AmplifyAuthCognito.pluginKey);

      final result = await cognitoPlugin.fetchAuthSession();
      final accessToken = result.userPoolTokensResult.value.accessToken.raw;

      return accessToken;
    } on AuthException catch (e) {
      throw Exception('Error retrieving auth session: ${e.message}');
    }
  }
}
