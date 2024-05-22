///исключения API клиента

///исключение которое выбрасывается когда сервер не доступен
class ServerNotFoundFailure implements Exception {}

///исключение которое выбрасывается когда продукты не загружаются
class ProductLoadingFailure implements Exception {}