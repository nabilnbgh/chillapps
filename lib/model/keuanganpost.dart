class KeuanganPost {
  //constructor
  KeuanganPost({this.desc, this.amount, this.category, this.source});
  //property
  String? desc;
  int? amount;
  String? category;
  String? source;

  Map toJson() => {
        'description': desc,
        'amount': amount,
        'category': category,
        'source': source,
      };
}
