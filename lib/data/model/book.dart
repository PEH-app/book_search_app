// {
//     "title": "부의 여덟 기둥 (유대인은 어떻게 부를 구축하여 경제적 시간적 자유를 누리는가?)",
//     "link": "https://search.shopping.naver.com/book/catalog/44756133619",
//     "image": "https://shopping-phinf.pstatic.net/main_4475613/44756133619.20231221092307.jpg",
//     "author": "Harry Kim",
//     "discount": "15300",
//     "publisher": "더메이커",
//     "pubdate": "20240110",
//     "isbn": "9791187809500",
//     "description": "돈만으로 부를 구축하고 누릴 수 있을까?\n“부란, 건물을 짓듯, 여덟 개의 기둥을 오랜 세월 동안 전략적으로 구축해야만 가능하다”\n\n글로벌 사업가, 변호사, 스타트업 기업가 등의 전문가들이 극찬한 책!!\n\n이 책은 세계의 중요 영역을 주도하는 유대인들이 누리고 있는 부의 원리를 10여 년 동안 집중적으로 연구한 결과물이다. \n저자는 부는 돈만으로 구축되는 것이 아니라, 소득, 재정, 지혜, 일, 관계, 존경받음, 셀프 리더십, 평안 등의 여덟 기둥으로 구축되는 것임을 밝혀냈다. 저자는 부는 “물질적, 감정적, 관계적, 영적 웰빙(well-being)의 상태”라고 말한다. \n책에서 저자는 부의 여덟 기둥을 간결한 필치로 명료하게 풀어냈다. 오랜 시간 부의 여덟 기둥에 대한 연구와 실천적 사업가인 저자의 다양한 경험이 녹아있는 이 책은 독자들에게 부에 이르는 길을 명확하게 보여줄 것이다."
//   },

class Book {
  final String title;
  final String link;
  final String image;
  final String author;
  final String discount;
  final String publisher;
  final String pubdate;
  final String isbn;
  final String description;

  Book({
    required this.title,
    required this.link,
    required this.image,
    required this.author,
    required this.discount,
    required this.publisher,
    required this.pubdate,
    required this.isbn,
    required this.description,
  });

  Book.fromJson(Map<String, dynamic> json)
      : this(
          title: json["title"],
          link: json["link"],
          image: json["image"],
          author: json["author"],
          discount: json["discount"],
          publisher: json["publisher"],
          pubdate: json["pubdate"],
          isbn: json["isbn"],
          description: json["description"],
        );

  Map<String, dynamic> toJson() => {
        "title": title,
        "link": link,
        "image": image,
        "author": author,
        "discount": discount,
        "publisher": publisher,
        "pubdate": pubdate,
        "isbn": isbn,
        "description": description,
      };
}
