import 'package:flutter/material.dart';
import '../../core/utils/AppColors.dart';
import '../../core/utils/Lotties.dart';

class TutorialData {
  final String lottieAnimation;
  final String title;
  final String description;
  final Color backgroundColor;

  TutorialData({
    required this.lottieAnimation,
    required this.title,
    required this.description,
    this.backgroundColor = AppColors.background,
  });
}

//En lottieAnimation: debes asignar el Lottie que vas a cargar en el tutorial

List<TutorialData> onboardingContents = [
  TutorialData(
    lottieAnimation: LottieAssets.notification(),
    title: "Recurso Flutter: Tutorial con Lottie Animations",
    description:
    "Sistema completo de onboarding/tutorial con animaciones Lottie.\nIdeal para mostrar características de tu app de forma visual.",
  ),
  TutorialData(
    lottieAnimation: LottieAssets.estadisticas(),
    title: "Estructura Modular",
    description:
    "Clase TutorialData para modelar cada pantalla.\nLista onboardingContents con 7 pantallas configurables.",
    backgroundColor: AppColors.surface.withOpacity(0.7),
  ),
  TutorialData(
    lottieAnimation: LottieAssets.personita(),
    title: "35+ Animaciones Lottie",
    description:
    "Animaciones pre-cargadas: user.json, chat.json, search.json, documents.json, tag.json, question2.json, inbox.json.",
  ),
  TutorialData(
    lottieAnimation: LottieAssets.settings2(),
    title: "Configuración Simple",
    description:
    "Personaliza títulos, descripciones, colores de fondo.\nUsa AppColors para consistencia visual.",
    backgroundColor: AppColors.surface.withOpacity(0.7),
  ),
  TutorialData(
    lottieAnimation: LottieAssets.addItem(),
    title: "Fácil Integración",
    description:
    "Solo copia la clase y la lista.\nConecta con TutorialScreen para visualización.",
  ),
  TutorialData(
    lottieAnimation: LottieAssets.question2(),
    title: "Cómo Usarlo",
    description:
    "1. Agrega dependencia lottie en pubspec.yaml\n2. Copia los archivos .json a assets/lottie/\n3. Usa onboardingContents en tu PageView.",
  ),
  TutorialData(
    lottieAnimation: LottieAssets.code(),
    title: "Repositorio GitHub",
    description:
    "https://github.com/AndyCG03/screen_tutorial_flutter\n\nMIT License - Uso gratuito en proyectos comerciales y personales.",
  ),

  //Puedes poner la cantidad de páginas que quieras
];