abstract class IHubService {
  Future<void> initConnection();

  void forwardMessage(dynamic message);
}
