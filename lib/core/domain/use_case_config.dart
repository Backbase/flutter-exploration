class UseCaseConfig {
  final String realm;
  final String grantType;
  final String clientId;
  final String deviceKeyAlgorithm;
  final String deviceSignatureAlgorithm;
  final String apiKey;
  final String acrValues;

  UseCaseConfig({
    this.apiKey= "ADD YOUR API KEY HERE",
    this.acrValues = "authentication",
    this.realm = "customer",
    this.grantType = "password",
    this.clientId = "mobile-client",
    this.deviceKeyAlgorithm = "ALG_KEY_ECC_X962_DER",
    this.deviceSignatureAlgorithm = "ALG_SIGN_SECP256R1_ECDSA_SHA256_DER",
    // Constructor with default value for age
  });
}
