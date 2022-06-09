import '../../models/service.dart';

// TESTED:
// 1- GET SERVICES
// 2- ADD SERVICE
// 3- EDIT SERVICE
// 4- DELETE SERVICE
abstract class BarberServicesService {
  List<Service>? get servicesList => null;
  Future<void> getServices({required String userID});
  Future<void> addService({required Service service});
  Future<void> editService(
      {required String serviceID, required Service updatedService});
  Future<void> deleteService({required String serviceID});
}
