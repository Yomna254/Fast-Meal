class HomeViewModel {
  final List<String> categories = [
    'مشروبات',
    'وجبات سريعة',
    'حلويات',
    'أكلات بحرية',
    'صندويش',
    'بيتزا',
    'أكلات غربية',
    'أكلات شرقية',
  ];

  final List<Map<String, String>> meals = [
    {'name': 'سمك مشوي', 'image': 'assets/images/fish2.png'},
    {'name': 'سمك بحري', 'image': 'assets/images/fish.jpg'},
  ];

  // مستقبلاً هنا هيكون فيه دالة fetchDataFromApi()
}
