import 'package:spot_a_camp/features/campsites/barrel.dart';

class CampsiteRepository {
  CampsiteRepository(this._campsiteDatasource);

  final CampsiteDatasource _campsiteDatasource;

  Future<List<Campsite>> getCampsites() async {
    final response = await _campsiteDatasource.getCampsites();
    final campsites = response.map((json) => Campsite.fromJson(json)).toList();
    return campsites;
  }
}
