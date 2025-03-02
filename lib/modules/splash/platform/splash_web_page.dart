part of '../splash_page.dart';

class SplashWebPage extends StatefulWidget {
  const SplashWebPage({super.key});

  @override
  State<SplashWebPage> createState() => _SplashWebPageState();
}

class _SplashWebPageState extends State<SplashWebPage> {
  bool showVideo = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(3.seconds, () {
      setState(() {
        showVideo = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Container(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            decoration: BoxDecoration(
              color: AppTheme.darkBlue,
            ),
            child: Column(
              children: [
                const Spacer(),
                Row(
                  children: [
                    const Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: constraints.maxHeight * .5,
                          width: constraints.maxHeight * .5,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/logo/logo.png'),
                            ),
                          ),
                        ).animate().scaleXY(
                              duration: 2.seconds,
                              begin: 0,
                              end: 1,
                              curve: Curves.easeInOutExpo,
                            ),
                        Text(
                          'História Visual e Educação Crítica',
                          style: GoogleFonts.assistant(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.white,
                          ),
                        ).animate().fadeIn(
                              delay: 1.seconds,
                              duration: 1.seconds,
                              begin: 0,
                              curve: Curves.easeInOutExpo,
                            ),
                        Text(
                          'Um aplicativo Web Bílingue para o aprendizado de Surdos',
                          style: GoogleFonts.assistant(
                            fontSize: 24,
                            color: AppTheme.white,
                          ),
                        ).animate().fadeIn(
                              delay: 1.5.seconds,
                              duration: 1.seconds,
                              begin: 0,
                              curve: Curves.easeInOutExpo,
                            ),
                        Text(
                          'Guia para o professor',
                          style: GoogleFonts.assistant(
                            fontSize: 24,
                            color: AppTheme.white,
                          ),
                        ).animate().fadeIn(
                              delay: 2.seconds,
                              duration: 1.seconds,
                              begin: 0,
                              curve: Curves.easeInOutExpo,
                            ),
                      ],
                    ),
                    const Spacer(),
                    if (showVideo) ...[
                      SizedBox(
                        height: constraints.maxHeight * .7,
                        width: constraints.maxWidth * .5,
                        child: const YoutubeVideoPlayer(
                          videoUrl: Mock.splashVideo,
                          autoPlay: true,
                          mute: false,
                        ),
                      ).animate().scaleXY(
                            duration: 1.seconds,
                            begin: 0,
                            end: 1,
                            curve: Curves.easeInOutExpo,
                          ),
                      const Spacer(),
                    ]
                  ],
                ),
                const Spacer(),
                OutlinedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      AppTheme.blue,
                    ),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        side: BorderSide(
                          color: AppTheme.white,
                          width: 1.5,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(UiScale.s32),
                        ),
                      ),
                    ),
                    overlayColor: WidgetStateProperty.resolveWith<Color>(
                        (Set<WidgetState> states) {
                      if (states.contains(WidgetState.hovered)) {
                        return AppTheme.yellow;
                      }
                      return AppTheme.blue;
                    }),
                  ),
                  onPressed: () => Get.offAndToNamed('/home'),
                  child: Text(
                    'ACESSAR',
                    style: TextStyle(
                      color: AppTheme.white,
                      fontSize: UiScale.s32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ).animate().fadeIn(
                      delay: 5.seconds,
                      duration: 2.seconds,
                      begin: 0,
                      curve: Curves.easeInOutExpo,
                    ),
                const Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }
}
