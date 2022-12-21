class DataFetched {
  bool done;
  String errorMsg;

  DataFetched(this.done, this.errorMsg);
}

class AllUserDataFetched {
  bool done;
  String errorMsg;
  String nextPage;
  int totalPages;

  AllUserDataFetched(this.done, this.errorMsg, this.nextPage, this.totalPages);
}
