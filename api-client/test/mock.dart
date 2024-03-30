import 'package:api_client/app/data/data.dart';
import 'package:api_client/app/domain/domain.dart';
import 'package:api_client/app/infra/infra.dart';
import 'package:mocktail/mocktail.dart';

class MockGetClientesUseCase extends Mock implements GetClientesUseCase {}

class MockAddClienteUseCase extends Mock implements AddClienteUseCase {}

class MockAddClienteGateway extends Mock implements AddClienteGateway {}

class MockGetClientesGateway extends Mock implements GetClientesGateway {}

class MockGetClientesDao extends Mock implements GetClientesDao {}

class MockGetClientePorEmail extends Mock implements GetClienteByEmailGateway {}

class MockConnection extends Mock implements DBConnection {}

final clienteMock =
    Cliente(id: 1, nome: 'nome', email: 'email', telefone: 'telefone');
