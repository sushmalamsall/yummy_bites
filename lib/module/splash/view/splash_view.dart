import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yummy_bites/routes/navigation_helper.dart';
import 'package:yummy_bites/theme/app_colors.dart';

@RoutePage()
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  final List<String> emojis = ['🍕', '🍜', '🍔', '🍣', '🌮'];
  int currentIndex = 0;
  Timer? emojiTimer;

  late AnimationController _slideFadeController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  late AnimationController _yummyIntroController;
  late Animation<double> _yummyScaleAnimation;
  late Animation<double> _yummyFadeAnimation;

  String fullText = 'Some Small Text Goes Here.';
  String displayedText = '';
  int _typingCharIndex = 0;
  Timer? _typingTimer;
  bool showLoader = false;
  bool startTyping = false;

  @override
  void initState() {
    super.initState();

    _slideFadeController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    _slideAnimation = Tween<Offset>(begin: Offset.zero, end: Offset(0, -1.5))
        .animate(
          CurvedAnimation(
            parent: _slideFadeController,
            curve: Curves.easeInOut,
          ),
        );
    _fadeAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(_slideFadeController);

    _yummyIntroController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    _yummyScaleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _yummyIntroController, curve: Curves.easeOutBack),
    );
    _yummyFadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _yummyIntroController, curve: Curves.easeIn),
    );

    _yummyIntroController.forward().whenComplete(() {
      setState(() {
        startTyping = true;
      });
      _startTyping();
    });
  }

  void _startTyping() {
    const typingDelay = Duration(milliseconds: 100);

    _typingTimer = Timer.periodic(typingDelay, (timer) {
      if (_typingCharIndex < fullText.length) {
        setState(() {
          displayedText += fullText[_typingCharIndex];
          _typingCharIndex++;
        });
      } else {
        timer.cancel();

        Future.delayed(Duration(milliseconds: 800), () async {
          await _slideFadeController.forward();

          setState(() {
            showLoader = true;
          });

          _startEmojiTimer();

          Future.delayed(Duration(seconds: 4), () {
            emojiTimer?.cancel();

            if (mounted) {
              RouterHelper().navigateToOnboardingView();
            }
          });
        });
      }
    });
  }

  void _startEmojiTimer() {
    emojiTimer = Timer.periodic(Duration(milliseconds: 500), (Timer t) {
      setState(() {
        currentIndex = (currentIndex + 1) % emojis.length;
      });
    });
  }

  @override
  void dispose() {
    emojiTimer?.cancel();
    _typingTimer?.cancel();
    _slideFadeController.dispose();
    _yummyIntroController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppColors.of(context);

    return Scaffold(
      backgroundColor: theme.primaryBlack,
      body: SafeArea(
        child: Align(
          alignment: Alignment(0, -0.1),
          child: showLoader
              ? Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          theme.primaryYellow,
                        ),
                      ),
                    ),
                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 300),
                      transitionBuilder: (child, animation) =>
                          ScaleTransition(scale: animation, child: child),
                      child: Text(
                        emojis[currentIndex],
                        key: ValueKey<int>(currentIndex),
                        style: TextStyle(fontSize: 35),
                      ),
                    ),
                  ],
                )
              : SlideTransition(
                  position: _slideAnimation,
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ScaleTransition(
                          scale: _yummyScaleAnimation,
                          child: FadeTransition(
                            opacity: _yummyFadeAnimation,
                            child: Text(
                              'Yummy Bites',
                              style: GoogleFonts.fredoka(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                color: theme.primaryYellow,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 20,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              displayedText,
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontStyle: FontStyle.normal,
                                color: Colors.white70,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
