import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../widget/hoverLottieAnimation.dart';
import 'data_tutorial.dart';
import '../../core/utils/AppColors.dart';

class TutorialScreen extends StatefulWidget {
  final VoidCallback onCompleted;  // Callback al terminar tutorial
  final bool showSkipButton;       // Controla si muestra "OMITIR"

  const TutorialScreen({
    Key? key,
    required this.onCompleted,
    this.showSkipButton = true,
  }) : super(key: key);

  @override
  _TutorialScreenState createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: onboardingContents[_currentPage].backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            // 📖 CONTENIDO PRINCIPAL
            PageView.builder(
              controller: _pageController,
              itemCount: onboardingContents.length,
              onPageChanged: (int index) {
                setState(() => _currentPage = index);
              },
              itemBuilder: (_, index) {
                final content = onboardingContents[index];
                return Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // 🎬 ANIMACIÓN LOTTIE
                      Expanded(
                        flex: 3,
                        child: SizedBox(
                          width: 300,
                          height: 300,
                          child: HoverLottieAnimation(
                            assetPath: content.lottieAnimation,
                            width: 300,
                            height: 300,
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),

                      // 📝 TÍTULO
                      Text(
                        content.title,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),

                      // 📄 DESCRIPCIÓN
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Text(
                          content.description,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: AppColors.textSecondary,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                );
              },
            ),

            // 🚫 BOTÓN "OMITIR" (OPCIONAL)
            if (widget.showSkipButton)
              Positioned(
                top: 16,
                right: 16,
                child: TextButton(
                  onPressed: widget.onCompleted,
                  child: Text(
                    'OMITIR',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

            // ⬇️ CONTROLES INFERIORES
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  // 🔘 INDICADORES DE PÁGINA
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onboardingContents.length,
                          (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: 8,
                        width: _currentPage == index ? 24 : 8,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? AppColors.accent
                              : AppColors.textSecondary.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // 🎛️ BOTONES DE NAVEGACIÓN
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      children: [
                        // ◀️ BOTÓN "ANTERIOR"
                        if (_currentPage > 0)
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {
                                _pageController.previousPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                );
                              },
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: AppColors.accent),
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                "ANTERIOR",
                                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                  color: AppColors.accent,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        if (_currentPage > 0) const SizedBox(width: 12),

                        // ▶️/✅ BOTÓN PRINCIPAL
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.accent,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 0,
                            ),
                            onPressed: () {
                              if (_currentPage == onboardingContents.length - 1) {
                                // ÚLTIMA PÁGINA → TERMINAR TUTORIAL
                                widget.onCompleted();
                              } else {
                                // PÁGINAS INTERMEDIAS → CONTINUAR
                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                );
                              }
                            },
                            child: Text(
                              _currentPage == onboardingContents.length - 1
                                  ? "COMENZAR"  // Última página
                                  : "CONTINUAR", // Páginas intermedias
                              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}