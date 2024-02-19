import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noti/notification_controller.dart';
void main()async {
   AwesomeNotifications().initialize(
  // set the icon to null if you want to use the default app icon
  'resource://drawable/res_app_icon',
  [
    NotificationChannel(
        channelGroupKey: 'basic_channel_group',
        channelKey: 'basic_channel',
        channelName: 'Basic notifications',
        channelDescription: 'Notification channel for basic tests',
        defaultColor: Color(0xFF9D50DD),
        ledColor: Colors.white)
  ],
  // Channel groups are only visual and are not required
  channelGroups: [
    NotificationChannelGroup(
        channelGroupKey: 'basic_channel_group',
        channelGroupName: 'Basic group')
  ],
  debug: true
);
bool isAllowedToSendNotification = await AwesomeNotifications().isNotificationAllowed();
if(!isAllowedToSendNotification)
{
  AwesomeNotifications().requestPermissionToSendNotifications();
}
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
 AwesomeNotifications().setListeners(onActionReceivedMethod: NotificationController.onActionReceivedMethod   ,
 onNotificationCreatedMethod:    NotificationController.onNotificationCreatedMethod,
        onNotificationDisplayedMethod:  NotificationController.onNotificationDisplayedMethod,
        onDismissActionReceivedMethod:  NotificationController.onDismissActionReceivedMethod,);
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
        preferredSize: const Size(0, 96),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: AppBar(
          title: Text('Get Notification',style: GoogleFonts.lato(),),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Container(
                width: 56,
                height: 56,
                padding: const EdgeInsets.all(8.0),
                child: Ink(
                    child: IconButton(
                        icon: Icon(Icons.menu, color: Colors.black,), iconSize: 20.0 ,onPressed: null),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20.0),
                    )),
              ),
            ),
            actions: [
              Container(
                width: 56,
                height: 56,
                padding: const EdgeInsets.all(8.0),
                child: Ink(
                    child: IconButton(
                        icon: Icon(Icons.archive, color: Colors.black,), iconSize: 20.0, onPressed: null),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20.0),
                    )),
              ),
            ],
          ),
        ),
      ),
      body: Row(
        children: [

        ],
      )
      ),
    );
  }
}

