
import 'package:fruits_and_veggies/src/authenication/authenication_repository.dart';
import 'package:fruits_and_veggies/src/authenication/user_repository.dart';
import 'package:get/get.dart';

class HomepageController extends GetxController {
  static HomepageController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  /////Get user email
  Future<dynamic> getUserData() async {
    final email = _authRepo.firebaseUser.value?.email;
    if(email != null){
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar("Error", "Login to continue");
    }
  }

// Future<List<UserModel>> getAllUser() async {
//   return await _userRepo.allUser();
// }
}