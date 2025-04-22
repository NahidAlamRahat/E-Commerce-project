class SignUpModel{

 final String firstName;
 final String lastName;
 final String email;
 final String mobile;
 final String password;
 final String city;

 SignUpModel(
     this.firstName,
     this.lastName,
     this.email,
     this.mobile,
     this.password,
     this.city,
     );

 Map<String, dynamic> toJson() {
 return {
   "first_name": firstName,
   "last_name": lastName,
   "email": email,
   "password": password,
   "phone": mobile,
   "city": city,
 };
 }

}
