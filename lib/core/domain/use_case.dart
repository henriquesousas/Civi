abstract class UseCase<IN, OUT> {
  Future<OUT> execute(IN dto);
}
