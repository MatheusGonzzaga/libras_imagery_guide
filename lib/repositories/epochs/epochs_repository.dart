import 'package:libras_imagery_guide/models/simple_model.dart';

abstract interface class EpochsRepository {
  Future<List<SimpleModel>> getEpochs();
  Future<void> createEpoch({required SimpleModel epoch});
}
