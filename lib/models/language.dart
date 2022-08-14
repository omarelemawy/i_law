class Language {
  final int id;
  final String flag;
  final String name;
  final String languageCode;

  Language(this.id, this.flag, this.name, this.languageCode);

  static List<Language> languageList() {
    return <Language>[
      Language(1, "🇺🇸", "English", "en"),
      Language(2, "🇫🇷", "Franca", "fr"),
      Language(3, "🇸🇦", "العربية", "ar"),
    ];
  }
}


class Currency {
  final int id;
  final String flag;
  final String name;
  final String languageCode;

  Currency(this.id, this.flag, this.name, this.languageCode);

  static List<Currency> languageList() {
    return <Currency>[
      Currency(1, "🇺🇸", "USD", "en"),
      Currency(3, "🇸🇦", "EUD", "ar"),
    ];
  }
}

