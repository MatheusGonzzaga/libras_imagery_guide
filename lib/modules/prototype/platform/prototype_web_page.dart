part of '../prototype_page.dart';

class PrototypeWebPage extends StatelessWidget {
  const PrototypeWebPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(UiScale.s16),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Scaffold(
            body: Container(
              decoration: BoxDecoration(
                color: AppTheme.darkBlue,
                borderRadius: BorderRadius.circular(UiScale.s16),
              ),
              width: constraints.maxWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(UiScale.s16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: UiScale.s56),
                        Expanded(
                          child: Text(
                            'Protótipo Inicial',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize:
                                  UiScale.scaleSize(constraints, UiScale.s32),
                              color: AppTheme.yellow,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: UiScale.s56,
                          child: FloatingActionButton(
                            backgroundColor: Colors.red.shade900,
                            hoverColor: Colors.red,
                            onPressed: () => Navigator.pop(context),
                            mini: true,
                            child: const Icon(
                              Icons.close,
                              color: Colors.white,
                              weight: 2.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(UiScale.s16),
                      child: Wrap(
                        spacing: UiScale.s8,
                        runSpacing: UiScale.s8,
                        alignment: WrapAlignment.spaceEvenly,
                        children: [
                          for (var i = 0; i < 4; i++)
                            SizedBox(
                              width: constraints.maxWidth * 0.24,
                              height: constraints.maxHeight * 0.8,
                              child: PrototypeItem(
                                video: 'assets/prototype/video_${i + 1}.mp4',
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
