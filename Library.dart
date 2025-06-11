
class Book{
  String tittle;
  String author;
  String isbn;
  bool isAvailable;

  Book(this.tittle, this.author, this.isbn, this.isAvailable);
}
class Member{
  String name;
  String memberId;

  Member(this.name, this.memberId);
}
class Loan{
  Book book;
  Member member;
  DateTime loanDate;
  DateTime? returnDate;

  Loan(this.book, this.member, this.loanDate, [this.returnDate]);

  void returnBook(){
    returnDate = DateTime.now();
    book.isAvailable = true;
  }
}
class Library{
  List<Book> books = [];
  List<Loan> loans = [];

  void addBook(Book book){
    books.add(book);
  }
  void listbook(){
    print('------ List All Books in Library -----');
    for(var book in books){
      print(
        'Tittle: ${book.tittle}, Author: ${book.author}, ISBN: ${book.isbn}, Available: ${book.isAvailable}'
      );
    }
  }
  void loanBook(Book book, Member member){
    if(book.isAvailable){
      book.isAvailable = false;
      loans.add(Loan(book, member, DateTime.now()));
    }
    else{
      print('${book.tittle} is not Available');
    }
  }
  void listLoanedBooks(){
    print('------ List of Loaned Books ------');
    for(var loan in loans){
      print(
        'Tittle: ${loan.book.tittle}, Author: ${loan.book.tittle}, Loaned to: ${loan.member.name}, Loan Date: ${loan.loanDate}'
      );
    }
  }
}
void main(){

  Book book1 = Book('Khan is Always Right','Maaz','x78j9', true);
  Book book2 = Book('Hello World','Arif','k788j', true);

  Library library = Library();
  library.addBook(book1);
  library.addBook(book2);

  Member member1 = Member('John', 'x6876876');
  Member member2 = Member('Kock', 'k7878');

  library.loanBook(book2, member1);
  library.loanBook(book1, member2);

  library.listbook();
  library.listLoanedBooks();
}