import 'package:deehelp/core/domain/use_case.dart';
import 'package:deehelp/core/unit.dart';
import 'package:deehelp/core/utils/result.dart';
import 'package:deehelp/features/profile/domain/repository/profile_repository.dart';
import 'package:deehelp/features/profile/domain/usecases/add_nickname/add_nick_name_dto.dart';

class AddNickNameUsecase implements UseCase<AddNickNameDto, Unit> {
  final ProfileRepository _repository;

  AddNickNameUsecase({required ProfileRepository repository})
      : _repository = repository;

  @override
  Future<Result<Unit>> execute(AddNickNameDto dto) async {
    await _repository.addNickname(dto.name, dto.userId);
    return Result.success(const Unit());
  }
}
