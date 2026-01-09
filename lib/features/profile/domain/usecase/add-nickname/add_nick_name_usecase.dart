import 'package:deehelp/core/base/use_case.dart';
import 'package:deehelp/core/utils/unit.dart';
import 'package:deehelp/core/utils/result.dart';
import 'package:deehelp/features/profile/domain/repository/nickname_repository.dart';
import 'package:deehelp/features/profile/domain/usecase/add-nickname/add_nick_name_dto.dart';

class AddNickNameUsecase implements UseCase<AddNickNameDto, Unit> {
  final NicknameRepository _repository;

  AddNickNameUsecase({required NicknameRepository repository})
      : _repository = repository;

  @override
  Future<Result<Unit>> execute(AddNickNameDto dto) async {
    await _repository.addNickname(dto.name, dto.userId);
    return Result.success(const Unit());
  }
}
