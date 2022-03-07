import 'package:drinks_everywhere/app/widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Button that show circular progress loading
class ButtonLoading extends StatelessWidget {
  /// function to run when click
  final VoidCallback? onPressed;

  /// text that will show in widget
  final String text;

  /// loading controller
  final bool loading;

  final Decoration? decoration;

  const ButtonLoading(
      {Key? key,
      required this.onPressed,
      required this.text,
      required this.loading,
      this.decoration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      width: loading ? 55 : Get.width,
      height: 55,
      child: AnimatedCrossFade(
        firstChild: _progressBar(),
        secondChild: Padding(
          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 3),
          child: _textButton(loading),
        ),
        crossFadeState:
            loading ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: const Duration(milliseconds: 200),
      ),
    );
  }

  Widget _textButton(bool loading) {
    return SizedBox(
      width: loading ? 55 : Get.width,
      height: 55,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: loading ? () {} : onPressed,
          child: Container(
            alignment: Alignment.center,
            decoration: decoration ??
                BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: LinearGradient(
                    begin: const Alignment(-1.0, -1.0),
                    end: const Alignment(1.0, 1.0),
                    colors: onPressed != null
                        ? [const Color(0xffff314f), const Color(0xffe75c37)]
                        : [const Color(0xff999999), const Color(0xe4999999)],
                    stops: const [0.0, 1.0],
                  ),
                ),
            child: Text(
              text.toString(),
              style: buttonTextStyle,
              textHeightBehavior:
                  const TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  Widget _progressBar() {
    return Container(
      height: 55,
      decoration: BoxDecoration(
          color: const Color(0xffff314f),
          borderRadius: BorderRadius.circular(48)),
      child: const Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white))),
    );
  }
}
