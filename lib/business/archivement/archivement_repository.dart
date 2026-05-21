import 'package:deehelp/business/archivement/archivement.dart';
import 'package:fpdart/fpdart.dart';

import '../../core/failures/exports.dart';

abstract interface class ArchivementRepository {
  TaskEither<Failure, List<Archivement>> getArchivements();
}
