import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus { Online, Offline, Connecting }

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.Connecting;
  IO.Socket _socket;

  SocketService() {
    this._initConfig();
  }
  IO.Socket get socket => this._socket;
  Function get emit => this._socket.emit;
  ServerStatus get serverStatus => this._serverStatus;
  void _initConfig() {
    this._socket = IO.io('http://192.168.100.105:3000/', {
      'transports': ['websocket'],
      'autoConnect': true
    });

    this._socket.on('connect', (_) {
      print('connection');
      this._serverStatus = ServerStatus.Online;
      notifyListeners();
    });

    this._socket.on('disconnect', (_) {
      print('disconnect');
      this._serverStatus = ServerStatus.Offline;
      notifyListeners();
    });
  }
}
