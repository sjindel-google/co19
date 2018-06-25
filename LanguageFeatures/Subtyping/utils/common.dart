library subtyping_common;

dynamic forgetType(dynamic d) => d;
class IsGenericFunctionTypeTestClass<T> {}

bool isGenericFunctionType<T>() {
  bool result = false;
  try {
    new IsGenericFunctionTypeTestClass<T>();
  } on Error {
    result = true;
  }
  return result;
}