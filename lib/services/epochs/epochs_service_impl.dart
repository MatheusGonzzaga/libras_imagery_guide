import 'package:libras_imagery_guide/models/simple_model.dart';
import 'package:libras_imagery_guide/repositories/epochs/epochs_repository.dart';
import 'package:libras_imagery_guide/services/epochs/epochs_service.dart';

class EpochsServiceImpl implements EpochsService {
  final EpochsRepository _epochsRepository;

  EpochsServiceImpl({
    required EpochsRepository epochsRepository,
  }) : _epochsRepository = epochsRepository;

  @override
  Future<List<SimpleModel>> getEpochs() async =>
      await _epochsRepository.getEpochs();
}
