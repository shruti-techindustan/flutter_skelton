class ErrorResponse {
  String field;
  String message;
  String errorType;
  String references;

  ErrorResponse({this.field, this.message, this.errorType, this.references});

  ErrorResponse.fromJson(Map<String, dynamic> json) {
    field = json['field'];
    message = json['message'];
    errorType = json['errorType'];
    references = json['references'];

    //if (field == "Authorization") {}
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['field'] = this.field;
    data['message'] = this.message;
    data['errorType'] = this.errorType;
    data['references'] = this.references;

    print(data.toString());
    return data;
  }
}
