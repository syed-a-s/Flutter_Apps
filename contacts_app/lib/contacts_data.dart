// contacts_data.dart
class Contact {  // a simple class where contact is defined
  String fullName;
  String phone;
  String email;
  String address;

  Contact( this.fullName, this.phone,
      this.email, this.address );
}

// To make the example as simple as possible,
// hardcode the initial data
List<Contact> myContactsList = [
  Contact(
    'Romain Hoogmoed',
    '478-301-6621',
    'romain.hoogmoed@live.mercer.edu',
    'Mercer, Macon, GA'
  ),
  Contact(
    'Emilie Lilly Olsen',
    '706-542-3428',
    'emilie.olsen@uga.edu',
    'UGA, Athens, GA'
  ),
  Contact(
    'John H. Doe',
    '478-987-1123',
    'john.doe@macon.com',
    'City Hall, Macon, GA'
  ),
  Contact(
    'Mary Roe',
    '478-691-9016',
    'mary.roe@airforce.gov',
    'Robins AFB, Warner Robins, GA'
  ),
  Contact(
    'Everett Reynolds',
    '911-911-9119',
    'everret@reynolds.com',
    'Mercer University, Macon, GA'
  ),
  Contact(
    'Maddie Persinger',
    '301-301-4111',
    'maddie@persinger.com',
    'Mercer University, Macon, GA',
  ),
  Contact(
    'Syed Saadat',
    '678-987-6543',
    'saadat@syed.com',
    'Mercer University, Macon, GA',
  ),
  Contact (
    'Dr. Donald Ekong',
    '888-888-0000',
    'doctor@ekong.com',
    'EGC Building, Macon, GA'
  ),
  Contact(
    'Mom',
    '871-312-1255',
    'someones@mom.com',
    'Austin, Texas',
  ),
];
