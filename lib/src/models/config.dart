class Config {
  final String accessKey;
  final String secretKey;
  final String protocol;
  final String endpoint;

  Config({
    required this.accessKey,
    required this.secretKey,
    this.protocol = 'HTTP',
    this.endpoint = 'api.upgrade.toolsetlink.com',
  });
}
