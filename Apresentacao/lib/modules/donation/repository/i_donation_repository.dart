import 'repository.dart';

abstract class IDonationRepository {
  Future<bool> postSendDonation(DonationRequest request, bool isEco);
}
