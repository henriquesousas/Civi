import 'package:deehelp/business/_shared/use_case.dart';
import 'package:deehelp/business/archivement/archivement_repository.dart';
import 'package:deehelp/business/user/usecases/get_profile/archivement.dart';
import 'package:deehelp/core/failures/failure.dart';
import 'package:fpdart/fpdart.dart';

class GetArchivementUsecase extends UseCaseWithoutParam<Archivement> {
  final ArchivementRepository _repository;

  GetArchivementUsecase({required ArchivementRepository repository})
    : _repository = repository;

  @override
  TaskEither<Failure, Archivement> execute() {
    _repository.getArchivements().run();
    throw UnimplementedError();
  }
}
