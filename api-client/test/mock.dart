import 'package:api_client/app/data/data.dart';
import 'package:api_client/app/domain/domain.dart';
import 'package:api_client/app/infra/infra.dart';
import 'package:mocktail/mocktail.dart';

class MockGetClientesUseCase extends Mock implements GetClientesUseCase {}

class MockGetClientesGateway extends Mock implements GetClientesGateway {}

class MockGetClientesDao extends Mock implements GetClientesDao {}

class MockConnection extends Mock implements Connection {}

final clienteMock =
    Cliente(id: 1, nome: 'nome', email: 'email', telefone: 'telefone');
