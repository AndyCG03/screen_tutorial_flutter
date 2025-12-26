import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';  // Para programar después del primer frame
import 'package:lottie/lottie.dart';      // Animaciones Lottie

class HoverLottieAnimation extends StatefulWidget {
  // Propiedades del widget:
  final String assetPath;   // Ruta al archivo JSON de Lottie
  final double width;       // Ancho del widget
  final double height;      // Alto del widget
  final VoidCallback? onHover;  // Callback al pasar el mouse
  final VoidCallback? onExit;   // Callback al quitar el mouse

  const HoverLottieAnimation({
    Key? key,
    required this.assetPath,
    this.width = 100,
    this.height = 100,
    this.onHover,
    this.onExit,
  }) : super(key: key);

  @override
  _HoverLottieAnimationState createState() => _HoverLottieAnimationState();
}

class _HoverLottieAnimationState extends State<HoverLottieAnimation>
    with SingleTickerProviderStateMixin {  // Necesario para AnimationController
  late AnimationController _controller;  // Controla la animación Lottie
  bool _hasPlayedInitialAnimation = false;  // ¿Ya se reprodujo la animación inicial?
  bool _isHovering = false;  // ¿El mouse está sobre el widget?

  @override
  void initState() {
    super.initState();
    // Crea el controlador de animación (1.5 segundos)
    _controller = AnimationController(
      vsync: this,  // "vsync" sincroniza con los frames de la UI
      duration: const Duration(milliseconds: 1500),
    );

    // ⏰ Programa la animación inicial DESPUÉS del primer frame renderizado
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _playInitialAnimation();
    });
  }

  // ▶️ Reproduce la animación inicial (solo una vez)
  void _playInitialAnimation() async {
    // Verifica: 1) no se ha reproducido, 2) widget aún está montado
    if (!_hasPlayedInitialAnimation && mounted) {
      await _controller.forward();  // Reproduce animación hacia adelante
      if (mounted) {  // Verificación doble para seguridad
        setState(() => _hasPlayedInitialAnimation = true);
      }
    }
  }

  // 🖱️ Maneja eventos de hover (entrada/salida del mouse)
  void _handleHover(bool isHovering) {
    if (!mounted) return;  // Si widget fue destruido, no hacer nada

    // Si: 1) mouse entra, 2) ya se reprodujo animación inicial
    if (isHovering && _hasPlayedInitialAnimation) {
      _controller.reset();    // Reinicia al inicio
      _controller.forward();  // Reproduce de nuevo
    }

    // Actualiza estado solo si widget aún existe
    if (mounted) {
      setState(() => _isHovering = isHovering);
    }

    // Ejecuta callbacks correspondientes
    isHovering ? widget.onHover?.call() : widget.onExit?.call();
  }

  @override
  void dispose() {
    _controller.dispose();  // 🗑️ IMPORTANTE: libera recursos
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => _handleHover(true),   // Mouse entra
      onExit: (event) => _handleHover(false),   // Mouse sale
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: Lottie.asset(
          widget.assetPath,  // Archivo JSON de Lottie
          controller: _controller,  // Controlador para play/pause/reset
          animate: _isHovering || !_hasPlayedInitialAnimation, // Cuándo animar
          repeat: false,  // No repetir automáticamente
          frameRate: FrameRate.max,  // Máxima fluidez (120fps si está disponible)
        ),
      ),
    );
  }
}