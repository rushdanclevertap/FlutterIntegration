import 'package:flutter/material.dart';
import 'package:clevertap_plugin/clevertap_plugin.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  late CleverTapPlugin _clevertapPlugin;
  var inboxInitialized = false;
  var optOut = false;
  var offLine = false;
  var enableDeviceNetworkingInfo = false;
  int _counter = 0;

  @override
  void initState() {

    CleverTapPlugin.createNotificationChannel("1999", "Channel1999", "ChannelDescription", 5, true);
    var temp= {"":""};
    CleverTapPlugin.recordEvent("RUSHDAN",temp);
    super.initState();
    CleverTapPlugin.initializeInbox();
    CleverTapPlugin.setDebugLevel(3);
  }



  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              color: Colors.grey.shade300,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: ListTile(
                  title: Text("Performs onUserLogin"),
                  subtitle: Text("Used to identify multiple profiles"),
                  onTap: onUserLogin,
                ),
              ),
            ),
            Card(
              color: Colors.grey.shade300,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: ListTile(
                  title: Text("Push Event"),
                  subtitle: Text("Pushes/Records an event"),
                  onTap: recordEvent,
                ),
              ),
            ),
            Card(
              color: Colors.grey.shade300,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: ListTile(
                  title: Text("In App"),
                  subtitle: Text("In app event"),
                  onTap: recordEventInapp,
                ),
              ),
            ),
            Card(
              color: Colors.grey.shade300,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: ListTile(
                  title: Text("Show Inbox"),
                  subtitle: Text("Opens sample App Inbox"),
                  onTap: opappinbox,

                ),
              ),
            ),



          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void activateCleverTapFlutterPluginHandlers() {
    // _clevertapPlugin = new CleverTapPlugin();
    // _clevertapPlugin
    //     .setCleverTapPushAmpPayloadReceivedHandler(pushAmpPayloadReceived);
    // _clevertapPlugin.setCleverTapPushClickedPayloadReceivedHandler(
    //     pushClickedPayloadReceived);
    // _clevertapPlugin.setCleverTapInAppNotificationDismissedHandler(
    //     inAppNotificationDismissed);
    // _clevertapPlugin
    //     .setCleverTapProfileDidInitializeHandler(profileDidInitialize);
    // _clevertapPlugin.setCleverTapProfileSyncHandler(profileDidUpdate);
    _clevertapPlugin.setCleverTapInboxDidInitializeHandler(inboxDidInitialize);
    // _clevertapPlugin.setCleverTapInboxMessagesDidUpdateHandler(inboxMessagesDidUpdate);
    // _clevertapPlugin
    //     .setCleverTapDisplayUnitsLoadedHandler(onDisplayUnitsLoaded);
    // _clevertapPlugin.setCleverTapInAppNotificationButtonClickedHandler(
    //     inAppNotificationButtonClicked);
    // _clevertapPlugin.setCleverTapInboxNotificationButtonClickedHandler(
    //     inboxNotificationButtonClicked);
    // _clevertapPlugin.setCleverTapFeatureFlagUpdatedHandler(featureFlagsUpdated);
    // _clevertapPlugin
    //     .setCleverTapProductConfigInitializedHandler(productConfigInitialized);
    // _clevertapPlugin
    //     .setCleverTapProductConfigFetchedHandler(productConfigFetched);
    // _clevertapPlugin
    //     .setCleverTapProductConfigActivatedHandler(productConfigActivated);
  }


  void onUserLogin() {
    var stuff = ["bags", "shoes"];
    var profile = {

    'Name': 'Rushdan',

    'Email': 'flutter@clevertap.com',
    'Phone': '+919766609447',
    'MSG-push':true,
    'MSG-whatsapp':true,
    'MSG-sms':true,
    'MSG-email':true

    };
    CleverTapPlugin.onUserLogin(profile);
    //showToast("onUserLogin called, check console for details");
  }




  void recordEvent() {
    var now = new DateTime.now();
    var eventData = {
      // Key:    Value
      'first': 'partridge',


    };
    CleverTapPlugin.recordEvent("Rushdanflutter", eventData);

  }

  void recordEventInapp() {
    var now = new DateTime.now();
    var eventData = {
      // Key:    Value
      'first': 'cartridge',


    };
    CleverTapPlugin.recordEvent("Rushdanflutterinapp", eventData);


  }

  void inboxDidInitialize() {
    this.setState(() {
      print("inboxDidInitialize called");
      inboxInitialized = true;
    });
  }

  // void showInbox() {
  //
  //   if (inboxInitialized) {
  //     showToast("Opening App Inbox", onDismiss: () {
  //       var styleConfig = {
  //         'noMessageTextColor': '#ff6600',
  //         'noMessageText': 'No message(s) to show.',
  //         'navBarTitle': 'App Inbox',
  //         'navBarTitleColor': '#101727',
  //         'navBarColor': '#EF4444',
  //         'tabs': ["Offers"]
  //       };
  //       CleverTapPlugin.showInbox(styleConfig);
  //     });
  //   }
  // }

  void opappinbox() {
    var temp= {"":""};
    CleverTapPlugin.recordEvent("Inboxxxx",temp);
    var styleConfig = {
      'noMessageTextColor': '#ff6600',
      'noMessageText': 'No message(s) to show.',
      'navBarTitle': 'App Inbox'
    };
    CleverTapPlugin.showInbox(styleConfig);
  }


  void appInbox() {
    var now = new DateTime.now();
    var eventData = {
      // Key:    Value
      'first': 'cartridge',


    };
    CleverTapPlugin.recordEvent("Inboxxxx", eventData);
  }



}
