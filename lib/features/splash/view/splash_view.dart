import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spenditure/bootstrap.dart';
import 'package:spenditure/const/color/app_colors.dart';
import 'package:spenditure/const/resource.dart';
import 'package:spenditure/features/splash/controller/future_initializer.dart';
import 'package:spenditure/shared/riverpod_ext/asynvalue_easy_when.dart';
import 'package:velocity_x/velocity_x.dart';

///This view displayed for initializing all the required things on initialization.
/// This will help for initial loading screen for apps with heavy things initialization;
class SplashView extends ConsumerStatefulWidget {
  /// If true ,this will defer the first frame upto all async initialization done.
  /// On deferring the screen will be blasnk upto the completion of initialization.
  ///
  /// If false, it will show splash loader from the start of the app upto intialization
  ///  without deferring the first frame.
  ///
  final bool removeSpalshLoader;
  final void Function(ProviderContainer container) onInitialized;
  const SplashView({
    super.key,
    required this.onInitialized,
    required this.removeSpalshLoader,
  });

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  late Stopwatch stopwatch;
  @override
  void initState() {
    stopwatch = Stopwatch()..start();
    super.initState();
    if (widget.removeSpalshLoader) {
      RendererBinding.instance.deferFirstFrame();
    }
  }

  @override
  void didChangeDependencies() {
    if (widget.removeSpalshLoader) {
      ref.read(futureInitializerPod.future).whenComplete(
        () {
          RendererBinding.instance.allowFirstFrame();
        },
      );
    }

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    stopwatch.stop();
    talker.info("Page disposed after takes ${stopwatch.elapsedMilliseconds}");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final futureAsync = ref.watch(futureInitializerPod);
        ref.listen(
          futureInitializerPod,
          (previous, next) {
            if (next is AsyncData && next.valueOrNull != null) {
              talker.info("Initialization takes ${stopwatch.elapsedMilliseconds}");
              widget.onInitialized(next.requireValue);
            }
          },
        );
        return futureAsync.easyWhen(
          data: (data) {
            return const SizedBox.shrink();
          },
          loadingWidget: () => child!,
          errorWidget: (error, stackTrace) => child!,
        );
      },
      child: const LoaderChild(),
    );
  }
}

class LoaderChild extends StatefulWidget {
  const LoaderChild({
    super.key,
  });

  @override
  State<LoaderChild> createState() => _LoaderChildState();
}

class _LoaderChildState extends State<LoaderChild> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticOut,
  );
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      left: false,
      right: false,
      child: Container(
        //add gradient
        decoration: const BoxDecoration(color: AppColors.kBackgroundColor
            // gradient: LinearGradient(
            //   begin: Alignment.topLeft,
            //   end: Alignment.bottomRight,
            //   stops: [0.0, 1.0],
            //   colors: [
            //     Color(0xFFEEE5FF),
            //     Color(0xFF9A66FF),
            //   ],
            // ),
            ),
        child: Column(
          // alignment: AlignmentDirectional.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SvgPicture.asset(
                R.ASSETS_ICONS_SPENDITURE_LOGO_SVG,
                width: 100,
                height: 100,
              ),
            ),
            10.heightBox,
            // Positioned(
            //   bottom: 16,
            //   child: Text(
            //     "Spenditure".toUpperCase(),
            //     style: const TextStyle(
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            30.heightBox,
            // const Positioned(
            //   bottom: 44,
            //   child: CircularProgressIndicator(
            //     color: Colors.amber,
            //   ),
            // ),
            Material(
              color: Colors.transparent,
              child: AnimatedTextKit(
                animatedTexts: [
                  ColorizeAnimatedText(
                    'Spenditure.',
                    colors: [
                      AppColors.kSecondaryColor,
                      const Color(0xFF9a66ff),
                    ],
                    textStyle: GoogleFonts.inter(
                      fontSize: 50,
                      // color:
                      fontWeight: FontWeight.bold,
                    ),
                    // speed: const Duration(milliseconds: 170),
                  ),
                ],
                totalRepeatCount: 4,
                pause: const Duration(milliseconds: 1000),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
