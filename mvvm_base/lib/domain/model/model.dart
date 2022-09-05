class SliderObject{
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}

class Customer{
  String id;
  String name;
  int numOfNotification;

  Customer(this.id, this.name, this.numOfNotification);
}

class Contact{
  String email;
  String phone;
  String link;

  Contact(this.email, this.phone, this.link);
}

class Authentication{
  Contact? contact;
  Customer? customer;

  Authentication(this.contact, this.customer);
}

class DeviceInfo{
  String name;
  String identifier;
  String version;

  DeviceInfo(this.name, this.identifier, this.version);
}