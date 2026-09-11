import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  NotificationService.lastBackgroundRoute = NotificationService.extractRoute(
    message.data,
  );
}

class NotificationService {
  static final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static GoRouter? _router;
  static String? lastBackgroundRoute;

  static Future<void> initialize(GoRouter router) async {
    _router = router;

    const channel = AndroidNotificationChannel(
      'pooja_pundit_channel',
      'Pooja Pundit Notifications',
      description: 'Notifications for booking and app updates',
      importance: Importance.max,
    );

    await _localNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(channel);

    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    await _localNotificationsPlugin.initialize(
      settings: const InitializationSettings(
        android: androidSettings,
        iOS: iosSettings,
      ),
      onDidReceiveNotificationResponse: (response) {
        _handlePayload(response.payload);
      },
    );

    final permission = await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: true,
      sound: true,
    );

    if (permission.authorizationStatus == AuthorizationStatus.denied) {
      return;
    }

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
          alert: true,
          badge: true,
          sound: true,
        );

    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _showLocalNotification(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _handleData(message.data);
    });

    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      _handleData(initialMessage.data);
    }

    FirebaseMessaging.instance.onTokenRefresh.listen((token) {
      debugPrint('FCM token refreshed: $token');
    });
  }

  static String extractRoute(Map<String, dynamic> data) {
    final rawValue =
        data['route'] ?? data['path'] ?? data['screen'] ?? data['screenName'];
    if (rawValue == null || rawValue.toString().trim().isEmpty) {
      return switch (data['type']?.toString()) {
        'booking_accepted' || 'booking_completed' || 'test' => '/?tab=activity',
        'booking_expired' => '/?tab=bookings',
        _ => '/',
      };
    }

    final rawRoute = rawValue.toString().trim();
    if (rawRoute.startsWith('http://') || rawRoute.startsWith('https://')) {
      final uri = Uri.tryParse(rawRoute);
      if (uri != null && uri.path.isNotEmpty) return uri.path;
      return '/';
    }

    if (rawRoute.startsWith('pooja-pundit://')) {
      final uri = Uri.tryParse(rawRoute);
      if (uri != null && uri.path.isNotEmpty) return uri.path;
      return '/';
    }

    if (!rawRoute.startsWith('/')) {
      return '/$rawRoute';
    }

    return rawRoute;
  }

  static void _handleData(Map<String, dynamic> data) {
    final route = extractRoute(data);
    _navigate(route);
  }

  static void _handlePayload(String? payload) {
    if (payload == null || payload.trim().isEmpty) {
      _navigate('/');
      return;
    }

    final route = payload.trim();
    _navigate(route.startsWith('/') ? route : '/$route');
  }

  static void _navigate(String route) {
    final router = _router;
    if (router == null) {
      lastBackgroundRoute = route;
      return;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      router.go(route);
    });
  }

  static Future<void> _showLocalNotification(RemoteMessage message) async {
    final notification = message.notification;
    if (notification == null) {
      return;
    }

    final imagePath = await _downloadImage(message);
    final androidDetails = AndroidNotificationDetails(
      'pooja_pundit_channel',
      'Pooja Pundit Notifications',
      channelDescription: 'Notifications for booking and app updates',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'Pooja Pundit',
      styleInformation: imagePath == null
          ? const DefaultStyleInformation(true, true)
          : BigPictureStyleInformation(
              FilePathAndroidBitmap(imagePath),
              contentTitle: message.notification?.title,
              summaryText: message.notification?.body,
              hideExpandedLargeIcon: true,
            ),
    );

    final iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      attachments: imagePath == null
          ? null
          : [DarwinNotificationAttachment(imagePath)],
    );

    final payload = extractRoute(message.data);
    await _localNotificationsPlugin.show(
      id: notification.hashCode,
      title: notification.title ?? 'Pooja Pundit',
      body: notification.body ?? 'New update',
      notificationDetails: NotificationDetails(
        android: androidDetails,
        iOS: iosDetails,
      ),
      payload: payload,
    );
  }

  static Future<String?> _downloadImage(RemoteMessage message) async {
    final imageUrl =
        message.notification?.android?.imageUrl ??
        message.notification?.apple?.imageUrl ??
        message.data['image'] ??
        message.data['imageUrl'] ??
        message.data['image_url'];
    if (imageUrl == null || imageUrl.toString().trim().isEmpty) {
      return null;
    }

    final uri = Uri.tryParse(imageUrl.toString().trim());
    if (uri == null || !uri.hasScheme) {
      return null;
    }

    try {
      final directory = await getTemporaryDirectory();
      final extension = _imageExtension(uri.path);
      final filePath =
          '${directory.path}/notification_${message.hashCode}$extension';
      final file = File(filePath);
      if (!await file.exists()) {
        await Dio().download(uri.toString(), filePath);
      }
      return await file.exists() ? filePath : null;
    } catch (error) {
      debugPrint('Unable to cache notification image: $error');
      return null;
    }
  }

  static String _imageExtension(String path) {
    final extension = path.split('.').last.toLowerCase();
    return const {'jpg', 'jpeg', 'png', 'gif', 'webp'}.contains(extension)
        ? '.$extension'
        : '.jpg';
  }
}
