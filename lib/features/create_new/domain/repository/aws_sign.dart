import 'package:aws_common/aws_common.dart';
import 'package:aws_signature_v4/aws_signature_v4.dart';

Future<String> generatePresignedUrl(String region, String bucket, String objectKey) async {
  const signer = AWSSigV4Signer(
    credentialsProvider: AWSCredentialsProvider.environment(),
  );

  final scope = AWSCredentialScope(region: region, service: AWSService.s3);
  final serviceConfiguration = S3ServiceConfiguration();
  final request = AWSHttpRequest(
    method: AWSHttpMethod.get,
    uri: Uri.https('s3.$region.amazonaws.com', '/$bucket/$objectKey'),
  );

  // Sign the request to generate a presigned URL
  final presignedUri = await signer.presign(
    request,
    expiresIn: const Duration(minutes: 15),
    credentialScope: scope,
    serviceConfiguration: serviceConfiguration,
  );
  return presignedUri.toString();
}

Future<void> credentialsAws() async {
  const signer = AWSSigV4Signer(
    credentialsProvider: AWSCredentialsProvider.environment(),
  );

  try {
    // Use await to handle the Future returned by retrieve()
    final credentials = await signer.credentialsProvider.retrieve();
    print('Access Key: ${credentials.accessKeyId}');
    print('Secret Key: ${credentials.secretAccessKey}');
  } catch (e) {
    print('Failed to retrieve credentials: $e');
  }
}
