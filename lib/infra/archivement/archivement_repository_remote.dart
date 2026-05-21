import 'package:deehelp/business/archivement/archivement.dart';
import 'package:deehelp/business/archivement/archivement_datasource.dart';
import 'package:deehelp/business/archivement/archivement_repository.dart';
import 'package:deehelp/core/failures/exports.dart';
import 'package:deehelp/core/failures/failure.dart';
import 'package:deehelp/infra/archivement/archivement_model.dart';
import 'package:fpdart/fpdart.dart';

class ArchimentRepositoryRemote implements ArchivementRepository {
  final ArchivementDatasource _datasource;

  ArchimentRepositoryRemote({required ArchivementDatasource datasource})
    : _datasource = datasource;

  @override
  TaskEither<Failure, List<Archivement>> getArchivements() {
    return TaskEither.tryCatch(() async {
      final data = await _datasource.getArchivements();
      if (data == null) return [];
      final archivements = data
          .map((json) => ArchivementModel.fromJson(json).toArchivement())
          .toList();

      return archivements;
    }, (error, _) => error.toFailure());
  }
}

TaskEither<Failure, T> taskTryCatch<T>(Future<T> Function() task) {
  return TaskEither.tryCatch(task, (error, _) => error.toFailure());
}

extension FailureMapper on Object {
  Failure toFailure() {
    if (this is Failure) {
      return this as Failure;
    }

    return const UnexpectedFailure();
  }
}
