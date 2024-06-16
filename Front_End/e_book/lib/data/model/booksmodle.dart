class BooksModel {
  int? bookId;
  String? bookName;
  String? bookNameAuther;
  String? bookDesc;
  String? bookImage;
  int? bookPageCount;
  String? bookPdf;
  String? bookDate;
  int? bookCa;
  int? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImage;

  BooksModel(
      {this.bookId,
      this.bookName,
      this.bookNameAuther,
      this.bookDesc,
      this.bookImage,
      this.bookPageCount,
      this.bookPdf,
      this.bookDate,
      this.bookCa,
      this.categoriesId,
      this.categoriesName,
      this.categoriesNameAr,
      this.categoriesImage});

  BooksModel.fromJson(Map<String, dynamic> json) {
    bookId = json['Book_id'];
    bookName = json['Book_name'];
    bookNameAuther = json['Book_name_auther'];
    bookDesc = json['Book_desc'];
    bookImage = json['Book_image'];
    bookPageCount = json['Book_page_count'];
    bookPdf = json['Book_pdf'];
    bookDate = json['Book_date'];
    bookCa = json['Book_ca'];
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesImage = json['categories_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Book_id'] = bookId;
    data['Book_name'] = bookName;
    data['Book_name_auther'] = bookNameAuther;
    data['Book_desc'] = bookDesc;
    data['Book_image'] = bookImage;
    data['Book_page_count'] = bookPageCount;
    data['Book_pdf'] = bookPdf;
    data['Book_date'] = bookDate;
    data['Book_ca'] = bookCa;
    data['categories_id'] = categoriesId;
    data['categories_name'] = categoriesName;
    data['categories_name_ar'] = categoriesNameAr;
    data['categories_image'] = categoriesImage;
    return data;
  }
}
// class BookModel {
//   List<Categories>? categories;
//   List<Allbook>? allbook;

//   BookModel({this.categories, this.allbook});

//   BookModel.fromJson(Map<String, dynamic> json) {
//     if (json['categories'] != null) {
//       categories = <Categories>[];
//       json['categories'].forEach((v) {
//         categories!.add(new Categories.fromJson(v));
//       });
//     }
//     if (json['allbook'] != null) {
//       allbook = <Allbook>[];
//       json['allbook'].forEach((v) {
//         allbook!.add(new Allbook.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.categories != null) {
//       data['categories'] = this.categories!.map((v) => v.toJson()).toList();
//     }
//     if (this.allbook != null) {
//       data['allbook'] = this.allbook!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Categories {
//   int? categoriesId;
//   String? categoriesName;
//   String? categoriesNameAr;
//   String? categoriesImage;

//   Categories(
//       {this.categoriesId,
//       this.categoriesName,
//       this.categoriesNameAr,
//       this.categoriesImage});

//   Categories.fromJson(Map<String, dynamic> json) {
//     categoriesId = json['categories_id'];
//     categoriesName = json['categories_name'];
//     categoriesNameAr = json['categories_name_ar'];
//     categoriesImage = json['categories_image'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['categories_id'] = this.categoriesId;
//     data['categories_name'] = this.categoriesName;
//     data['categories_name_ar'] = this.categoriesNameAr;
//     data['categories_image'] = this.categoriesImage;
//     return data;
//   }
// }

// class Allbook {
//   int? bookId;
//   String? bookName;
//   String? bookNameAuther;
//   String? bookDesc;
//   String? bookImage;
//   int? bookPageCount;
//   String? bookPdf;
//   String? bookDate;
//   int? bookCa;
//   int? categoriesId;
//   String? categoriesName;
//   String? categoriesNameAr;
//   String? categoriesImage;

//   Allbook(
//       {this.bookId,
//       this.bookName,
//       this.bookNameAuther,
//       this.bookDesc,
//       this.bookImage,
//       this.bookPageCount,
//       this.bookPdf,
//       this.bookDate,
//       this.bookCa,
//       this.categoriesId,
//       this.categoriesName,
//       this.categoriesNameAr,
//       this.categoriesImage});

//   Allbook.fromJson(Map<String, dynamic> json) {
//     bookId = json['Book_id'];
//     bookName = json['Book_name'];
//     bookNameAuther = json['Book_name_auther'];
//     bookDesc = json['Book_desc'];
//     bookImage = json['Book_image'];
//     bookPageCount = json['Book_page_count'];
//     bookPdf = json['Book_pdf'];
//     bookDate = json['Book_date'];
//     bookCa = json['Book_ca'];
//     categoriesId = json['categories_id'];
//     categoriesName = json['categories_name'];
//     categoriesNameAr = json['categories_name_ar'];
//     categoriesImage = json['categories_image'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Book_id'] = this.bookId;
//     data['Book_name'] = this.bookName;
//     data['Book_name_auther'] = this.bookNameAuther;
//     data['Book_desc'] = this.bookDesc;
//     data['Book_image'] = this.bookImage;
//     data['Book_page_count'] = this.bookPageCount;
//     data['Book_pdf'] = this.bookPdf;
//     data['Book_date'] = this.bookDate;
//     data['Book_ca'] = this.bookCa;
//     data['categories_id'] = this.categoriesId;
//     data['categories_name'] = this.categoriesName;
//     data['categories_name_ar'] = this.categoriesNameAr;
//     data['categories_image'] = this.categoriesImage;
//     return data;
//   }
// }
