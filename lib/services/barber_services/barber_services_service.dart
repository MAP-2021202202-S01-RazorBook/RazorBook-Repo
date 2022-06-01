import '../../models/service.dart';

abstract class BarberServicesService
{

  List<Service>? get servicesList => null;
   Future<void> getServices({required String userID});
   Future<void> addlService({String? bookingID});

}