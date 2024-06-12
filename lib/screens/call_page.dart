import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class CallPage extends StatefulWidget {
  const CallPage({
    super.key,
    required this.callID,
    required this.userID,
  });
  final String callID;
  final String userID;

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      children: <Widget>[
        ZegoUIKitPrebuiltCall(
          appID: 1727722363,
          appSign:
              'cece023f634965c36cc192755c734963609d92c9d647c72179fc5bc6f557ea4d',
          callID: widget.callID,
          userID: widget.userID,
          userName: widget.userID,
          config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
        ),
        Text(
          'Code: ${widget.callID}',
          style: const TextStyle(
            fontSize: 18,
            color: Colors.red,
            decoration: TextDecoration.none,
          ),
        ),
      ],
    ));
  }
}
