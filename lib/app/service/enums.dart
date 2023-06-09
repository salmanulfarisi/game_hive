class EnumClass {
  static platformCategoryEnum(int enumNum) {
    switch (enumNum) {
      case 1:
        return 'Console';
      case 2:
        return 'Arcade';
      case 3:
        return 'Platform';
      case 4:
        return 'Operating System';
      case 5:
        return 'Portable Console';
      case 6:
        return 'Computer';
      default:
        return 'No category';
    }
  }
}
