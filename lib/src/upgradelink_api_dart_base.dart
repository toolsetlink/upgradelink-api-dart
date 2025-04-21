// This file is auto-generated, don't edit it. Thanks.
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

// 1. 生成RFC3339时间戳（与Go完全一致）
String _generateTimestamp() {
  // 创建一个DateTime实例
  DateTime now = DateTime.now();

  // 获取本地时区的偏移量
  Duration offset = now.timeZoneOffset;

  // 格式化小时和分钟部分的偏移量
  String offsetSign = offset.isNegative ? '-' : '+';
  int offsetHours = offset.inHours.abs();
  int offsetMinutes = (offset.inMinutes.abs() % 60);
  String offsetString =
      '$offsetSign${offsetHours.toString().padLeft(2, '0')}:${offsetMinutes.toString().padLeft(2, '0')}';

  // 使用DateFormat格式化时间为RFC3339格式，并包含本地时区偏移
  String rfc3339String =
      DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(now) + offsetString;

  return rfc3339String;
}

// 2. 生成16位十六进制随机Nonce（与Go完全一致）
String _generateNonce() {
  const String chars =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  final Random random = Random.secure();
  final List<int> codeUnits = List.generate(
    16,
    (index) => chars.codeUnitAt(random.nextInt(chars.length)),
  );

  return String.fromCharCodes(codeUnits);
}

// 3. 生成请求签名（与Go算法完全一致）
String _generateSignature(
  String body,
  String nonce,
  String secretKey,
  String timestamp,
  String uri,
) {
  final parts = <String>[];
  if (body.isNotEmpty) {
    parts.add('body=$body');
  }
  parts.addAll([
    'nonce=$nonce',
    'secretKey=$secretKey',
    'timestamp=$timestamp',
    'url=$uri',
  ]);

  final signStr = parts.join('&');
  final bytes = utf8.encode(signStr);
  final md5Hash = md5.convert(bytes);
  return md5Hash.toString(); // 32位十六进制小写
}

// 统一异常处理
void _handleException(Object e, StackTrace stackTrace) {
  if (e is SocketException) {
    throw Exception('网络连接失败：${e.message}');
  } else if (e is TimeoutException) {
    throw Exception('请求超时：${e.message}');
  } else if (e is FormatException) {
    throw Exception('JSON解析错误：${e.message}');
  }
}

class Client {
  final String accessKey;
  final String secretKey;
  final String protocol;
  final String endpoint;

  Client({
    required this.accessKey,
    required this.secretKey,
    this.protocol = 'HTTP',
    this.endpoint = 'api.upgrade.toolsetlink.com',
  });

  // 响应处理
  UrlUpgradeResponse _handleUrlUpgradeResponse(http.Response response) {
    if (response.statusCode != 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      throw Exception(
          'API Error: code:${json['code'] ?? 'N/A'}, msg:${json['msg'] ?? 'N/A'}, docs:${json['docs'] ?? 'N/A'}, traceId:${json['traceId'] ?? 'N/A'} ');
    }
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return UrlUpgradeResponse.fromJson(json);
  }

  Future<UrlUpgradeResponse> getUrlUpgrade(UrlUpgradeRequest request) async {
    try {
      final body = jsonEncode(request.toJson());
      final timestamp = _generateTimestamp();
      final nonce = _generateNonce();

      final uri = Uri(
        scheme: protocol,
        host: endpoint,
        path: '/v1/url/upgrade',
      );
      final signature =
          _generateSignature(body, nonce, secretKey, timestamp, uri.path);

      final headers = {
        'host': uri.host,
        'content-type': 'application/json',
        'X-Timestamp': timestamp,
        'X-Nonce': nonce,
        'X-AccessKey': accessKey,
        'X-Signature': signature,
      };

      final response = await http.post(
        uri,
        headers: headers,
        body: body,
      );

      return _handleUrlUpgradeResponse(response);
    } catch (e, stackTrace) {
      _handleException(e, stackTrace);
      rethrow;
    }
  }

  // 响应处理
  FileUpgradeResponse _handleFileUpgradeResponse(http.Response response) {
    if (response.statusCode != 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      throw Exception(
          'API Error: code:${json['code'] ?? 'N/A'}, msg:${json['msg'] ?? 'N/A'}, docs:${json['docs'] ?? 'N/A'}, traceId:${json['traceId'] ?? 'N/A'} ');
    }
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return FileUpgradeResponse.fromJson(json);
  }

  Future<FileUpgradeResponse> getFileUpgrade(FileUpgradeRequest request) async {
    try {
      final body = jsonEncode(request.toJson());
      final timestamp = _generateTimestamp();
      final nonce = _generateNonce();

      final uri = Uri(
        scheme: protocol,
        host: endpoint,
        path: '/v1/file/upgrade',
      );
      final signature =
          _generateSignature(body, nonce, secretKey, timestamp, uri.path);

      final headers = {
        'host': uri.host,
        'content-type': 'application/json',
        'X-Timestamp': timestamp,
        'X-Nonce': nonce,
        'X-AccessKey': accessKey,
        'X-Signature': signature,
      };

      final response = await http.post(
        uri,
        headers: headers,
        body: body,
      );

      return _handleFileUpgradeResponse(response);
    } catch (e, stackTrace) {
      _handleException(e, stackTrace);
      rethrow;
    }
  }
}

class UrlUpgradeRequest {
  final String urlKey;
  final int versionCode;
  final int appointVersionCode;
  final String devModelKey;
  final String devKey;

  UrlUpgradeRequest({
    required this.urlKey,
    required this.versionCode,
    required this.appointVersionCode,
    required this.devModelKey,
    required this.devKey,
  });

  Map<String, dynamic> toJson() {
    return {
      'urlKey': urlKey,
      'versionCode': versionCode,
      'appointVersionCode': appointVersionCode,
      'devModelKey': devModelKey,
      'devKey': devKey,
    };
  }
}

class UrlUpgradeDataResponse {
  final String urlKey;
  final String versionName;
  final int versionCode;
  final String urlPath;
  final int upgradeType;
  final String promptUpgradeContent;

  UrlUpgradeDataResponse({
    required this.urlKey,
    required this.versionName,
    required this.versionCode,
    required this.urlPath,
    required this.upgradeType,
    required this.promptUpgradeContent,
  });

  factory UrlUpgradeDataResponse.fromJson(Map<String, dynamic> json) {
    return UrlUpgradeDataResponse(
      urlKey: json['urlKey'] as String,
      versionName: json['versionName'] as String,
      versionCode: json['versionCode'] as int,
      urlPath: json['urlPath'] as String,
      upgradeType: json['upgradeType'] as int,
      promptUpgradeContent: json['promptUpgradeContent'] as String,
    );
  }

  @override
  String toString() {
    return 'UrlUpgradeDataResponse{'
        'urlKey: $urlKey, '
        'versionName: $versionName, '
        'versionCode: $versionCode, '
        'urlPath: $urlPath, '
        'upgradeType: $upgradeType, '
        'promptUpgradeContent: $promptUpgradeContent'
        '}';
  }
}

class UrlUpgradeResponse {
  final int code;
  final String msg;
  final UrlUpgradeDataResponse? data;

  UrlUpgradeResponse({
    required this.code,
    required this.msg,
    this.data,
  });

  factory UrlUpgradeResponse.fromJson(Map<String, dynamic> json) {
    return UrlUpgradeResponse(
      code: json['code'] as int,
      msg: json['msg'] as String,
      data: json['data'] != null
          ? UrlUpgradeDataResponse.fromJson(
              json['data'] as Map<String, dynamic>)
          : null,
    );
  }

  @override
  String toString() {
    return 'UrlUpgradeResponse{'
        'code: $code, '
        'msg: $msg, '
        'data: ${data != null ? data.toString() : "null"}'
        '}';
  }
}

class FileUpgradeRequest {
  final String fileKey;
  final int versionCode;
  final int appointVersionCode;
  final String devModelKey;
  final String devKey;

  FileUpgradeRequest({
    required this.fileKey,
    required this.versionCode,
    required this.appointVersionCode,
    required this.devModelKey,
    required this.devKey,
  });

  Map<String, dynamic> toJson() {
    return {
      'fileKey': fileKey,
      'versionCode': versionCode,
      'appointVersionCode': appointVersionCode,
      'devModelKey': devModelKey,
      'devKey': devKey,
    };
  }
}

class FileUpgradeDataResponse {
  final String fileKey;
  final String versionName;
  final int versionCode;
  final String urlPath;
  final int upgradeType;
  final String promptUpgradeContent;

  FileUpgradeDataResponse({
    required this.fileKey,
    required this.versionName,
    required this.versionCode,
    required this.urlPath,
    required this.upgradeType,
    required this.promptUpgradeContent,
  });

  factory FileUpgradeDataResponse.fromJson(Map<String, dynamic> json) {
    return FileUpgradeDataResponse(
      fileKey: json['fileKey'] as String,
      versionName: json['versionName'] as String,
      versionCode: json['versionCode'] as int,
      urlPath: json['urlPath'] as String,
      upgradeType: json['upgradeType'] as int,
      promptUpgradeContent: json['promptUpgradeContent'] as String,
    );
  }

  @override
  String toString() {
    return 'FileUpgradeDataResponse{'
        'fileKey: $fileKey, '
        'versionName: $versionName, '
        'versionCode: $versionCode, '
        'urlPath: $urlPath, '
        'upgradeType: $upgradeType, '
        'promptUpgradeContent: $promptUpgradeContent'
        '}';
  }
}

class FileUpgradeResponse {
  final int code;
  final String msg;
  final FileUpgradeDataResponse? data;

  FileUpgradeResponse({
    required this.code,
    required this.msg,
    this.data,
  });

  factory FileUpgradeResponse.fromJson(Map<String, dynamic> json) {
    return FileUpgradeResponse(
      code: json['code'] as int,
      msg: json['msg'] as String,
      data: json['data'] != null
          ? FileUpgradeDataResponse.fromJson(
              json['data'] as Map<String, dynamic>)
          : null,
    );
  }

  @override
  String toString() {
    return 'FileUpgradeResponse{'
        'code: $code, '
        'msg: $msg, '
        'data: ${data != null ? data.toString() : "null"}'
        '}';
  }
}
