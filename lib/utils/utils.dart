import 'package:url_launcher/url_launcher.dart';

Future<void> launchLink(String urlString) async {
  final Uri url = Uri.parse(urlString);
  if (await canLaunchUrl(url)) {
    await launchUrl(url, webOnlyWindowName: '_blank');
  } else {
    throw 'No se pudo abrir $url';
  }
}

Future<void> launchEmail(String email,
    {String subject = '', String body = ''}) async {
  final Uri emailUri = Uri(
    scheme: 'mailto',
    path: email,
    queryParameters: {
      'subject': subject,
      'body': body,
    },
  );

  if (await canLaunchUrl(emailUri)) {
    await launchUrl(emailUri);
  } else {
    throw 'No se pudo abrir el cliente de correo';
  }
}
