import 'package:grpc/grpc.dart';
import 'package:service/chillgen/son_service/public/son.pbgrpc.dart';

class SonService extends SonServiceBase {
  @override
  Future<SonHelloResponse> sayHelloFromSon(ServiceCall call, SonHelloRequest request) async {
    return SonHelloResponse()..response = "yep I am v2!";
  }
}

Future<void> main(List<String> args) async {
  final server = Server(
    [
      SonService(),
    ],
    const <Interceptor>[],
    CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
  );
  await server.serve(port: 80);
}
