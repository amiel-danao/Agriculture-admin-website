String appendCountryCode(String phoneNumber, String countryCode) {
  final regex = RegExp(r'^\d{10}$'); // Regex to match 10-digit phone number

  if(phoneNumber.startsWith("0")){
    phoneNumber = phoneNumber.substring(1, phoneNumber.length);
  }

  if (!regex.hasMatch(phoneNumber)) {
    return phoneNumber; // Return original phone number if it doesn't match the expected format
  }

  return '$countryCode$phoneNumber';
}