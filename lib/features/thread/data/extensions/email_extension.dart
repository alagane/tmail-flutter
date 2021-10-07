import 'package:jmap_dart_client/jmap/mail/email/email.dart';
import 'package:tmail_ui_user/features/thread/data/model/email_cache.dart';
import 'package:tmail_ui_user/features/thread/data/extensions/map_keywords_extension.dart';
import 'package:tmail_ui_user/features/thread/data/extensions/email_address_extension.dart';

extension EmailExtension on Email {

  EmailCache toEmailCache() {
    return EmailCache(
      id.toString(),
      keywords: keywords?.toMapString(),
      size: size?.value.round(),
      receivedAt: receivedAt?.value,
      hasAttachment: hasAttachment,
      preview: preview,
      subject: subject,
      sentAt: sentAt?.value,
      from: from?.map((emailAddress) => emailAddress.toEmailAddressHiveCache()).toList(),
      to: to?.map((emailAddress) => emailAddress.toEmailAddressHiveCache()).toList(),
      cc: cc?.map((emailAddress) => emailAddress.toEmailAddressHiveCache()).toList(),
      bcc: bcc?.map((emailAddress) => emailAddress.toEmailAddressHiveCache()).toList(),
      replyTo: replyTo?.map((emailAddress) => emailAddress.toEmailAddressHiveCache()).toList(),
    );
  }
}