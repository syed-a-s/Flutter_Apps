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
];