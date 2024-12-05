import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class TooltipScreen extends StatefulWidget {
  const TooltipScreen({super.key});

  @override
  State<TooltipScreen> createState() => _TooltipScreenState();
}

class _TooltipScreenState extends State<TooltipScreen> {
  final GlobalKey firstButtonKey = GlobalKey();
  final GlobalKey secondButtonKey = GlobalKey();
  TutorialCoachMark? tutorialCoachMark;
  List<TargetFocus> targets = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showTutorial();
    });
    super.initState();
  }

  void showTutorial() {
    targetAdds();
    tutorialCoachMark = TutorialCoachMark(
        targets: targets,
        colorShadow: Colors.black,
        opacityShadow: 0.5,
        hideSkip: true,
        onClickOverlay: (target) {},
        onFinish: () {},
        onClickTargetWithTapPosition: (target, tapDetails) {
          print("target: $target");
          print("clicked at position local: ${tapDetails.localPosition} - global: ${tapDetails.globalPosition}");
        },
        onClickTarget: (target) {
          print("onClickTarget: $target");
          print(target);
        },
        onSkip: () {
          print("skip");
          return true;
        })
      ..show(context: context);
  }

  void targetAdds() {
    targets.addAll([
      TargetFocus(
        identify: "Target 1",
        keyTarget: firstButtonKey,
        shape: ShapeLightFocus.RRect,
        radius: 12,
        enableOverlayTab: true,
        enableTargetTab: false,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return TooltipDesc(
                title: 'title',
                desc: 'desc',
                onNext: () {
                  controller.next();
                },
              );
            },
          )
        ],
      ),
      TargetFocus(
        identify: "Target 2",
        keyTarget: secondButtonKey,
        shape: ShapeLightFocus.RRect,
        radius: 12,
        enableOverlayTab: true,
        enableTargetTab: false,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return TooltipDesc(
                title: 'title',
                desc: 'desc',
                onNext: () {
                  controller.skip();
                },
              );
            },
          )
        ],
      )
    ]);
  }

  @override
  void dispose() {
    tutorialCoachMark?.finish();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tooltip Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              key: firstButtonKey,
              child: const Text('Tambah Item 1'),
            ),
            ElevatedButton(
              onPressed: () {},
              key: secondButtonKey,
              child: const Text('Tambah Item 2'),
            ),
          ],
        ),
      ),
    );
  }
}

class TooltipDesc extends StatelessWidget {
  final String title;
  final String desc;
  final VoidCallback onNext;

  const TooltipDesc({
    super.key,
    required this.title,
    required this.desc,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Container(
      width: mediaQuery.width * .8,
      height: mediaQuery.height * .2,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 20.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              desc,
            ),
          ),
          ElevatedButton(
            onPressed: onNext,
            child: const Text('Next'),
          ),
        ],
      ),
    );
  }
}
