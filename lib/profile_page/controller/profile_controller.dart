//Profile View Controller
import 'package:get/get.dart';

class ProfileAndRentalController extends GetxController {
  // Profile Properties
  final RxString username = 'Hendro'.obs;
  final RxString profileImage = ''.obs;
  final RxString classOrPosition = 'Student'.obs;
  final RxString description = 'Kerent '.obs;

  //Follow/Follwoing
  final RxBool isFollowing = false.obs;
  final RxInt followersCount = 0.obs;
  final RxInt followingCount = 0.obs;
  final RxList<Map<String, dynamic>> followers = <Map<String, dynamic>>[].obs;
  final RxList<Map<String, dynamic>> following = <Map<String, dynamic>>[].obs;

  final RxList<Map<String, dynamic>> historyItems = <Map<String, dynamic>>[].obs;
  final RxList<Map<String, dynamic>> rentedItems = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAllHistory();
    getAllBarangDisewakan();
    loadFollowData();
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

    void toggleFollow() {
    isFollowing.value = !isFollowing.value;
    if (isFollowing.value) {
      followersCount.value++;
    } else {
      followersCount.value--;
    }
  }

  // Profile Methods
  void updateProfile({
    String? newUsername,
    String? newProfileImage,
    String? newClassOrPosition,
    String? newDescription,
  }) {
    if (newUsername != null) username.value = newUsername;
    if (newProfileImage != null) profileImage.value = newProfileImage;
    if (newClassOrPosition != null) classOrPosition.value = newClassOrPosition;
    if (newDescription != null) description.value = newDescription;
  }

  // History Rental Methods
  void getAllHistory() {
    // Simulate fetching history data
    historyItems.value = [
      {
        'transactionId': '1',
        'itemName': 'Camera Sony A7',
        'rentalDate': '2024-01-15',
        'returnDate': '2024-01-20',
        'price': 'Rp 150.000/Hari',
        'status': 'Proses',
        'imageUrl': ''
      },
      {
        'transactionId': '2',
        'itemName': 'Laptop Asus',
        'rentalDate': '2024-02-01',
        'returnDate': '2024-02-07',
        'price': 'Rp 300.000/Hari',
        'status': 'Selesai',
        'imageUrl': ''
      },
    ];
  }

  Map<String, dynamic>? getHistoryById(String transactionId) {
    return historyItems.firstWhere(
      (item) => item['transactionId'] == transactionId,
      orElse: () => {},
    );
  }

  void filterHistoryByDate(DateTime startDate, DateTime endDate) {
    // Implementation for filtering history by date range
  }

  void deleteHistory(String transactionId) {
    historyItems.removeWhere((item) => item['transactionId'] == transactionId);
  }


  // Barang Yang Disewakan Methods
  void getAllBarangDisewakan() {
    // Simulate fetching rented items data
    rentedItems.value = [
      {
        'barangId': '1',
        'name': 'Canon EOS R',
        'price': 'Rp 200.000/Hari',
        'description': 'Mirrorless camera with 30MP sensor',
        'imageUrl': ''
      },
      {
        'barangId': '2',
        'name': 'MacBook Pro M1',
        'price': 'Rp 350.000/Hari',
        'description': 'Latest MacBook with M1 chip',
        'imageUrl': ''
      },
    ];
  }

  Map<String, dynamic>? getBarangDisewakanById(String barangId) {
    return rentedItems.firstWhere(
      (item) => item['barangId'] == barangId,
      orElse: () => {},
    );
  }

  void addBarangDisewakan(Map<String, dynamic> newItem) {
    rentedItems.add(newItem);
  }

  void updateBarangDisewakan(String barangId, Map<String, dynamic> updatedData) {
    final index = rentedItems.indexWhere((item) => item['barangId'] == barangId);
    if (index != -1) {
      rentedItems[index] = {...rentedItems[index], ...updatedData};
    }
  }

  void deleteBarangDisewakan(String barangId) {
    rentedItems.removeWhere((item) => item['barangId'] == barangId);
  }
}