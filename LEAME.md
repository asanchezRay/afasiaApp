# AfasiaApp

Una aplicación Flutter integral diseñada para terapia del habla y tratamiento de afasia en dispositivos tablet.

## 📋 Tabla de Contenidos
- [Descripción](#descripción)
- [Características](#características)
- [Prerrequisitos](#prerrequisitos)
- [Instalación](#instalación)
- [Uso](#uso)
- [Estructura del Proyecto](#estructura-del-proyecto)
- [Tecnologías](#tecnologías)
- [Contribuir](#contribuir)
- [Licencia](#licencia)

## 📖 Descripción

AfasiaApp es una aplicación móvil especializada desarrollada para tablets, diseñada para asistir en terapia del habla y tratamiento de afasia. Este proyecto fue creado como parte del programa de grado en Ingeniería Civil Informática y se enfoca en proporcionar actividades interactivas para ayudar a pacientes con trastornos del lenguaje a mejorar sus habilidades de comunicación.

La aplicación incluye varias actividades terapéuticas como:
- **Comprensión Lectora**: Ejercicios interactivos para mejorar las habilidades de lectura
- **Nominación de Objetos**: Actividades para ayudar a los pacientes a identificar y nombrar objetos
- **Nominación de Acciones**: Ejercicios enfocados en reconocer y nombrar acciones
- **Grabación de Audio**: Capacidad para grabar y reproducir habla para sesiones de terapia
- **Seguimiento de Progreso**: Monitorear el progreso del paciente a través de diferentes actividades

## ✨ Características

- 🎯 **Actividades Terapéuticas Dirigidas**: Ejercicios especializados para diferentes aspectos de la recuperación del lenguaje
- 🎵 **Integración de Audio**: Grabar, reproducir y gestionar archivos de audio para terapia del habla
- 📱 **UI Optimizada para Tablet**: Diseñada específicamente para dispositivos tablet con interfaces táctiles intuitivas
- 📊 **Seguimiento de Progreso**: Monitorear y guardar el progreso del paciente
- 🎨 **Elementos Interactivos**: Componentes visuales atractivos incluyendo selectores de color y deslizadores
- 📷 **Manejo de Imágenes**: Soporte para selección y manipulación de imágenes
- 💾 **Almacenamiento Local**: Base de datos SQLite para gestión de datos sin conexión

## 🔧 Prerrequisitos

Antes de comenzar, asegúrate de tener lo siguiente instalado:

### Usando FVM (Flutter Version Management) - Recomendado

1. **Instalar FVM** (si no está instalado):
   ```bash
   # Usando pub
   dart pub global activate fvm
   
   # O usando Homebrew (macOS)
   brew tap leoafarias/fvm
   brew install fvm
   ```

2. **Instalar la versión requerida de Flutter**:
   ```bash
   fvm install 2.8.1
   fvm use 2.8.1
   ```

### Alternativa: Instalación Directa de Flutter

- [Flutter SDK 2.8.1](https://flutter.dev/docs/get-started/install)
- [Dart SDK 2.15.1](https://dart.dev/get-dart)
- Android Studio o VS Code con extensiones de Flutter
- Android SDK (para desarrollo Android)
- Xcode (para desarrollo iOS, solo macOS)

### Requisitos del Dispositivo

- Dispositivo/emulador Android (API nivel 16+)
- Dispositivo/simulador iOS (iOS 9.0+)
- **Recomendado**: Dispositivo tablet para experiencia de usuario óptima

## 🚀 Instalación

### Paso 1: Clonar el Repositorio
```bash
git clone https://github.com/asanchezRay/afasiaApp.git
cd afasiaApp
```

### Paso 2: Configurar Versión de Flutter (Usando FVM)
```bash
# Si usas FVM
fvm use 2.8.1

# Verificar la versión de Flutter
fvm flutter --version
```

### Paso 3: Instalar Dependencias
```bash
# Usando FVM
fvm flutter pub get

# O sin FVM
flutter pub get
```

### Paso 4: Verificar Conexión del Dispositivo
```bash
# Usando FVM
fvm flutter devices

# O sin FVM
flutter devices
```

### Paso 5: Ejecutar la Aplicación
```bash
# Para desarrollo/depuración (usando FVM)
fvm flutter run

# O sin FVM
flutter run

# Para compilación de lanzamiento
fvm flutter build apk --release
```

## 📱 Uso

### Ejecutar en Modo Desarrollo
```bash
# Iniciar la app en modo debug
fvm flutter run

# Ejecutar con dispositivo específico
fvm flutter run -d <device-id>

# Ejecutar en modo release
fvm flutter run --release
```

### Compilar para Producción
```bash
# Compilar APK para Android
fvm flutter build apk --release

# Compilar App Bundle para Google Play Store
fvm flutter build appbundle --release

# Compilar para iOS (solo macOS)
fvm flutter build ios --release
```

## 📁 Estructura del Proyecto

```
afasiaApp/
├── android/                 # Archivos específicos de Android
├── assets/                  # Recursos de la aplicación
│   ├── audio/              # Archivos de audio para terapia
│   ├── icons/              # Iconos de la app
│   └── images/             # Imágenes usadas en actividades
├── ios/                    # Archivos específicos de iOS
├── lib/                    # Código principal de la aplicación
│   ├── Screens/            # Pantallas y páginas de UI
│   │   ├── Activities/     # Pantallas de actividades terapéuticas
│   │   │   ├── Lectura/   # Actividades de lectura
│   │   │   └── ...        # Otros tipos de actividades
│   │   └── Welcome/       # Bienvenida e incorporación
│   ├── components/         # Componentes UI reutilizables
│   ├── database/          # Gestión de base de datos SQLite
│   ├── constants.dart     # Constantes y configuraciones de la app
│   └── main.dart          # Punto de entrada de la aplicación
├── pubspec.yaml           # Dependencias y configuración del proyecto
└── README.md             # Archivo README en inglés
```

## 🛠 Tecnologías

### Framework Principal
- **Flutter**: 2.8.1 - Framework de UI para desarrollo multiplataforma
- **Dart**: 2.15.1 - Lenguaje de programación

### Dependencias Clave
- **sqflite**: ^1.3.0 - Base de datos SQLite para almacenamiento local
- **flutter_sound**: ^2.0.3 - Grabación y reproducción de audio
- **image_picker**: ^0.8.0+4 - Funcionalidad de selección de imágenes
- **http**: ^0.13.1 - Solicitudes de red
- **get**: ^3.24.0 - Gestión de estado y navegación
- **flutter_localizations** - Soporte de internacionalización

### Componentes de UI
- **syncfusion_flutter_sliders**: ^18.4.35-beta - Deslizadores interactivos
- **flutter_colorpicker**: ^0.3.5 - Herramientas de selección de color
- **flutter_spinkit**: ^4.1.2 - Animaciones de carga
- **badges**: ^1.1.6 - Insignias e indicadores de UI

### Utilidades
- **permission_handler**: ^5.0.1+1 - Gestión de permisos del dispositivo
- **path_provider**: ^2.0.2 - Acceso al sistema de archivos
- **screenshot**: ^0.3.0 - Funcionalidad de captura de pantalla
- **flutter_phoenix**: ^1.0.0 - Capacidad de reinicio de la app

## 🤝 Contribuir

¡Damos la bienvenida a contribuciones para mejorar AfasiaApp! Por favor sigue estos pasos:

1. Haz fork del repositorio
2. Crea una rama de característica (`git checkout -b feature/CaracteristicaIncreible`)
3. Confirma tus cambios (`git commit -m 'Agregar alguna CaracteristicaIncreible'`)
4. Empuja a la rama (`git push origin feature/CaracteristicaIncreible`)
5. Abre un Pull Request

### Pautas de Desarrollo
- Sigue las convenciones de codificación de Flutter/Dart
- Agrega comentarios para lógica compleja
- Prueba tus cambios en Android e iOS
- Actualiza la documentación según sea necesario

## 📄 Licencia

Este proyecto está licenciado bajo la Licencia MIT - consulta el archivo [LICENSE](LICENSE) para más detalles.

## 📞 Soporte

Si encuentras algún problema o tienes preguntas:

1. Revisa la página de [Issues](https://github.com/asanchezRay/afasiaApp/issues)
2. Crea un nuevo issue con información detallada
3. Contacta al equipo de desarrollo

---
