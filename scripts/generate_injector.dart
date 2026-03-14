import 'dart:io';

void main(final List<String> args) {
  if (args.isEmpty) {
    print(
      '❌ Error: Please provide a feature name (e.g., dart generate_injector.dart search)',
    );
    return;
  }
  final String featureName = args[0].toLowerCase();
  final String className =
      featureName[0].toUpperCase() + featureName.substring(1);
  // Define path
  const String directoryPath = 'lib/core/di/injectors';
  final String filePath = '$directoryPath/${featureName}_injector.dart';

  Directory(directoryPath).createSync(recursive: true);
  final String injectorContent =
      '''
import 'package:skill_bit/core/di/injection_container.dart';

// TODO: Add feature-specific imports here

void init${className}Feature() {
  //! Data Sources
  // sl.registerLazySingleton<${className}LocalDataSource>(() => ${className}DataSourceImpl());
  // sl.registerLazySingleton<${className}RemoteDataSource>(() => ${className}DataSourceImpl());

  //! Repository
  // sl.registerLazySingleton<${className}Repo>(() => ${className}RepoImpl(sl()));

  //! Use Cases
  // sl.registerLazySingleton(() => ${className}UseCase(sl()));

  //! Feature Bloc
  // sl.registerFactory(() => ${className}Bloc(sl()));
}
''';

  File(filePath).writeAsStringSync(injectorContent);

  print('-----------------------------------------');
  print('✅ Success!');
  print('Created: $filePath');
  // 3. Auto-register in main container
  _updateMainContainer(className, featureName);
}

void _updateMainContainer(final String className, final String featureName) {
  final File mainFile = File('lib/core/di/injection_container.dart');
  if (!mainFile.existsSync()) return;

  String content = mainFile.readAsStringSync();

  // 1. Add the Import at the top
  final String importLine =
      "import 'package:skill_bit/core/di/injectors/${featureName}_injector.dart';";
  if (!content.contains(importLine)) {
    content = '$importLine\n$content';
  }

  // 2. Add the function call
  final String callLine = '  init${className}Feature();';

  if (!content.contains(callLine)) {
    //define the function RegEXP
    final RegExp initFunctionRegex = RegExp(
      r'void\s+init\s*\(\s*\)\s*(async\s*)?\{',
    );

    if (content.contains(initFunctionRegex)) {
      content = content.replaceFirstMapped(initFunctionRegex, (
        final Match match,
      ) {
        // Keeps the original match and adds the call right after it
        return '${match.group(0)}\n$callLine';
      });
    } else {
      // Fallback: If RegExp fails, try  comment method
      content = content.replaceFirst(
        '  //! Features',
        '  //! Features\n$callLine',
      );
    }
  }

  mainFile.writeAsStringSync(content);
  print('✅ Feature successfully stitched into injection_container.dart');
}
