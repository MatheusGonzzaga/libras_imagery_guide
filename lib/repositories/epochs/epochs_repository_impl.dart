import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:libras_imagery_guide/mock.dart';
import 'package:libras_imagery_guide/models/simple_model.dart';

import 'epochs_repository.dart';

class EpochsRepositoryImpl implements EpochsRepository {
  @override
  Future<List<SimpleModel>> getEpochs() async {
    final result =
        List<SimpleModel>.from(Mock.epochs.map((e) => SimpleModel.fromMap(e)));
    // await Future.delayed(Duration(seconds: 3), () {});
    return result;
  }

  @override
  Future<void> createEpoch({required SimpleModel epoch}) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    try {
      DocumentReference epochRef = await _firestore.collection('epochs').add({
        'name': epoch.name,
      });
      print('Epoch saved with ID: ${epochRef.id}');
    } catch (e) {
      print('Error saving epoch: $e');
    }
  }
}
