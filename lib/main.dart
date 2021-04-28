import 'package:flutter/material.dart';

const style = TextStyle(fontSize: 48);

/// 複数のデモパターン
///
/// * 0: ルートに RichText ウィジェットだけの最もシンプルなアプリケーション
/// * 1: MyApp クラスの Stateful ウィジェットで画面を切り替えるアプリケーション
const demoPattern = 1;

void main() {
  if (demoPattern == 0) {
    runApp(
      RichText(
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center,
        text: const TextSpan(
          text: 'Hello World',
          style: style,
        ),
      ),
    );
  } else if (demoPattern == 1) {
    runApp(
      WidgetsApp(
        color: const Color(0xFFFFFFFF),
        builder: (context, _) => MyApp(),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool switchTree = true;

  Widget get firstTree => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            // key: const Key('first-tree'),
            text: const TextSpan(text: 'Hello Dart', style: style),
          ),
          const SizedBox(width: 10),
          Image.asset('lib/assets/logo_dart_1080px_clr.png', height: 40),
        ],
      );

  Widget get secondTree => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            // key: const Key('second-tree'),
            text: const TextSpan(text: 'Hello Flutter', style: style),
          ),
          const SizedBox(width: 10),
          // const Padding(padding: EdgeInsets.only(right: 10)),
          Image.asset('lib/assets/logo_flutter_1080px_clr.png', height: 40),
        ],
      );

  Widget get thirdTree => Center(
        child: RichText(
          text: const TextSpan(text: 'Hello Flutter University', style: style),
        ),
      );

  Widget get switchButton => GestureDetector(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: RichText(text: const TextSpan(text: 'Switch  Tree')),
        ),
        onTap: () => setState(() => switchTree = !switchTree),
      );

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Expanded(child: switchTree ? firstTree : secondTree),
          // Expanded(child: thirdTree),
          switchButton,
        ],
      );
}
