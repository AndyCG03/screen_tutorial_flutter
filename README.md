# 🎬 Flutter Tutorial con Animaciones Lottie

[![Flutter](https://img.shields.io/badge/Flutter-3.19+-blue.svg)](https://flutter.dev)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Dart](https://img.shields.io/badge/Dart-3.3+-blue.svg)](https://dart.dev)

Un sistema completo de **tutorial/onboarding** para aplicaciones Flutter con animaciones Lottie interactivas. Perfecto para mostrar las características de tu app de manera visual y atractiva.

![Demo del Tutorial](https://raw.githubusercontent.com/lottie-react-native/lottie-react-native/master/.github/example.gif) *Ejemplo de animación Lottie*

## ✨ Características Principales

✅ **7 pantallas de tutorial** pre-configuradas  
✅ **35+ animaciones Lottie** incluidas  
✅ **Interactividad completa** (hover effects)  
✅ **Diseño responsive** y adaptable  
✅ **Código modular** y fácil de personalizar  
✅ **Soporte multiplataforma** (Android, iOS, Web)  
✅ **Licencia MIT** - Uso libre y gratuito

## 🚀 Comenzando Rápidamente

### 1. Requisitos Previos
```bash
flutter --version  # Flutter 3.19 o superior
dart --version     # Dart 3.3 o superior
```

### 2. Instalación
```yaml
# En tu pubspec.yaml
dependencies:
  flutter:
    sdk: flutter
  lottie: ^3.3.2  # Animaciones Lottie
```

### 3. Configuración de Assets
```yaml
flutter:
  assets:
    - assets/lottie/
    - assets/lottie/Nuevos lotties/
```

### 4. Uso Básico
```dart
import 'package:flutter/material.dart';
import 'tutorial/TutorialScreen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TutorialScreen(
        onCompleted: () {
          // Navega a tu pantalla principal
        },
        showSkipButton: true,
      ),
    );
  }
}
```

## 🏗️ Estructura del Proyecto

```
lib/
├── core/
│   ├── utils/
│   │   ├── AppColors.dart      # 🎨 Paleta de colores
│   │   └── Lotties.dart        # 📁 Rutas de animaciones
│   └── models/
│       └── TutorialData.dart   # 📊 Modelo de datos
├── shared/
│   └── widgets/
│       └── HoverLottieAnimation.dart # 🖱️ Widget interactivo
└── ui/
    └── tutorial/
        ├── data_tutorial.dart  # 📋 Contenido del tutorial
        └── TutorialScreen.dart # 🖼️ Pantalla principal
```

## 🎨 Pantallas del Tutorial

El sistema incluye 7 pantallas listas para usar:

| # | Animación | Tema Principal | Descripción |
|---|-----------|----------------|-------------|
| 1 | `user.json` | Bienvenida | Introducción a la plataforma |
| 2 | `tag.json` | Organización | Clasificación temática |
| 3 | `documents.json` | Gestión Documental | Subida de archivos |
| 4 | `question2.json` | FAQs | Preguntas frecuentes |
| 5 | `search.json` | Sistema RAG | Búsqueda avanzada |
| 6 | `chat.json` | Chat | Prueba de asistentes |
| 7 | `inbox.json` | Integración API | Conexión externa |

## 🖱️ Widget Interactivo

### HoverLottieAnimation
```dart
HoverLottieAnimation(
  assetPath: LottieAssets.chat(),  // Animación a mostrar
  width: 300,
  height: 300,
  onHover: () {
    // Acción personalizada al hacer hover
  },
)
```

**Características:**
- ▶️ **Animación inicial** automática
- 🔄 **Replay al hacer hover**
- 🛡️ **Manejo seguro** con `mounted` checks
- 🗑️ **Liberación correcta** de recursos

## 📦 Personalización

### 1. Modificar Contenido
```dart
// En data_tutorial.dart
TutorialData(
  lottieAnimation: LottieAssets.yourAnimation(),
  title: "Tu Título Personalizado",
  description: "Descripción detallada\nde tu funcionalidad",
  backgroundColor: Colors.blue.withOpacity(0.1),
),
```

### 2. Agregar Nuevas Animaciones
1. Descarga el archivo `.json` de Lottie
2. Colócalo en `assets/lottie/`
3. Agrega referencia en `Lotties.dart`:
```dart
static String tuAnimacion() => '${_basePath}tu-animacion.json';
```

### 3. Cambiar Colores
```dart
// En AppColors.dart
class AppColors {
  static const Color background = Color(0xFFF8F9FA);
  static const Color accent = Color(0xFF007AFF);
  static const Color textPrimary = Color(0xFF1C1C1E);
  // Personaliza según tu branding
}
```

## 🎯 ¿Dónde Conseguir Animaciones Lottie?

### 🏆 Mejores Plataformas Gratuitas

| Plataforma | Animaciones Gratis | Formato | Destacado |
|------------|-------------------|---------|-----------|
| **LottieFiles** | 800,000+ | `.json` | Mayor colección |
| **Lordicon** | Limitado (39,500+ premium) | `.json` | Calidad premium |
| **IconScout** | Cientos | `.json` | Plugins integrados |
| **Icons8** | 2,000+ | `.json` | Categorizadas |
| **Creattie** | Colecciones temáticas | `.json` | Diseño profesional |

### 🔍 Enlaces Directos

1. **[LottieFiles Community](https://lottiefiles.com/community)** - Busca "flutter", "onboarding", "tutorial"
2. **[Lordicon Free Icons](https://lordicon.com/icons/free)** - Icons animados gratuitos
3. **[IconScout Lottie](https://iconscout.com/lottie-animations)** - Filtra por "Free"
4. **[Icons8 Lottie](https://icons8.com/lottie)** - 2,000+ animaciones gratis

### 💡 Tips para Elegir Animaciones

1. **Tamaño**: Prefiere archivos < 500KB
2. **Estilo**: Mantén consistencia visual
3. **Colores**: Animaciones editables son mejores
4. **Licencia**: Verifica uso comercial gratuito
5. **Rendimiento**: Prueba en dispositivos antiguos

## 🛠️ Solución de Problemas

### ❌ Error: "FrameRate.max no existe"
```dart
// ❌ INCORRECTO
frameRate: FrameRate.max,

// ✅ CORRECTO
frameRate: const FrameRate(60),  // O elimina esta línea
```

### ❌ Error: "Navigator operation requested..."
**Problema**: El `context` no tiene un `Navigator` como ancestro.
**Solución**: Usa un widget separado o `Builder`:
```dart
// ✅ Solución con Builder
Builder(
  builder: (BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context, ...); // Ahora funciona
      },
    );
  },
)
```

### ⚡ Optimización de Rendimiento
```dart
Lottie.asset(
  'assets/animation.json',
  renderCache: true,  // ✅ Reduce CPU/GPU usage
  frameRate: const FrameRate(30),  // ✅ 30 FPS para animaciones simples
)
```

## 📱 Demo en Acción

Para probar el tutorial inmediatamente:

```bash
# Clona el repositorio
git clone https://github.com/tu-usuario/flutter-tutorial-lottie.git

# Navega al directorio
cd flutter-tutorial-lottie

# Instala dependencias
flutter pub get

# Ejecuta en tu dispositivo preferido
flutter run
```

## 🤝 Contribuir

¡Contribuciones son bienvenidas!

1. **Fork** el repositorio
2. Crea una **rama** (`git checkout -b feature/nueva-funcionalidad`)
3. **Commit** tus cambios (`git commit -m 'Añade nueva funcionalidad'`)
4. **Push** a la rama (`git push origin feature/nueva-funcionalidad`)
5. Abre un **Pull Request**

### 🎨 Agregar Nuevas Animaciones
1. Sube archivos `.json` a `assets/lottie/`
2. Actualiza `Lotties.dart` con nuevas referencias
3. Añade ejemplos en `data_tutorial.dart`

## 📄 Licencia

Este proyecto está bajo la **Licencia MIT**. Ver el archivo [LICENSE](LICENSE) para más detalles.

```
MIT License © 2024

Permisos:
✅ Uso comercial
✅ Modificación
✅ Distribución
✅ Uso privado

Restricciones:
❌ Responsabilidad
❌ Garantía
```

## 🔗 Recursos Útiles

- [Documentación Oficial de Lottie para Flutter](https://pub.dev/packages/lottie)
- [Ejemplos de Animaciones Lottie](https://lottiefiles.com/featured)
- [Guía de Mejores Prácticas en Flutter](https://flutter.dev/docs)
- [Comunidad Flutter en Español](https://flutter-es.io/)

## 📞 Soporte

¿Encontraste un error o tienes una pregunta?

1. **Issues**: [Reportar un problema](https://github.com/AndyCG03/screen_tutorial_flutter/issues)
2. **Discusiones**: [Foro de la comunidad](https://github.com/AndyCG03/screen_tutorial_flutter/discussions)
3. **Contacto**: `andyclmentegago@gmail.com`

---

**⭐ Si este proyecto te fue útil, ¡dale una estrella en GitHub!**

> *"Las mejores aplicaciones no solo funcionan bien, sino que también se explican bien."*