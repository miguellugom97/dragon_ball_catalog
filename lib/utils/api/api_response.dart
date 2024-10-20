///Maneja la respuesta de la API.
class ApiResponse<T> {
  final T data;
  final int code;
  final String message;
  final bool success;

  ApiResponse.success(this.data, this.code, this.message) : success = true;

  ApiResponse.failure(this.code, this.message)
      : data = null as T,
        success = false;
}