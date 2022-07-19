
abstract class UseCase<Input, Output> {
  const UseCase();

  Future<Output> execute(Input params);
}