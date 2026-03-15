abstract class Usecase<T, P> {
  const Usecase();
  Future<T> call(P params);
}

abstract class NoParamsUseCase<T> {
  const NoParamsUseCase();
  Future<T> call();
}
