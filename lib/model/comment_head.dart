class CommentHead{
  String img;
  String title;
  String author;
  int count;
  int id; // id
  int type;

  CommentHead(this.img, this.title, this.author, this.count, this.id, this.type);



  CommentHead.fromJson(Map<String, dynamic> json) {
    img = json['img'];
    title = json['title'];
    author = json['author'];
    count = json['count'];
    id = json['id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img'] = this.img;
    data['title'] = this.title;
    data['author'] = this.author;
    data['count'] = this.count;
    data['id'] = this.id;
    data['type'] = this.type;
    return data;
  }
}