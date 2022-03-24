class Note {
  late int _id;
  late String _title;
  String? _discription;
  late String _date;
  late int _priority;

  Note(this._title, this._date, this._priority, [this._discription]);
  Note.withId(this._id, this._title, this._date, this._priority,
      [this._discription]);

  int get id => _id;

  String get title => _title;

  String get discription => _discription!;

  int get priority => _priority;

  String get date => _date;

  set title(String newTitle) {
    if (newTitle.length <= 255) {
      this._title = newTitle;
    }
  }

  set discription(String newDiscription) {
    if (newDiscription.length <= 255) {
      this._discription = newDiscription;
    }
  }

  set priority(int newPriority) {
    if (newPriority >= 1 && newPriority <= 2) {
      this._priority = newPriority;
    }
  }

  set date(String newDate) {
    this._date = newDate;
  }

  // Convert a Note object into a Map object

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    if (id != null) {
      map['id'] = _id;
    }

    map['title'] = _title;
    map['discription'] = _discription;
    map['priority'] = _priority;
    map['date'] = _date;
    return map;
  }

  // Extract a Note object from a Map object

  Note.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._title = map['title'];
    this._discription = map['discription'];
    this._priority = map['priority'];
    this._date = map['date'];
  }
}
