import 'dart:io';

// ─── Entry Point ────────────────────────────────────────────────────────────

void main(final List<String> args) {
  final (String featureName, List<String> useCases) = _resolveInput(args);

  if (featureName.isEmpty || useCases.isEmpty) {
    print('❌ Error: Feature name and at least one use case are required.');
    return;
  }

  final String className = _toClassName(featureName);
  final String filePath = _getInjectorFilePath(featureName);

  _createInjectorFile(filePath, featureName, className, useCases);
  _updateMainContainer(className, featureName);
  _gitAdd(filePath);
}

// ─── Input ───────────────────────────────────────────────────────────────────

(String, List<String>) _resolveInput(final List<String> args) {
  if (args.isNotEmpty) {
    return (args[0].toLowerCase(), args.sublist(1));
  }
  return _askInteractively();
}

(String, List<String>) _askInteractively() {
  stdout.write('Enter feature name (ex: auth): ');
  final String featureName = stdin.readLineSync()!.trim().toLowerCase();

  stdout.write(
    'Enter use cases separated by space (ex: Login SignUp Logout): ',
  );
  final String useCasesInput = stdin.readLineSync()!.trim();
  final List<String> useCases = useCasesInput
      .split(' ')
      .where((final String e) => e.isNotEmpty)
      .toList();

  return (featureName, useCases);
}

// ─── File Generation ─────────────────────────────────────────────────────────

String _getInjectorFilePath(final String featureName) {
  const String directoryPath = 'lib/core/di/injectors';
  Directory(directoryPath).createSync(recursive: true);
  return '$directoryPath/${featureName}_injector.dart';
}

void _createInjectorFile(
  final String filePath,
  final String featureName,
  final String className,
  final List<String> useCases,
) {
  final String content = _buildInjectorContent(
    featureName,
    className,
    useCases,
  );
  File(filePath).writeAsStringSync(content);
  print('-----------------------------------------');
  print('✅ Success!');
  print('Created: $filePath');
  print('Registered ${useCases.length} use case(s): ${useCases.join(', ')}');
}

String _buildInjectorContent(
  final String featureName,
  final String className,
  final List<String> useCases,
) {
  final String imports = _buildUseCaseImports(featureName, useCases);
  final String registrations = _buildUseCaseRegistrations(
    featureName,
    useCases,
  );

  return '''
import 'package:skill_bit/core/di/injection_container.dart';
$imports

void init${className}Feature() {
  //! Data Sources
  // sl.registerLazySingleton<${className}LocalDataSource>(() => ${className}LocalDataSourceImpl());
  // sl.registerLazySingleton<${className}RemoteDataSource>(() => ${className}RemoteDataSourceImpl());

  //! Repository
  // sl.registerLazySingleton<${className}Repo>(() => ${className}RepoImpl(sl()));

  //! Use Cases
$registrations

  //! Feature Bloc
  // sl.registerFactory(() => ${className}Bloc(sl()));
}
''';
}

String _buildUseCaseImports(
  final String featureName,
  final List<String> useCases,
) {
  return useCases
      .map((final String uc) {
        final String fileName = _toSnakeCase(uc);
        return "import 'package:skill_bit/features/$featureName/domain/usecases/$fileName.dart';";
      })
      .join('\n');
}

String _buildUseCaseRegistrations(
  final String featureName,
  final List<String> useCases,
) {
  return useCases
      .map((final String uc) {
        return '  sl.registerLazySingleton(() => $uc(${featureName}Repo: sl()));';
      })
      .join('\n');
}

// ─── Main Container ──────────────────────────────────────────────────────────

void _updateMainContainer(final String className, final String featureName) {
  final File mainFile = File('lib/core/di/injection_container.dart');
  if (!mainFile.existsSync()) return;

  String content = mainFile.readAsStringSync();
  content = _addImportIfMissing(content, featureName);
  content = _addFunctionCallIfMissing(content, className, featureName);
  mainFile.writeAsStringSync(content);

  print('✅ Feature successfully stitched into injection_container.dart');
}

String _addImportIfMissing(final String content, final String featureName) {
  final String importLine =
      "import 'package:skill_bit/core/di/injectors/${featureName}_injector.dart';";
  if (content.contains(importLine)) return content;
  return '$importLine\n$content';
}

String _addFunctionCallIfMissing(
  final String content,
  final String className,
  final String featureName,
) {
  final String callLine = '  init${className}Feature();';
  if (content.contains(callLine)) return content;
  return _injectFunctionCall(content, callLine);
}

String _injectFunctionCall(final String content, final String callLine) {
  final RegExp initFunctionRegex = RegExp(
    r'void\s+init\s*\(\s*\)\s*(async\s*)?\{',
  );

  if (content.contains(initFunctionRegex)) {
    return content.replaceFirstMapped(initFunctionRegex, (final Match match) {
      return '${match.group(0)}\n$callLine';
    });
  }

  return content.replaceFirst('  //! Features', '  //! Features\n$callLine');
}

// ─── Git ─────────────────────────────────────────────────────────────────────

void _gitAdd(final String filePath) {
  final ProcessResult result = Process.runSync('git', <String>[
    'add',
    filePath,
  ]);
  print(
    result.exitCode == 0
        ? '✅ File added to git!'
        : '❌ Git add failed: ${result.stderr}',
  );
}

// ─── Helpers ─────────────────────────────────────────────────────────────────

String _toSnakeCase(final String input) {
  return input
      .replaceAllMapped(
        RegExp(r'[A-Z]'),
        (final Match m) => '_${m.group(0)!.toLowerCase()}',
      )
      .replaceFirst(RegExp(r'^_'), '');
}

String _toClassName(final String featureName) {
  return featureName[0].toUpperCase() + featureName.substring(1);
}
