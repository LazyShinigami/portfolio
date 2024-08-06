import 'package:emailjs/emailjs.dart' as emailjs;

class EmailService {
  sendEmail({String? name, String? message, String? email}) async {
    try {
      const serviceID = 'service_ozz1cdu';
      const templateID = 'template_dyrh5on';
      const publicKey = 'ki5ihP-HFgoBPfg3t';
      const privateKey = 'PWT23FtUjfYaxgOdzX8QT';

      await emailjs.send(
        serviceID, // Replace with your service ID
        templateID, // Replace with your template ID
        {
          'user_name': name,
          'user_email': email,
          'message': message,
          'subject': 'E-mail from portfolio website.'
        },
        const emailjs.Options(
          privateKey: privateKey,
          publicKey: publicKey, // Replace with your public key
        ),
      );
      print('Email sent successfully!');
      return true;
    } catch (error) {
      if (error is emailjs.EmailJSResponseStatus) {
        print('Error ---->>>> ${error.status}::::: ${error.text} <<<<----');
      } else {
        print('Error $error');
      }
      return false;
    }
  }

  // Future<bool> sendEmail({String? name, String? message, String? email}) async {
  //   try {
  //     await emailjs.send(
  //       'YOUR_SERVICE_ID',
  //       'YOUR_TEMPLATE_ID',
  //       templateParams,
  //       const emailjs.Options(
  //         publicKey: 'YOUR_PUBLIC_KEY',
  //       ),
  //     );
  //     print('SUCCESS!');
  //     return true;
  //   } catch (error) {
  //     if (error is emailjs.EmailJSResponseStatus) {
  //       print('ERROR... ${error.status}: ${error.text}');
  //     }
  //     print(error.toString());
  //     return false;
  //   }
  // }
}
