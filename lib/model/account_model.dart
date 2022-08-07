class Account{
  String email;
  String number;
  String adress;


  Account({required this.email,required this.number,required this.adress});

  Account.fromJson(Map<String, dynamic>json)
      :email=json['email'],
        number=json['number'],
        adress=json['adress'];

  Map<String, dynamic> toJson()=>{
    'email':email,
    'number':number,
    'adress':adress


  };


}