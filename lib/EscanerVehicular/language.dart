class Language {
  int id;
  String name;
  String code;
  Language(this.id, this.name, this.code);

  static List<Language> getlanguages() {
    return <Language>[
      Language(1, 'English', 'en'),
      Language(2, 'spanish', 'es'),
    ];
  }
}
