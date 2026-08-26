import '../../../../core/error/result.dart';
import '../../data/models/vehicle_model.dart';
import '../../data/models/service_job_model.dart';

abstract class VehicleRepository {
  Future<Result<VehicleModel>> getVehicle(int id);
  Future<Result<VehicleModel>> createVehicle(VehicleCreateRequest request);
  Future<Result<List<ServiceJobModel>>> getVehicleHistory(int vehicleId);
}
