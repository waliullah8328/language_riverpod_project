import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:language_riverpod_project/core/services/token_storage.dart';

import 'navigation_service.dart';



class AuthErrorHandler {
  AuthErrorHandler._();

  /// ------------------------------------------------
  /// AUTH ERROR DETECTION
  /// ------------------------------------------------
  static bool isAuthError(DioException e) {
    return _checkAuthError(e);
  }

  static bool _checkAuthError(DioException e) {
    // Status code check
    if (e.response?.statusCode == 401 ||
        e.response?.statusCode == 403) {
      return true;
    }

    final data = e.response?.data;
    if (data == null) return false;

    String errorMessage = '';

    if (data is Map<String, dynamic>) {
      errorMessage = (data['detail'] ??
          data['message'] ??
          data['error'] ??
          '')
          .toString()
          .toLowerCase();
    } else if (data is String) {
      try {
        final decoded = jsonDecode(data);
        errorMessage = (decoded['detail'] ??
            decoded['message'] ??
            decoded['error'] ??
            '')
            .toString()
            .toLowerCase();
      } catch (_) {
        errorMessage = data.toLowerCase();
      }
    }

    return errorMessage.contains('token') ||
        errorMessage.contains('unauthorized') ||
        errorMessage.contains('authentication') ||
        errorMessage.contains('invalid') ||
        errorMessage.contains('expired') ||
        errorMessage.contains('user not found');
  }

  /// ------------------------------------------------
  /// AUTO LOGOUT HANDLER
  /// ------------------------------------------------
  static Future<void> handleAuthError(DioException e) async {
    debugPrint('🚨 AUTHENTICATION ERROR DETECTED');
    debugPrint('📊 Status Code: ${e.response?.statusCode}');
    debugPrint('📦 Response Data: ${e.response?.data}');
    debugPrint('🌐 Request URL: ${e.requestOptions.uri}');
    debugPrint('⏰ Time: ${DateTime.now()}');

    // TODO: Clear token storage
    await TokenStorage.clearAll();
    debugPrint('🧹 Cleared authentication data');

    final navigator = navigatorKey.currentState;

    if (navigator != null) {
      // navigator.pushNamedAndRemoveUntil(
      //   RouteNames.welcomeScreen,
      //       (route) => false,
      // );
      debugPrint('🔄 Redirected to welcome screen');
    } else {
      debugPrint('⚠️ Navigator not available');
    }
  }

  /// ------------------------------------------------
  /// MAIN ERROR HANDLER
  /// ------------------------------------------------
  static String handleError(
      DioException e, {
        bool autoLogout = true,
      }) {
    debugPrint('❌ API ERROR');
    debugPrint('🔍 Type: ${e.type}');
    debugPrint('📊 Status: ${e.response?.statusCode}');
    debugPrint('📦 Data: ${e.response?.data}');
    debugPrint('🌐 URL: ${e.requestOptions.uri}');
    debugPrint('📝 Message: ${e.message}');
    debugPrint('⏰ Time: ${DateTime.now()}');

    if (autoLogout && _checkAuthError(e)) {
      handleAuthError(e);
      return 'Session expired. Please login again.';
    }

    final data = e.response?.data;
    if (data != null) {
      if (data is Map<String, dynamic>) {
        return data['detail'] ??
            data['message'] ??
            data['error'] ??
            'Request failed';
      } else if (data is String) {
        try {
          final decoded = jsonDecode(data);
          return decoded['detail'] ??
              decoded['message'] ??
              decoded['error'] ??
              'Request failed';
        } catch (_) {
          return data;
        }
      }
    }

    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return 'Connection timeout. Please try again.';
    }

    return e.message ?? 'Something went wrong';
  }

  /// ------------------------------------------------
  /// MANUAL LOGOUT
  /// ------------------------------------------------
  static Future<void> performLogout({String? message}) async {
    debugPrint('🚪 Manual logout');

    // TODO: Clear token storage
     await TokenStorage.clearAll();

    final navigator = navigatorKey.currentState;

    if (navigator != null) {
      // navigator.pushNamedAndRemoveUntil(
      //   RouteNames.loginScreen,
      //       (route) => false,
      // );
    }
  }
}
