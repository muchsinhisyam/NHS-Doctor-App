class User{
  String firstname;
  String lastname;
  String date;
  String status;

  User({
    this.firstname, this.lastname, this.date, this.status
  });

  static List<User> getUsers(){
    return <User>[
      User(firstname: 'Muchsin', lastname: 'Hisyam', date: '23/03/2021', status: "Done"),
      User(firstname: 'Jason', lastname: 'Sianandar', date: '23/03/2021', status: "Done"),
      User(firstname: 'Vedro', lastname: 'Suwandi', date: '25/03/2021', status: "Canceled"),
      User(firstname: 'Ellery', lastname: 'Braun', date: '28/03/2021', status: "Waiting"),
      User(firstname: 'Kruger', lastname: 'Yeager', date: '30/03/2021', status: "Waiting"),
    ];
  }
}