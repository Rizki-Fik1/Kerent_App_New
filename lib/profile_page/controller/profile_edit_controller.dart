import 'package:get/get.dart';
import 'package:kerent_app/profile_page/controller/profile_controller.dart';

class ProfileEditController extends GetxController {
  final ProfileAndRentalController _profileController = Get.find();

  //Follower and Following
  final RxInt followersCount = 0.obs;
  final RxInt followingCount = 0.obs;
  final RxList<Map<String, dynamic>> followers = <Map<String, dynamic>>[].obs;
  final RxList<Map<String, dynamic>> following = <Map<String, dynamic>>[].obs;


  // Define RxString instead of Rx for proper type safety
  late RxString _username;
  late RxString _classOrPosition;
  late RxString _description;
  late RxString _telephone;
  late RxString _email;
  late RxString _password;
  late RxString _profileImage;

  // Add RxList for rentedItems
  late RxList<Map<String, dynamic>> _rentedItems;

  @override
  void onInit() {
    super.onInit();
    loadFollowData();
    // Initialize with proper RxString values
    _username = _profileController.username;
    _classOrPosition = _profileController.classOrPosition;
    _description = _profileController.description;
    _telephone = ''.obs;
    _email = ''.obs;
    _password = ''.obs;
    _profileImage = _profileController.profileImage;
    _rentedItems = _profileController.rentedItems;
  }

      void loadFollowData() {
    // Dummy data for demonstration
    followers.value = [
      {'id': '1', 'username': 'King Affan', 'profileImage': '', 'classOrPosition': 'XI PPLG 2'},
      {'id': '2', 'username': 'Kiki', 'profileImage': '', 'classOrPosition': 'XI NYENI 2'},
    ];
    
    following.value = [
      {'id': '3', 'username': 'Putra Sigmos', 'profileImage': '', 'classOrPosition': 'XI NYENI 2'},
      {'id': '4', 'username': 'Dr. Rizki Fiko Febriansyah, S.Kom., M.Kom', 'profileImage': '', 'classOrPosition': 'Lecturer'},
    ];
    
    followersCount.value = followers.length;
    followingCount.value = following.length;
  }
  

  // Getters
  String get username => _username.value;
  String get classOrPosition => _classOrPosition.value;
  String get description => _description.value;
  String get telephone => _telephone.value;
  String get email => _email.value;
  String get password => _password.value;
  String get profileImage => _profileImage.value;
  List<Map<String, dynamic>> get rentedItems => _rentedItems;

  // Update methods
  void updateUsername(String newUsername) {
    _username.value = newUsername;
  }

  void updateClassOrPosition(String newClassOrPosition) {
    _classOrPosition.value = newClassOrPosition;
  }

  void updateDescription(String newDescription) {
    _description.value = newDescription;
  }

  void updateProfilePicture(String newProfilePicture) {
    _profileImage.value = newProfilePicture;
    _profileController.updateProfile(newProfileImage: newProfilePicture);
  }

  Future<void> updateTelephone(String newTelephone) async {
    await _verifyTelephone(newTelephone);
    _telephone.value = newTelephone;
  }

  Future<void> updateEmail(String newEmail) async {
    await _verifyEmail(newEmail);
    _email.value = newEmail;
  }

  Future<void> updatePassword(String newPassword) async {
    await _verifyPassword(newPassword);
    _password.value = newPassword;
  }

  Future<void> saveProfileChanges() async {
    _profileController.updateProfile(
      newUsername: _username.value,
      newClassOrPosition: _classOrPosition.value,
      newDescription: _description.value,
    );

    await updateTelephone(_telephone.value);
    await updateEmail(_email.value);
    await updatePassword(_password.value);
  }

  // Verification methods
  Future<void> _verifyTelephone(String newTelephone) async {
    // Implement verification logic
  }

  Future<void> _verifyEmail(String newEmail) async {
    // Implement verification logic
  }

  Future<void> _verifyPassword(String newPassword) async {
    // Implement verification logic
  }

  // Rented items methods
  void addBarangDisewakan(Map<String, dynamic> newItem) {
    _profileController.addBarangDisewakan(newItem);
  }

  void updateBarangDisewakan(String barangId, Map<String, dynamic> updatedData) {
    _profileController.updateBarangDisewakan(barangId, updatedData);
  }

  void deleteBarangDisewakan(String barangId) {
    _profileController.deleteBarangDisewakan(barangId);
  }
}