import '../../models/service.dart';

abstract class BarberServicesService
{

  List<Service>? get servicesList => null;
   Future<void> getServices({required String userID});
   Future<void> addService({String? userID, String? name, String? description, double? price});
   Future<void> editService({String? serviceID, String? name, String? description, double? price});
   Future<void> deleteService({required String serviceID});
}