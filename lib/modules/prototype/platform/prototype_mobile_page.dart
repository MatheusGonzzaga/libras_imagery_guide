part of '../prototype_page.dart';

class PrototypeMobilePage extends StatelessWidget {
  const PrototypeMobilePage({super.key});

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
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: UiScale.s16,
                      vertical: UiScale.s12,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(width: UiScale.s40),
                        Expanded(
                          child: Text(
                            'Protótipo Inicial',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize:
                                  UiScale.scaleSize(constraints, UiScale.s56),
                              color: AppTheme.yellow,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        FloatingActionButton(
                          backgroundColor: Colors.red.shade900,
                          hoverColor: Colors.red,
                          onPressed: () => Navigator.pop(context),
                          mini: true,
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(UiScale.s8),
                      child: GridView.builder(
                        itemCount: 4,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: UiScale.s8,
                          mainAxisSpacing: UiScale.s8,
                          childAspectRatio: 0.65,
                        ),
                        itemBuilder: (context, index) {
                          return PrototypeItem(
                            video: 'assets/prototype/video_${index + 1}.mp4',
                          );
                        },
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
