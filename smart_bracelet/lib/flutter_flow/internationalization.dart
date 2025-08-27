import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar', 'fr'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? arText = '',
    String? frText = '',
  }) =>
      [enText, arText, frText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // termsandconditions
  {
    'alczfiiy': {
      'en': 'Politique de confidentialité',
      'ar': 'سياسة الخصوصية',
      'fr': '',
    },
    'fvsfg5on': {
      'en': 'Comment nous utilisons vos données',
      'ar': 'كيف نستخدم بياناتك',
      'fr': '',
    },
    'nbiyrnzl': {
      'en':
          'En utilisant cette application, vous acceptez les conditions suivantes :\n\n1-Utilisation prévue : Cette application est conçue pour que les professionnels de la santé puissent suivre les données des patients et fournir des conseils médicaux éclairés. Elle doit être utilisée comme un outil de soutien et ne doit pas remplacer une évaluation médicale directe.\n2-Confidentialité des données : Les données des patients sont traitées et stockées en toute sécurité, ce qui garantit leur confidentialité. L\'application suit les meilleures pratiques pour protéger les informations de santé sensibles conformément aux réglementations applicables en matière de protection de la vie privée.\n3-Responsabilité médicale : Bien que cette application aide au suivi du patient, les décisions médicales finales restent de la responsabilité du professionnel de santé. L\'application fournit des informations, mais le jugement clinique doit toujours guider les soins prodigués au patient.\n4-Amélioration continue : Nous nous engageons à améliorer l\'application pour mieux servir les médecins et leurs patients. Les mises à jour régulières peuvent inclure de nouvelles fonctionnalités, une précision accrue et une meilleure expérience utilisateur.\n5-Sécurité du compte : Les utilisateurs sont responsables de la sécurité de leurs identifiants de connexion et doivent s\'assurer que les informations relatives aux patients sont traitées avec soin.\n\nPour toute question ou assistance, veuillez vous adresser à la section d\'assistance de l\'application.\n',
      'ar':
          'Lorem ipsum dolor sit amet، consectetur adipiscing elit، sed do eiusmod tempor incidunt ut labore et dolore magna aliqua. Accumsan sit amet nulla facilisi morbi tempus. غير consectetur a erat nam. دونك ألتريسيس تينسيدونت قوس غير مخادع. Velit sed ullamcorper morbi tincidunt. Molestie a iaculis في erat pellentesque adipiscing. موريس نونك كونيج سيرة ذاتية. Nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla. Euismod lacinia في quis risus sed vulputate odio. فيليت كريمينسيم sodales ut eu sem سيرة ذاتية صحيحة justo eget. Risus feugiat في ما قبل ميتوس. Leo vel orci porta non pulvinar neque laoreet suspension interdum. Suscipit Tellus mauris a Diam Maecenas Sed enim ut sem. SEM السيرة الذاتية الصحيحة justo eget magna fermentum iaculis eu. لاسينيا في quis risus sed. Faucibus purus في ماسا مؤقت. ليو بقطر سوليتودين معرف مؤقت الاتحاد الأوروبي. Nisi scelerisque eu ultrices السيرة الذاتية موصل. Vulputate كريم معلق في وقت مبكر. Enim neque volutpat ac tincidunt vitae semper quis. Ipsum dolor sit amet consectetur adipiscing elit. Et malesuada fames ac turpis egestas maecenas pharetra convallis. Sed sed risus Préium quam vulputate. Elit pellentesque موطن morbi tristique senectus et. Viverra maecenas accumsan lacus vel facilisis volutpat est. sit amet mattis vulputate enim nulla. Nisi lacus sed viverra Tellus في العادة السيئة. اجلس أميت ريسوس نولام إيجيت فيليس إيجيت نونك لوبورتيز. Pretium lectus quam id leo in vitae. Adipiscing Diam donec adipiscing tristique. كومودو سيد egestas egestas fringilla. Ipsum dolor sit amet consectetur adipiscing. Ipsum dolor sit amet consectetur adipiscing النخبة pellentesque المعيشية morbi. مونتيس ناسيتور ريديكولوس موس موريس. Ut etiam sit amet nisl purus in. Arcu ac Ornare suspendisse sed nisi lacus sed viverra.',
      'fr': '',
    },
    'oks4x95o': {
      'en': 'Home',
      'ar': 'مسكن',
      'fr': '',
    },
  },
  // loading_page_Proj
  {
    'o6prpb1q': {
      'en': 'Bienvenue !',
      'ar': 'إنشاء الميزانيات',
      'fr': '',
    },
    '292pbdw7': {
      'en':
          'Suivez aisément votre santé avec une application intuitive et facile à utiliser.',
      'ar':
          'قم بإنشاء ميزانيات يمكنك ربط المعاملات بها أيضًا من أجل التتبع السهل.',
      'fr': '',
    },
    'b10xvuf9': {
      'en': 'Surveillez votre état de santé !',
      'ar': 'تتبع الإنفاق',
      'fr': '',
    },
    't6k1smsm': {
      'en':
          'Gardez un œil sur votre bien-être en temps réel, à tout moment et en tout lieu !',
      'ar': 'أضف المعاملات بسهولة وربطها بالميزانيات التي تم إنشاؤها.',
      'fr': '',
    },
    'u8xxj427': {
      'en': 'Voir en graphiques',
      'ar': 'تحليل الميزانية',
      'fr': '',
    },
    'iqi0pkmb': {
      'en':
          'Vos données de santé sous forme de graphiques clairs et compréhensibles.',
      'ar': 'تعرف على مكان ميزانياتك وكيف يمكن تعديلها.',
      'fr': '',
    },
    'uydm0fnm': {
      'en': 'Home',
      'ar': 'مسكن',
      'fr': '',
    },
  },
  // emergency_contact
  {
    'bgj5k6m6': {
      'en': 'En cas d\'urgence',
      'ar': '',
      'fr': '',
    },
    'aealp5x0': {
      'en': 'Numéro d\'urgence',
      'ar': '',
      'fr': '',
    },
    'yb316h3i': {
      'en': 'xx xxx xxx',
      'ar': '',
      'fr': '',
    },
    'j85hk0j4': {
      'en': 'Contacts principaux',
      'ar': '',
      'fr': '',
    },
    'fal3tflu': {
      'en': 'A',
      'ar': '',
      'fr': '',
    },
    'wfzz3gbe': {
      'en': 'Ahmed Ben Foulen',
      'ar': '',
      'fr': '',
    },
    'blgz2ij5': {
      'en': 'Fils • +216 xx xxx xxx',
      'ar': '',
      'fr': '',
    },
    '3xg0vaim': {
      'en': 'S',
      'ar': '',
      'fr': '',
    },
    'allojydm': {
      'en': 'Sarah Ben Foulen',
      'ar': '',
      'fr': '',
    },
    '6on7mguj': {
      'en': 'File • +216 xx xxx xxx',
      'ar': '',
      'fr': '',
    },
    'g7v3og6x': {
      'en': 'Contacts médicaux',
      'ar': '',
      'fr': '',
    },
    'dp8lwyy2': {
      'en': 'Dr. Michael Smith',
      'ar': '',
      'fr': '',
    },
    '72x3pge7': {
      'en': 'Primary Care • +216 xx xxx xxx',
      'ar': '',
      'fr': '',
    },
    'b7wi5to9': {
      'en': 'Hôpital de la ville',
      'ar': '',
      'fr': '',
    },
    'hxb5cvtw': {
      'en': 'Emergency Room • +216 xx xxx xxx',
      'ar': '',
      'fr': '',
    },
    'sqpquj4g': {
      'en': 'Add New Contact',
      'ar': '',
      'fr': '',
    },
  },
  // aideEtsupport
  {
    'lltxwoai': {
      'en': 'Aide et support',
      'ar': '',
      'fr': '',
    },
    'pzp1gtvb': {
      'en': 'Bienvenue !',
      'ar': '',
      'fr': '',
    },
    'fnodxvjq': {
      'en': 'Nous Appeler',
      'ar': '',
      'fr': '',
    },
    'bqykl57d': {
      'en': 'Envoyer un courriel',
      'ar': '',
      'fr': '',
    },
    'dfqafkwi': {
      'en': 'Recherche sur FAQ',
      'ar': '',
      'fr': '',
    },
    'cij05t57': {
      'en': 'Nom complet',
      'ar': '',
      'fr': '',
    },
    '0yal1ejt': {
      'en': 'Adresse mail',
      'ar': '',
      'fr': '',
    },
    'o6bqgg8p': {
      'en':
          'Décrivez brièvement votre problème..\n(par exemple, \"La fréquence cardiaque n\'est pas mise à jour\")',
      'ar': '',
      'fr': '',
    },
    'qa4qebms': {
      'en': 'Télécharger une capture d\'écran',
      'ar': '',
      'fr': '',
    },
    'tps5dt9m': {
      'en': 'Envoyer',
      'ar': '',
      'fr': '',
    },
    'qsh0trfh': {
      'en': 'Home',
      'ar': '',
      'fr': '',
    },
  },
  // support_message_sent
  {
    '6x9t4mg6': {
      'en':
          'Votre demande a été soumise. Notre équipe vous contactera bientôt !',
      'ar':
          'عمل رائع ، لقد قمت بتحويل الأموال بنجاح. قد يستغرق خروج الأموال من حسابك بضعة أيام.',
      'fr': '',
    },
    'kbgi6gq1': {
      'en': 'D\'accord',
      'ar': 'تمام',
      'fr': '',
    },
    'oe6do3vl': {
      'en': 'Home',
      'ar': 'مسكن',
      'fr': '',
    },
  },
  // faq
  {
    'bdpfj14q': {
      'en': 'Questions fréquemment posées',
      'ar': '',
      'fr': '',
    },
    '99c9hc22': {
      'en': 'Avez-vous des questions ?',
      'ar': '',
      'fr': '',
    },
    '8v3gmyo5': {
      'en': 'Message...',
      'ar': '',
      'fr': '',
    },
    'h23oortz': {
      'en': 'feedback page ',
      'ar': '',
      'fr': '',
    },
    'smghzh0c': {
      'en': 'Exemples de questions fréquemment posées:',
      'ar': '',
      'fr': '',
    },
    'brqwyuxb': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'crouloye': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'wtpm9scc': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '5xddei4u': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'ioq9urdr': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'y5ie2q6e': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '75nfbgmu': {
      'en':
          '1 - À quoi sert cette application ?\nCette application permet aux médecins de surveiller en temps réel les données de santé de leurs patients et de leur fournir des conseils médicaux.\n\n2 - Quels paramètres de santé puis-je suivre ?\nL’application suit la fréquence cardiaque, la saturation en oxygène (SpO2), la température corporelle et la localisation GPS pour assurer la sécurité du patient.\n\n3 - À quelle fréquence les données de santé sont-elles mises à jour ?\nLes données sont mises à jour en temps réel, mais la fréquence des mises à jour dépend des conditions du réseau et des paramètres du bracelet du patient.\n\n4 - Que dois-je faire si les paramètres de santé d’un patient déclenchent une alerte ?\nVous recevrez une notification dans l’application. Contactez immédiatement le patient et fournissez-lui des conseils médicaux en fonction de l’alerte.\n\n5 - Les données des patients sont-elles sécurisées ?\nOui, toutes les données des patients sont cryptées et stockées en toute sécurité, conformément aux réglementations sur la protection des données de santé.\n\n6 - J’ai trouvé un bug ou un problème. Comment puis-je le signaler ?\nVous pouvez signaler les bugs via la section support de l’application ou en envoyant un e-mail à notre équipe technique.',
      'ar': '',
      'fr': '',
    },
    'd2d7cxs5': {
      'en': 'Home',
      'ar': '',
      'fr': '',
    },
  },
  // popoutlogout
  {
    'cm44a9d0': {
      'en': 'déconnection',
      'ar': '',
      'fr': '',
    },
    'u48nyd6g': {
      'en':
          'Êtes-vous sûr de vouloir vous déconnecter ? Vous devrez vous reconnecter pour accéder à votre compte.',
      'ar': '',
      'fr': '',
    },
    'ca9tpzi5': {
      'en': 'Annuler',
      'ar': '',
      'fr': '',
    },
    'hj4qwl1j': {
      'en': 'Se déconnecter',
      'ar': '',
      'fr': '',
    },
  },
  // feedback
  {
    'rsinq2br': {
      'en': 'Évaluez-nous ! :',
      'ar': '',
      'fr': '',
    },
    '2pdddveb': {
      'en':
          'Donnez-nous votre avis sur notre application et suggérez des améliorations :',
      'ar': '',
      'fr': '',
    },
    'khwosvyf': {
      'en': 'Écrivez vos opinions ici...',
      'ar': '',
      'fr': '',
    },
    'ftvdqaxn': {
      'en': 'soumettre',
      'ar': '',
      'fr': '',
    },
    'ocqd9ujh': {
      'en': 'Home',
      'ar': '',
      'fr': '',
    },
  },
  // locationpage
  {
    'kkcntvah': {
      'en': 'Établissements de santé à proximité',
      'ar': '',
      'fr': '',
    },
    'kod5oex3': {
      'en': 'Rechercher des lieux à proximité...',
      'ar': '',
      'fr': '',
    },
    'cacla25h': {
      'en': 'Categories',
      'ar': '',
      'fr': '',
    },
    'rfafpbj7': {
      'en': 'voir tous',
      'ar': '',
      'fr': '',
    },
    'rm308b7y': {
      'en': 'Hôpitaux',
      'ar': '',
      'fr': '',
    },
    '1axju3f5': {
      'en': 'Pharmacies',
      'ar': '',
      'fr': '',
    },
    '072tny97': {
      'en': 'Drugstores',
      'ar': '',
      'fr': '',
    },
    'aiaknpmi': {
      'en': 'Cliniques',
      'ar': '',
      'fr': '',
    },
    'ftkt2zc7': {
      'en': 'Soins d\'urgence',
      'ar': '',
      'fr': '',
    },
    'kbtu4fev': {
      'en': 'Lieux à proximité',
      'ar': '',
      'fr': '',
    },
    'tptb7llr': {
      'en': '2.5 kilometres',
      'ar': '',
      'fr': '',
    },
    'q2h4p3lp': {
      'en': 'Hôpital Général de la Ville',
      'ar': '',
      'fr': '',
    },
    '1466oko5': {
      'en': 'Hospital',
      'ar': '',
      'fr': '',
    },
    'ow3pkdc0': {
      'en': 'À 1,3 km • Ouvert 24h/24 et 7j/7',
      'ar': '',
      'fr': '',
    },
    '0f2wxa0s': {
      'en': '4.2',
      'ar': '',
      'fr': '',
    },
    '6xzm6lkr': {
      'en': 'Pharmacie MediCare',
      'ar': '',
      'fr': '',
    },
    'uv2768vd': {
      'en': 'Pharmacy',
      'ar': '',
      'fr': '',
    },
    'd66s9i68': {
      'en': '1.2 km  • ouvert jusqu\'a 22:00',
      'ar': '',
      'fr': '',
    },
    '67emnl0u': {
      'en': '4.5',
      'ar': '',
      'fr': '',
    },
    '72fzp4iw': {
      'en': 'HealthPlus Drugstore',
      'ar': '',
      'fr': '',
    },
    'k6xmdodn': {
      'en': 'Drugstore',
      'ar': '',
      'fr': '',
    },
    '3s2nuu8d': {
      'en': '1.5 km• ouvert jusqu\'a 21:00',
      'ar': '',
      'fr': '',
    },
    '5agnxumm': {
      'en': '4.0',
      'ar': '',
      'fr': '',
    },
  },
  // medecinepage
  {
    '6e8vwpzm': {
      'en': 'Suivi des Médicaments',
      'ar': '',
      'fr': '',
    },
    'jszssf5z': {
      'en': 'Mes Médicaments',
      'ar': '',
      'fr': '',
    },
    '03rsa9fr': {
      'en': 'add med',
      'ar': '',
      'fr': '',
    },
    'b7mlv3c4': {
      'en': 'Suivez vos médicaments et leurs horaires de prise',
      'ar': '',
      'fr': '',
    },
    'd6xsgy0u': {
      'en': 'Amoxicilline',
      'ar': '',
      'fr': '',
    },
    'th70pbvv': {
      'en': '500mg - Antibiotique',
      'ar': '',
      'fr': '',
    },
    'pu8olyqi': {
      'en': 'En cours',
      'ar': '',
      'fr': '',
    },
    'lrt98mg8': {
      'en': 'Période:',
      'ar': '',
      'fr': '',
    },
    't4ygfpl3': {
      'en': '15 Mai 2023 - 22 Mai 2023',
      'ar': '',
      'fr': '',
    },
    'rl31bgab': {
      'en': 'Fréquence:',
      'ar': '',
      'fr': '',
    },
    '6cye1de8': {
      'en': '3 fois par jour',
      'ar': '',
      'fr': '',
    },
    'yxln1yp0': {
      'en': 'Paracétamol',
      'ar': '',
      'fr': '',
    },
    '8x8dmd15': {
      'en': '1000mg - Analgésique',
      'ar': '',
      'fr': '',
    },
    '8md16x50': {
      'en': 'Renouvellement nécessaire',
      'ar': '',
      'fr': '',
    },
    'qo232com': {
      'en': 'Période:',
      'ar': '',
      'fr': '',
    },
    'pde3jgth': {
      'en': '10 Mai 2023 - 10 Juin 2023',
      'ar': '',
      'fr': '',
    },
    'ni09q3ll': {
      'en': 'Fréquence:',
      'ar': '',
      'fr': '',
    },
    'd0j4qw3i': {
      'en': 'Si nécessaire (max 4/jour)',
      'ar': '',
      'fr': '',
    },
    'yvqfryi8': {
      'en': 'Metformine',
      'ar': '',
      'fr': '',
    },
    '09ffs6nq': {
      'en': '850mg - Antidiabétique',
      'ar': '',
      'fr': '',
    },
    '5u2ook9j': {
      'en': 'Terminé',
      'ar': '',
      'fr': '',
    },
    'u7ac6lti': {
      'en': 'Période:',
      'ar': '',
      'fr': '',
    },
    'cnacyp70': {
      'en': '1 Avril 2023 - 1 Mai 2023',
      'ar': '',
      'fr': '',
    },
    'hxsbf2tf': {
      'en': 'Fréquence:',
      'ar': '',
      'fr': '',
    },
    '1kt9s7o7': {
      'en': '2 fois par jour',
      'ar': '',
      'fr': '',
    },
    'k3ja03qd': {
      'en': 'Amlodipine',
      'ar': '',
      'fr': '',
    },
    'vpzyzrub': {
      'en': '5mg - Antihypertenseur',
      'ar': '',
      'fr': '',
    },
    '1adxxtql': {
      'en': 'Omise',
      'ar': '',
      'fr': '',
    },
    'evafqamz': {
      'en': 'Période:',
      'ar': '',
      'fr': '',
    },
    'q05hi9cj': {
      'en': '1 Mai 2023 - Indéfini',
      'ar': '',
      'fr': '',
    },
    'mzd9at0t': {
      'en': 'Fréquence:',
      'ar': '',
      'fr': '',
    },
    'b74m8495': {
      'en': '1 fois par jour',
      'ar': '',
      'fr': '',
    },
    'uglfmrw9': {
      'en': 'Ajouter un médicament',
      'ar': '',
      'fr': '',
    },
  },
  // addmedicine
  {
    'lmwpwu7a': {
      'en': 'Ajouter un Médicament',
      'ar': '',
      'fr': '',
    },
    'sdtdndl6': {
      'en': 'Informations du Médicament',
      'ar': '',
      'fr': '',
    },
    'ci78b23x': {
      'en': 'Nom du Médicament',
      'ar': '',
      'fr': '',
    },
    '456gbz0b': {
      'en': 'ex: Paracétamol',
      'ar': '',
      'fr': '',
    },
    '96gefgfw': {
      'en': 'Grammage',
      'ar': '',
      'fr': '',
    },
    'da39adm8': {
      'en': 'ex: 500mg',
      'ar': '',
      'fr': '',
    },
    'sna4a2hd': {
      'en': 'Fréquence d\'utilisation',
      'ar': '',
      'fr': '',
    },
    'z46xxkfg': {
      'en': 'Sélectionner',
      'ar': '',
      'fr': '',
    },
    'cejkzwjq': {
      'en': 'Une fois par jour',
      'ar': '',
      'fr': '',
    },
    'h7ywig5z': {
      'en': 'Deux fois par jour',
      'ar': '',
      'fr': '',
    },
    'o3oqj7xu': {
      'en': 'Trois fois par jour',
      'ar': '',
      'fr': '',
    },
    '66ty9acx': {
      'en': 'Quatre fois par jour',
      'ar': '',
      'fr': '',
    },
    '14embrkj': {
      'en': 'Au besoin',
      'ar': '',
      'fr': '',
    },
    '8jmw6otc': {
      'en': 'Durée du traitement',
      'ar': '',
      'fr': '',
    },
    'q6u221ub': {
      'en': 'Nombre de jours',
      'ar': '',
      'fr': '',
    },
    'ewksgr2g': {
      'en': 'Dates',
      'ar': '',
      'fr': '',
    },
    'tqxmuwah': {
      'en': 'Date de début',
      'ar': '',
      'fr': '',
    },
    'i6vvlb2f': {
      'en': 'Date \n (JJ/MM/YYYY)',
      'ar': '',
      'fr': '',
    },
    'lfk7ewt7': {
      'en': 'Date de fin',
      'ar': '',
      'fr': '',
    },
    'bhblapxi': {
      'en': 'Date \n (JJ/MM/YYYY)',
      'ar': '',
      'fr': '',
    },
    'knziyswm': {
      'en': 'Statut du Médicament',
      'ar': '',
      'fr': '',
    },
    'umn5itdf': {
      'en': 'Sélectionner le statut',
      'ar': '',
      'fr': '',
    },
    'cn3yyq7z': {
      'en': 'En attente',
      'ar': '',
      'fr': '',
    },
    '4w3jvukq': {
      'en': 'En cours',
      'ar': '',
      'fr': '',
    },
    'i3mc786x': {
      'en': 'Terminé',
      'ar': '',
      'fr': '',
    },
    'kg6vee5w': {
      'en': 'Omise',
      'ar': '',
      'fr': '',
    },
    'cb1bt99p': {
      'en': 'Renouvellement nécessaire',
      'ar': '',
      'fr': '',
    },
    'kvag4ino': {
      'en': 'Notes Additionnelles',
      'ar': '',
      'fr': '',
    },
    '3tna4bci': {
      'en': 'Ajoutez des instructions ou des notes supplémentaires...',
      'ar': '',
      'fr': '',
    },
    'mhmdv40e': {
      'en': 'Enregistrer le Médicament',
      'ar': '',
      'fr': '',
    },
  },
  // HOME
  {
    'boks8zyg': {
      'en': '  Hello, ',
      'ar': '',
      'fr': '',
    },
    'j12v49u7': {
      'en': '   bienvenue !',
      'ar': '',
      'fr': '',
    },
    'qfifj0k1': {
      'en': '  Comment vous sentez-vous aujourd\'hui ?',
      'ar': '',
      'fr': '',
    },
    'w2nozp7z': {
      'en': 'Très bien',
      'ar': '',
      'fr': '',
    },
    'lja9hx78': {
      'en': 'Bien',
      'ar': '',
      'fr': '',
    },
    'yxkyskav': {
      'en': 'Fatigué(e)',
      'ar': '',
      'fr': '',
    },
    '2ad86h0g': {
      'en': 'Épuisé(e)',
      'ar': '',
      'fr': '',
    },
    'aog3w8us': {
      'en': 'Malade',
      'ar': '',
      'fr': '',
    },
    '8q4i8n6d': {
      'en': 'Avoir mal',
      'ar': '',
      'fr': '',
    },
    '5721tkli': {
      'en': 'stressé(e)',
      'ar': '',
      'fr': '',
    },
    '9zzeeto8': {
      'en': 'Signes vitaux',
      'ar': '',
      'fr': '',
    },
    '6iujnbkw': {
      'en': 'Fréquence cardiaque',
      'ar': '',
      'fr': '',
    },
    '12xe8dlm': {
      'en': '75',
      'ar': '',
      'fr': '',
    },
    'ixfi075a': {
      'en': 'BPM',
      'ar': '',
      'fr': '',
    },
    '6ekcm102': {
      'en': 'Oxygen',
      'ar': '',
      'fr': '',
    },
    'iwa6di2j': {
      'en': '89',
      'ar': '',
      'fr': '',
    },
    '1733rwd0': {
      'en': '%',
      'ar': '',
      'fr': '',
    },
    'milrtbto': {
      'en': 'Temperature',
      'ar': '',
      'fr': '',
    },
    'nnva71x0': {
      'en': '37',
      'ar': '',
      'fr': '',
    },
    's1bcbjrj': {
      'en': '°C',
      'ar': '',
      'fr': '',
    },
    '1tnb689o': {
      'en': 'Accès rapide',
      'ar': '',
      'fr': '',
    },
    'jchxknuz': {
      'en': 'insuline ',
      'ar': '',
      'fr': '',
    },
    'po94xxm6': {
      'en': 'Medicaments',
      'ar': '',
      'fr': '',
    },
    '1w3gqb50': {
      'en': 'Docteur',
      'ar': '',
      'fr': '',
    },
    '42htzglj': {
      'en': 'Aide d\'urgence',
      'ar': '',
      'fr': '',
    },
    'xc62k7uz': {
      'en': 'Obtenez de l\'aide immédiate',
      'ar': '',
      'fr': '',
    },
    '4isxdh9j': {
      'en': 'APPELER',
      'ar': '',
      'fr': '',
    },
  },
  // oxygen
  {
    'fi1su3rj': {
      'en': 'Surveillance de l\'oxygène',
      'ar': '',
      'fr': '',
    },
    '9m0nap1p': {
      'en': 'Niveau actuel d\'oxygène',
      'ar': '',
      'fr': '',
    },
    'itqy7u4n': {
      'en': '%',
      'ar': '',
      'fr': '',
    },
    'uu3v3m2w': {
      'en': 'Plage normale: 95-100%',
      'ar': '',
      'fr': '',
    },
    '1qb3wdvl': {
      'en': 'Tendance du niveau d\'oxygène',
      'ar': '',
      'fr': '',
    },
    'hv921k2q': {
      'en': 'Aujourd\'hui',
      'ar': '',
      'fr': '',
    },
    'mdn1x2jc': {
      'en': 'Select day',
      'ar': '',
      'fr': '',
    },
    '9qvj8i4t': {
      'en': 'Aujourd\'hui',
      'ar': '',
      'fr': '',
    },
    'gz5lwbh7': {
      'en': 'Hier',
      'ar': '',
      'fr': '',
    },
    'ntflliwg': {
      'en': '7 Jours Précedent',
      'ar': '',
      'fr': '',
    },
    '2744rpj8': {
      'en': '30 Jours Précendent',
      'ar': '',
      'fr': '',
    },
    'qah0ke1x': {
      'en': 'Custom Date',
      'ar': '',
      'fr': '',
    },
    '521xu7t9': {
      'en': 'Graphique du niveau d\'oxygène (SpO2%',
      'ar': '',
      'fr': '',
    },
    'v16r2rif': {
      'en': 'Le plus élevé',
      'ar': '',
      'fr': '',
    },
    'vatoa1jc': {
      'en': '96%',
      'ar': '',
      'fr': '',
    },
    'j1ivw06i': {
      'en': 'Moyenne',
      'ar': '',
      'fr': '',
    },
    'qn0w7yew': {
      'en': '99%',
      'ar': '',
      'fr': '',
    },
    'uew5c04g': {
      'en': 'La plus bas',
      'ar': '',
      'fr': '',
    },
    'exmi1t9q': {
      'en': '93%',
      'ar': '',
      'fr': '',
    },
    'zuecowfb': {
      'en': 'Oxygen Level History',
      'ar': '',
      'fr': '',
    },
    'o86e2xd5': {
      'en': 'Aujourd’hui, 10h30',
      'ar': '',
      'fr': '',
    },
    'qxyrquvw': {
      'en': 'SpO2: 97%',
      'ar': '',
      'fr': '',
    },
    'dfdx1bc8': {
      'en': 'Normal',
      'ar': '',
      'fr': '',
    },
    'qgyv1hil': {
      'en': 'Hier, 21h45',
      'ar': '',
      'fr': '',
    },
    'nk5ert11': {
      'en': 'SpO2: 99%',
      'ar': '',
      'fr': '',
    },
    's5cxuwlr': {
      'en': 'Normal',
      'ar': '',
      'fr': '',
    },
    '5kne1w1f': {
      'en': 'Exporter la donner',
      'ar': '',
      'fr': '',
    },
    'qo8qf9tz': {
      'en': 'Partager le rapport',
      'ar': '',
      'fr': '',
    },
  },
  // heartrate
  {
    'bma983o2': {
      'en': 'Surveillance de la fréquence cardiaque',
      'ar': '',
      'fr': '',
    },
    't8pg2h0w': {
      'en': 'Fréquence cardiaque actuelle',
      'ar': '',
      'fr': '',
    },
    '47qrg3oj': {
      'en': 'bpm',
      'ar': '',
      'fr': '',
    },
    'bcuek51j': {
      'en': 'Plage normale: 60-100 bpm',
      'ar': '',
      'fr': '',
    },
    '3pg11vct': {
      'en': 'Tendance de la fréquence cardiaque',
      'ar': '',
      'fr': '',
    },
    'ov5botrj': {
      'en': 'Aujourd\'hui',
      'ar': '',
      'fr': '',
    },
    'tbex948d': {
      'en': 'Select day',
      'ar': '',
      'fr': '',
    },
    'lt169t23': {
      'en': 'Aujourd\'hui',
      'ar': '',
      'fr': '',
    },
    'fu9h8rn0': {
      'en': 'Hier',
      'ar': '',
      'fr': '',
    },
    '21eq0qiy': {
      'en': '7 jours precedent',
      'ar': '',
      'fr': '',
    },
    'admvjqnk': {
      'en': '30 jours precedent',
      'ar': '',
      'fr': '',
    },
    'zydanw8f': {
      'en': 'Custom Date',
      'ar': '',
      'fr': '',
    },
    'c91hasnu': {
      'en': 'Graphique de la fréquence cardiaque (bpm)',
      'ar': '',
      'fr': '',
    },
    'cf54vhv3': {
      'en': 'Moyenne',
      'ar': '',
      'fr': '',
    },
    '49knbelw': {
      'en': '75bpm',
      'ar': '',
      'fr': '',
    },
    'z8l3tbqp': {
      'en': 'La plus eleveé',
      'ar': '',
      'fr': '',
    },
    't0ii1tb4': {
      'en': '83bpm',
      'ar': '',
      'fr': '',
    },
    'soelrlha': {
      'en': 'La plus bas',
      'ar': '',
      'fr': '',
    },
    'wg7i3x7q': {
      'en': '68bpm',
      'ar': '',
      'fr': '',
    },
    'p2x9jyev': {
      'en': 'Oxygen Level History',
      'ar': '',
      'fr': '',
    },
    '0m39xc6t': {
      'en': 'Aujourd’hui, 10h30',
      'ar': '',
      'fr': '',
    },
    'gfst13mk': {
      'en': 'SpO2: 97%',
      'ar': '',
      'fr': '',
    },
    '9op04m0t': {
      'en': 'Normal',
      'ar': '',
      'fr': '',
    },
    'i7tq8qyg': {
      'en': 'Hier, 21h45',
      'ar': '',
      'fr': '',
    },
    'shm6rmwq': {
      'en': 'SpO2: 99%',
      'ar': '',
      'fr': '',
    },
    '8s1dwqbe': {
      'en': 'Normal',
      'ar': '',
      'fr': '',
    },
    'nbxs62p0': {
      'en': 'Exporter la donner',
      'ar': '',
      'fr': '',
    },
    'cdo9dxbj': {
      'en': 'Patrager le rapport',
      'ar': '',
      'fr': '',
    },
  },
  // temperature
  {
    '8g8nq0od': {
      'en': 'Surveillance de la température',
      'ar': '',
      'fr': '',
    },
    '12vkx0bf': {
      'en': 'Niveau temperature ',
      'ar': '',
      'fr': '',
    },
    '6z314e1s': {
      'en': '°C',
      'ar': '',
      'fr': '',
    },
    '3y9zbtk4': {
      'en': 'Plage normale: 37°C',
      'ar': '',
      'fr': '',
    },
    '62kga6qi': {
      'en': 'Tendance du niveau de température',
      'ar': '',
      'fr': '',
    },
    'hgys2li9': {
      'en': 'Aujourd\'hui',
      'ar': '',
      'fr': '',
    },
    'jniu27h0': {
      'en': 'Select day',
      'ar': '',
      'fr': '',
    },
    'p5uyhxru': {
      'en': 'Aujourd\'hui',
      'ar': '',
      'fr': '',
    },
    '578kw2rn': {
      'en': 'Hier',
      'ar': '',
      'fr': '',
    },
    'c6a3zra0': {
      'en': '7 Jours précédents',
      'ar': '',
      'fr': '',
    },
    'gldxuut0': {
      'en': '30 Jours précédents',
      'ar': '',
      'fr': '',
    },
    'bpdkv0ls': {
      'en': 'Custom Date',
      'ar': '',
      'fr': '',
    },
    '4p0cqkyu': {
      'en': 'Graphique du niveau de température (°C)',
      'ar': '',
      'fr': '',
    },
    'xtyzxp0v': {
      'en': 'Moyenne',
      'ar': '',
      'fr': '',
    },
    'kd5deu7p': {
      'en': '37°C',
      'ar': '',
      'fr': '',
    },
    'y9zypgph': {
      'en': 'Plus élevé',
      'ar': '',
      'fr': '',
    },
    '6vb4lyil': {
      'en': '37.5°C',
      'ar': '',
      'fr': '',
    },
    'qaunx4ye': {
      'en': 'Plus bas',
      'ar': '',
      'fr': '',
    },
    '6uum72x8': {
      'en': '36.5°C',
      'ar': '',
      'fr': '',
    },
    'ehsuwh9c': {
      'en': 'Aujourd’hui, 10h30',
      'ar': '',
      'fr': '',
    },
    'q4k0qzvp': {
      'en': 'SpO2: 97%',
      'ar': '',
      'fr': '',
    },
    'z95r97gl': {
      'en': 'Normal',
      'ar': '',
      'fr': '',
    },
    '9ngv5pbs': {
      'en': 'Hier, 21h45',
      'ar': '',
      'fr': '',
    },
    '6hkv9tdw': {
      'en': 'SpO2: 99%',
      'ar': '',
      'fr': '',
    },
    'lisk0mrg': {
      'en': 'Normal',
      'ar': '',
      'fr': '',
    },
    'w7r5fl8s': {
      'en': 'Exporter les données',
      'ar': '',
      'fr': '',
    },
    'dkpot1z1': {
      'en': 'Partager le rapport',
      'ar': '',
      'fr': '',
    },
  },
  // about
  {
    'xk1ih40d': {
      'en': 'À propos',
      'ar': '',
      'fr': '',
    },
    '6qryhkx3': {
      'en': 'Bienvenue sur notre application VitalLink',
      'ar': '',
      'fr': '',
    },
    'xov4gn6w': {
      'en': 'À propos de cette application',
      'ar': '',
      'fr': '',
    },
    'z6ojyshm': {
      'en':
          'Cette application est conçue pour vous aider à suivre et analyser les données biométriques en temps réel, vous permettant de surveiller votre santé de manière proactive. Grâce à notre bracelet connecté, vous pouvez suivre votre fréquence cardiaque, votre niveau d\'oxygène, votre température corporelle, et votre localisation GPS.\n\nNotre objectif est de vous offrir une interface intuitive et réactive, qui vous permet de prendre des décisions éclairées sur votre bien-être. Nous mettons également à votre disposition un support pour recevoir des alertes en cas d’anomalies, afin que vous puissiez rester en sécurité et en bonne santé.',
      'ar': '',
      'fr': '',
    },
    'kutk4516': {
      'en': 'Caractéristiques principales',
      'ar': '',
      'fr': '',
    },
    'no3jsozw': {
      'en':
          'Recommandations personnalisées basées sur vos données de santé pour vous aider à mieux gérer votre bien-être',
      'ar': '',
      'fr': '',
    },
    '5ptes34i': {
      'en':
          'Messagerie sécurisée pour partager vos informations de santé avec vos proches en toute confidentialité',
      'ar': '',
      'fr': '',
    },
    'ymuf69fw': {
      'en':
          'Outils de suivi de la santé pour vous aider à gérer vos mesures biométriques et rester organisé',
      'ar': '',
      'fr': '',
    },
    'gpfczc0j': {
      'en':
          'nterface personnalisable pour suivre vos données de santé selon vos préférences',
      'ar': '',
      'fr': '',
    },
    'si56rx78': {
      'en': 'Comment l\'utiliser',
      'ar': '',
      'fr': '',
    },
    'z3mfnln0': {
      'en': '1',
      'ar': '',
      'fr': '',
    },
    'ay4d0mwq': {
      'en':
          'Créez un compte ou connectez-vous pour accéder à toutes les fonctionnalités de suivi de santé.',
      'ar': '',
      'fr': '',
    },
    'm6hs3pxd': {
      'en': '2',
      'ar': '',
      'fr': '',
    },
    'yy9hcvzn': {
      'en':
          'Personnalisez votre profil et vos préférences dans les paramètres pour un suivi de santé optimal',
      'ar': '',
      'fr': '',
    },
    'ireoa3nt': {
      'en': '3',
      'ar': '',
      'fr': '',
    },
    'e9zxzoa0': {
      'en':
          'Explorez le tableau de bord pour découvrir de nouvelles recommandations de santé adaptées à vos besoins.',
      'ar': '',
      'fr': '',
    },
    'xudcsy4b': {
      'en': '4',
      'ar': '',
      'fr': '',
    },
    '4kmyk2hj': {
      'en':
          'Connectez-vous avec vos proches grâce aux fonctionnalités sociales pour partager vos progrès de santé',
      'ar': '',
      'fr': '',
    },
    'dv86qrn2': {
      'en': 'Contactez-nous',
      'ar': '',
      'fr': '',
    },
    'qfjpcet4': {
      'en':
          'Nous cherchons toujours à nous améliorer! \nSi vous avez des questions, des commentaires ou besoin d\'assistance, n\'hésitez pas à nous contacter :',
      'ar': '',
      'fr': '',
    },
    '1264zyxi': {
      'en': 'support@ourapp.com',
      'ar': '',
      'fr': '',
    },
    'vpnrft82': {
      'en': '+216 ** *** ***',
      'ar': '',
      'fr': '',
    },
    '0g7o1ehh': {
      'en': 'Version 1.0.2',
      'ar': '',
      'fr': '',
    },
  },
  // med_ajout_succes
  {
    'i7tev9d4': {
      'en': 'Médicament ajouté avec succès !',
      'ar':
          'عمل رائع ، لقد قمت بتحويل الأموال بنجاح. قد يستغرق خروج الأموال من حسابك بضعة أيام.',
      'fr': '',
    },
    '4ibr41ri': {
      'en': 'D\'accord',
      'ar': 'تمام',
      'fr': '',
    },
    '62b75fbc': {
      'en': 'Home',
      'ar': 'مسكن',
      'fr': '',
    },
  },
  // insulinepage
  {
    'jiitu360': {
      'en': ' Suivi de l\'insuline',
      'ar': '',
      'fr': '',
    },
    'hj3o48kr': {
      'en': 'Record Insulin Dose',
      'ar': '',
      'fr': '',
    },
    'z0vxrid8': {
      'en': 'Dose d\'insuline (unités)',
      'ar': '',
      'fr': '',
    },
    'e6ot5m7j': {
      'en': 'Saisir la dose',
      'ar': '',
      'fr': '',
    },
    'uo4egk8g': {
      'en': 'Temps',
      'ar': '',
      'fr': '',
    },
    '9xq7w2sr': {
      'en': 'HH:MM',
      'ar': '',
      'fr': '',
    },
    'bp8ljrs6': {
      'en': 'Notes (optionnel)',
      'ar': '',
      'fr': '',
    },
    'tadnd2pk': {
      'en': 'Ajoutez toute information supplémentaire',
      'ar': '',
      'fr': '',
    },
    'jp03cgcw': {
      'en': 'Enregistrer',
      'ar': '',
      'fr': '',
    },
    'm1sj588o': {
      'en': 'Historique d\'insuline',
      'ar': '',
      'fr': '',
    },
    'mp11onga': {
      'en': 'Filtrer',
      'ar': '',
      'fr': '',
    },
    '4m8tphp8': {
      'en': 'Date',
      'ar': '',
      'fr': '',
    },
    'ysnsddsm': {
      'en': 'temps',
      'ar': '',
      'fr': '',
    },
    'xxcz5xb9': {
      'en': 'Dose',
      'ar': '',
      'fr': '',
    },
    'vkr117z4': {
      'en': 'Notes',
      'ar': '',
      'fr': '',
    },
    'f8gb8pml': {
      'en': '05/15/2025',
      'ar': '',
      'fr': '',
    },
    'ugvvm4jr': {
      'en': '08:30',
      'ar': '',
      'fr': '',
    },
    'nkxuyf5c': {
      'en': '10 unités',
      'ar': '',
      'fr': '',
    },
    'tx2yz48t': {
      'en': 'Avant le petit-déj',
      'ar': '',
      'fr': '',
    },
    'onbw4dlj': {
      'en': '05/15/2025',
      'ar': '',
      'fr': '',
    },
    '9l3kw11c': {
      'en': '12:45 ',
      'ar': '',
      'fr': '',
    },
    'o4e0gg1f': {
      'en': '8 unités',
      'ar': '',
      'fr': '',
    },
    'dt7k2r89': {
      'en': 'Déjeuner',
      'ar': '',
      'fr': '',
    },
    't0e0ghry': {
      'en': '05/15/2025',
      'ar': '',
      'fr': '',
    },
    '137hcix6': {
      'en': '06:30 ',
      'ar': '',
      'fr': '',
    },
    'o1msm4u1': {
      'en': '12 unités',
      'ar': '',
      'fr': '',
    },
    'nid81ave': {
      'en': 'Dîner',
      'ar': '',
      'fr': '',
    },
    'pjtzs07h': {
      'en': '05/14/2025',
      'ar': '',
      'fr': '',
    },
    'm5pmtc7n': {
      'en': '08:15 ',
      'ar': '',
      'fr': '',
    },
    'bkl06eo0': {
      'en': '10 unités',
      'ar': '',
      'fr': '',
    },
    's2eqpruy': {
      'en': 'dose du matin',
      'ar': '',
      'fr': '',
    },
    'mtywoo4u': {
      'en': '05/14/2023',
      'ar': '',
      'fr': '',
    },
    'gygwc6vf': {
      'en': '13h00',
      'ar': '',
      'fr': '',
    },
    'bzwpsv1x': {
      'en': '8 units',
      'ar': '',
      'fr': '',
    },
    '57ts2p09': {
      'en': 'Après le déjeuner',
      'ar': '',
      'fr': '',
    },
    'xx4zu9sm': {
      'en': 'Voir tout l’historique',
      'ar': '',
      'fr': '',
    },
  },
  // doctorsappointment2
  {
    '17sqpatn': {
      'en': 'Rendez-vous médicaux',
      'ar': '',
      'fr': '',
    },
    'docw5dxy': {
      'en': 'Rendez-vous d’aujourd’hui',
      'ar': '',
      'fr': '',
    },
    'pc4gbtsp': {
      'en': 'Vous avez 2 rendez-vous aujourd’hui',
      'ar': '',
      'fr': '',
    },
    '76ckpogs': {
      'en': 'Calendrier',
      'ar': '',
      'fr': '',
    },
    'nyu02lmw': {
      'en': 'Rendez-vous d’aujourd’hui',
      'ar': '',
      'fr': '',
    },
    'up9gd79n': {
      'en': 'Dr. Sarah Johnson',
      'ar': '',
      'fr': '',
    },
    '3rzle0ts': {
      'en': 'Cardiologue',
      'ar': '',
      'fr': '',
    },
    'b8q6fdrj': {
      'en': '10h30 – 11h15',
      'ar': '',
      'fr': '',
    },
    'ba9erpxs': {
      'en': 'Dr. Michael Chen',
      'ar': '',
      'fr': '',
    },
    '5ae8tvco': {
      'en': 'Dermatologue',
      'ar': '',
      'fr': '',
    },
    'qn08gbyg': {
      'en': '15h00 – 15h45',
      'ar': '',
      'fr': '',
    },
    'joueukmh': {
      'en': 'Prochains rendez-vous',
      'ar': '',
      'fr': '',
    },
    '5h1f4da2': {
      'en': 'Dr. Emily Rodriguez',
      'ar': '',
      'fr': '',
    },
    'ely2hmyz': {
      'en': 'Neurologue',
      'ar': '',
      'fr': '',
    },
    's00df6tg': {
      'en': 'Demain, 14h30',
      'ar': '',
      'fr': '',
    },
    'hrxjouss': {
      'en': 'Nouveau rendez-vous',
      'ar': '',
      'fr': '',
    },
  },
  // addappintment
  {
    'i9cypk7c': {
      'en': 'Nouveau rendez-vous',
      'ar': '',
      'fr': '',
    },
    '85dzdumx': {
      'en': 'Nom du médecin',
      'ar': '',
      'fr': '',
    },
    'rcthy80i': {
      'en': 'Entrez le nom du médecin',
      'ar': '',
      'fr': '',
    },
    'x81wbw9e': {
      'en': 'Date',
      'ar': '',
      'fr': '',
    },
    '9qydap7h': {
      'en': 'Date \n (JJ/MM)',
      'ar': '',
      'fr': '',
    },
    'c6a6q6kq': {
      'en': 'Heure',
      'ar': '',
      'fr': '',
    },
    '87daw3cb': {
      'en': 'heure\n(MM:HH)',
      'ar': '',
      'fr': '',
    },
    '5vvtpc1k': {
      'en': 'Motif de la visite',
      'ar': '',
      'fr': '',
    },
    'c5x1jijl': {
      'en': 'Brève description de votre visite',
      'ar': '',
      'fr': '',
    },
    'ktxlyvq6': {
      'en': 'Rappel',
      'ar': '',
      'fr': '',
    },
    'n9uz3lf3': {
      'en': 'Configurer la notification de rappel',
      'ar': '',
      'fr': '',
    },
    'ekxz8a5f': {
      'en': 'Programmer un rendez-vous',
      'ar': '',
      'fr': '',
    },
  },
  // position
  {
    'xmikudaf': {
      'en': 'Choisissez votre profil',
      'ar': '',
      'fr': '',
    },
    'e1190ak0': {
      'en':
          'Sélectionnez votre rôle pour accéder aux fonctionnalités adaptées à vos besoins',
      'ar': '',
      'fr': '',
    },
    'xsh1isms': {
      'en': 'Médecin',
      'ar': '',
      'fr': '',
    },
    'sg5howur': {
      'en': 'Patient',
      'ar': '',
      'fr': '',
    },
    'qv7298lb': {
      'en': 'Soignant',
      'ar': '',
      'fr': '',
    },
  },
  // SIGNUP
  {
    'n0zgkniq': {
      'en': 'Créer un compte',
      'ar': '',
      'fr': '',
    },
    'zpklx0v4': {
      'en': 'Veuillez remplir vos informations pour créer un compte',
      'ar': '',
      'fr': '',
    },
    'wuy8wp4t': {
      'en': 'Prénom',
      'ar': '',
      'fr': '',
    },
    '0vghlxom': {
      'en': 'nom',
      'ar': '',
      'fr': '',
    },
    'wvjqh0l2': {
      'en': 'Sélectionnez le genre',
      'ar': '',
      'fr': '',
    },
    '8ix5k5vv': {
      'en': 'Search...',
      'ar': '',
      'fr': '',
    },
    'pqsjikbd': {
      'en': 'Gender',
      'ar': '',
      'fr': '',
    },
    'de02r7nc': {
      'en': 'Homme',
      'ar': '',
      'fr': '',
    },
    '8nmvt17x': {
      'en': 'Femme',
      'ar': '',
      'fr': '',
    },
    'r5rmx3ms': {
      'en': 'Autre',
      'ar': '',
      'fr': '',
    },
    'y4ogi4uv': {
      'en': 'Date de naissance\n (JJ/MM/AAAA)',
      'ar': '',
      'fr': '',
    },
    'wli10f9h': {
      'en': 'Sélectionnez le groupe sanguin',
      'ar': '',
      'fr': '',
    },
    'h04adyx3': {
      'en': 'Search...',
      'ar': '',
      'fr': '',
    },
    'vsn306to': {
      'en': 'Blood Type',
      'ar': '',
      'fr': '',
    },
    '3u5grq9c': {
      'en': 'A+',
      'ar': '',
      'fr': '',
    },
    'db8ae3vq': {
      'en': 'A-',
      'ar': '',
      'fr': '',
    },
    'wjk8j5a9': {
      'en': 'B+',
      'ar': '',
      'fr': '',
    },
    'srk6biem': {
      'en': 'B-',
      'ar': '',
      'fr': '',
    },
    'o8jf0s2c': {
      'en': 'AB+',
      'ar': '',
      'fr': '',
    },
    'vz0w41hi': {
      'en': 'AB-',
      'ar': '',
      'fr': '',
    },
    'h2x8h5mu': {
      'en': 'O+',
      'ar': '',
      'fr': '',
    },
    'emxa5a24': {
      'en': 'O-',
      'ar': '',
      'fr': '',
    },
    'mddwcnhs': {
      'en': 'Êtes-vous diabétique ?',
      'ar': '',
      'fr': '',
    },
    '59uz5u5a': {
      'en': 'Informations du compte',
      'ar': '',
      'fr': '',
    },
    'kml91b50': {
      'en': 'Email',
      'ar': '',
      'fr': '',
    },
    'guspc707': {
      'en': 'mot de passe ',
      'ar': '',
      'fr': '',
    },
    'f3zj09w0': {
      'en': 'Confirmer le mot de passe',
      'ar': '',
      'fr': '',
    },
    'hapqwdhe': {
      'en':
          'J’accepte les Conditions d’utilisation et la Politique de confidentialité',
      'ar': '',
      'fr': '',
    },
    'wdq655xj': {
      'en': 'Créer un compte',
      'ar': '',
      'fr': '',
    },
    'ewskjqfh': {
      'en': 'Vous avez déjà un compte ?',
      'ar': '',
      'fr': '',
    },
    'lew66vvn': {
      'en': 'Se connecter',
      'ar': '',
      'fr': '',
    },
  },
  // LOGIN
  {
    'j41lzzvt': {
      'en': 'Bienvenue à nouveau',
      'ar': '',
      'fr': '',
    },
    '6g61llcn': {
      'en': ' votre santé est notre priorité',
      'ar': '',
      'fr': '',
    },
    'dv0zi321': {
      'en': 'Email',
      'ar': '',
      'fr': '',
    },
    'svvsosck': {
      'en': 'mot de passe',
      'ar': '',
      'fr': '',
    },
    '275cbtyp': {
      'en': 'Mot de passe oublié ?',
      'ar': '',
      'fr': '',
    },
    'rb5r0ur1': {
      'en': 'Connexion',
      'ar': '',
      'fr': '',
    },
    '3bylb7io': {
      'en': 'Vous n’avez pas de compte ?',
      'ar': '',
      'fr': '',
    },
    'kyd7verw': {
      'en': 'S\'inscrire',
      'ar': '',
      'fr': '',
    },
  },
  // CHANGEPASS
  {
    'prrn1qsk': {
      'en': 'Changer le mot de passe',
      'ar': '',
      'fr': '',
    },
    'uqu6q5mv': {
      'en':
          'Entrez votre mot de passe actuel et définissez un nouveau mot de passe pour votre compte.',
      'ar': '',
      'fr': '',
    },
    'y04j7hp5': {
      'en': 'Mot de passe actuel',
      'ar': '',
      'fr': '',
    },
    'yy9xg6vb': {
      'en': 'Entrez votre mot de passe actuel',
      'ar': '',
      'fr': '',
    },
    'gllt69am': {
      'en': 'Nouveau mot de passe',
      'ar': '',
      'fr': '',
    },
    'mxglhjhv': {
      'en': 'Entrez votre nouveau mot de passe',
      'ar': '',
      'fr': '',
    },
    'z9ij9567': {
      'en': 'Confirmer le nouveau mot de passe',
      'ar': '',
      'fr': '',
    },
    'rwj7j5i2': {
      'en': 'Confirmez votre nouveau mot de passe',
      'ar': '',
      'fr': '',
    },
    'los83njp': {
      'en': 'Mettre à jour le mot de passe',
      'ar': '',
      'fr': '',
    },
  },
  // FORGOTTPASSWORD
  {
    'h1hvhc5x': {
      'en': 'Mot de passe oublié',
      'ar': '',
      'fr': '',
    },
    'r30alfzi': {
      'en':
          'Entrez  votre email enregistrés, et nous vous enverrons un code de vérification pour réinitialiser votre mot de passe.',
      'ar': '',
      'fr': '',
    },
    'ryqkjkhy': {
      'en': 'E-mail',
      'ar': '',
      'fr': '',
    },
    'd5l9uufg': {
      'en': 'Entrez  votre e-mail',
      'ar': '',
      'fr': '',
    },
    'cgqr81ef': {
      'en': 'Envoyer le code de vérification',
      'ar': '',
      'fr': '',
    },
    '1a92o9yg': {
      'en':
          'Veillez à vérifier votre dossier spam si vous ne recevez pas le code dans quelques minutes.',
      'ar': '',
      'fr': '',
    },
    'cggjk7y5': {
      'en': 'Vous vous rappelez de votre mot de passe ?',
      'ar': '',
      'fr': '',
    },
    '8prc59z1': {
      'en': 'Se connecter',
      'ar': '',
      'fr': '',
    },
  },
  // VERIFICATION
  {
    'oe3nojt5': {
      'en': 'Entrez le code de vérification',
      'ar': '',
      'fr': '',
    },
    'mq6a1use': {
      'en': 'Nous avons envoyé un code de vérification à',
      'ar': '',
      'fr': '',
    },
    'q0zusqku': {
      'en': '(+216) 90-459-650',
      'ar': '',
      'fr': '',
    },
    'fgkiyufx': {
      'en': 'TextField',
      'ar': '',
      'fr': '',
    },
    'pbcy4xxc': {
      'en': 'Vérifier',
      'ar': '',
      'fr': '',
    },
    '89q5q5s6': {
      'en': 'Vous n’avez pas reçu de code ?',
      'ar': '',
      'fr': '',
    },
    'o1zrsa4h': {
      'en': 'Renvoyer',
      'ar': '',
      'fr': '',
    },
    'lamo27mk': {
      'en': 'Renvoyer dans',
      'ar': '',
      'fr': '',
    },
    'homqxl17': {
      'en': 's',
      'ar': '',
      'fr': '',
    },
  },
  // settings
  {
    'z776vmk8': {
      'en': 'Paramètres',
      'ar': '',
      'fr': '',
    },
    'sfc4d56t': {
      'en': 'John Doe',
      'ar': '',
      'fr': '',
    },
    'pcqhsq8o': {
      'en': 'john.doe@example.com',
      'ar': '',
      'fr': '',
    },
    'ajhuqwzq': {
      'en': 'Modifier le profil',
      'ar': '',
      'fr': '',
    },
    'hlj23dhw': {
      'en': 'Paramètres du compte',
      'ar': '',
      'fr': '',
    },
    '5t3es3hm': {
      'en': 'Paramètres de notification',
      'ar': '',
      'fr': '',
    },
    'vlc0vs21': {
      'en': 'Gérez vos préférences de notification',
      'ar': '',
      'fr': '',
    },
    'lyhdm8kn': {
      'en': 'Changer le mot de passe',
      'ar': '',
      'fr': '',
    },
    '5tmowmyf': {
      'en': 'Mettez à jour le mot de passe de votre compte',
      'ar': '',
      'fr': '',
    },
    'beyuw7h5': {
      'en': 'Assistance',
      'ar': '',
      'fr': '',
    },
    'rzra6quk': {
      'en': 'FAQ',
      'ar': '',
      'fr': '',
    },
    'sp2falw3': {
      'en': 'Foire aux questions',
      'ar': '',
      'fr': '',
    },
    '8xr6tvgj': {
      'en': 'Contacter l’assistance',
      'ar': '',
      'fr': '',
    },
    'd3o91w19': {
      'en': 'Obtenez de l’aide pour tout problème',
      'ar': '',
      'fr': '',
    },
    'nxcbu9lz': {
      'en': 'À propos',
      'ar': '',
      'fr': '',
    },
    'zfio16ee': {
      'en': 'À propos de nous',
      'ar': '',
      'fr': '',
    },
    'qlvklfhh': {
      'en': 'En savoir plus sur notre entreprise',
      'ar': '',
      'fr': '',
    },
    'jt6itn0x': {
      'en': 'Conditions générales d’utilisation',
      'ar': '',
      'fr': '',
    },
    '1gb7d9so': {
      'en': 'Lisez nos conditions d’utilisation',
      'ar': '',
      'fr': '',
    },
    'e31dtqyo': {
      'en': 'Se déconnecter',
      'ar': '',
      'fr': '',
    },
  },
  // notification
  {
    '8iespwpa': {
      'en': 'Paramètres de notification',
      'ar': '',
      'fr': '',
    },
    'czwdnawe': {
      'en': 'Notifications par e-mail',
      'ar': '',
      'fr': '',
    },
    'bplbgcwi': {
      'en': 'Recevoir des notifications par e-mail',
      'ar': '',
      'fr': '',
    },
    '7w5chb2c': {
      'en': 'Recevoir des mises à jour par e-mail',
      'ar': '',
      'fr': '',
    },
    'jtwl8sxg': {
      'en': 'Notifications push',
      'ar': '',
      'fr': '',
    },
    'hbxx6z05': {
      'en': 'Activer les notifications push',
      'ar': '',
      'fr': '',
    },
    'u3gzqng5': {
      'en': 'Autoriser l’application à envoyer des notifications',
      'ar': '',
      'fr': '',
    },
    '5lnnbndt': {
      'en': 'Notifications en arrière-plan',
      'ar': '',
      'fr': '',
    },
    'jilqyhrn': {
      'en': 'Recevoir des notifications lorsque l’application est fermée',
      'ar': '',
      'fr': '',
    },
    'truq3edb': {
      'en': 'Vibration',
      'ar': '',
      'fr': '',
    },
    'sozb0r04': {
      'en': 'Vibrer à l’arrivée des notifications',
      'ar': '',
      'fr': '',
    },
    '6flxk8ng': {
      'en': 'Son',
      'ar': '',
      'fr': '',
    },
    'd50ab1bt': {
      'en': 'Jouer un son pour les notifications',
      'ar': '',
      'fr': '',
    },
    'nvkii51c': {
      'en': 'Types de notifications',
      'ar': '',
      'fr': '',
    },
    '1613rerz': {
      'en': 'Messages',
      'ar': '',
      'fr': '',
    },
    'gu9jjt93': {
      'en': 'Nouveaux messages et réponses',
      'ar': '',
      'fr': '',
    },
    '5kx8lign': {
      'en': 'Mises à jour',
      'ar': '',
      'fr': '',
    },
    '2tv3cvhu': {
      'en': 'Mises à jour de l’application et nouvelles fonctionnalités',
      'ar': '',
      'fr': '',
    },
    '9nihqb06': {
      'en': 'Rappels',
      'ar': '',
      'fr': '',
    },
    '6xmmkau9': {
      'en': 'Rappels des tâches et des événements',
      'ar': '',
      'fr': '',
    },
    'zar5z0q2': {
      'en': 'Enregistrer les modifications',
      'ar': '',
      'fr': '',
    },
  },
  // editprofile
  {
    'w9giry3t': {
      'en': 'Modifier le profil',
      'ar': '',
      'fr': '',
    },
    'yog1gd0r': {
      'en': 'Appuyez pour changer la photo de profil',
      'ar': '',
      'fr': '',
    },
    'el6ffi4n': {
      'en': 'Prénom',
      'ar': '',
      'fr': '',
    },
    '2srqma6w': {
      'en': 'John',
      'ar': '',
      'fr': '',
    },
    'f4khia8h': {
      'en': 'nom',
      'ar': '',
      'fr': '',
    },
    '1uflabmm': {
      'en': 'Smith',
      'ar': '',
      'fr': '',
    },
    'xx6umk7w': {
      'en': 'Adresse e-mail',
      'ar': '',
      'fr': '',
    },
    'a1q54pd4': {
      'en': 'johnsmith@example.com',
      'ar': '',
      'fr': '',
    },
    'ixvhxou6': {
      'en': 'Changer le mot de passe',
      'ar': '',
      'fr': '',
    },
    'fzwgyonv': {
      'en': 'Enregistrer les modifications',
      'ar': '',
      'fr': '',
    },
    'xlwk21ap': {
      'en': 'Annuler',
      'ar': '',
      'fr': '',
    },
  },
  // home2
  {
    'vmmowfyw': {
      'en': 'Bonjour, Dr.',
      'ar': '',
      'fr': '',
    },
    '4ydpfi61': {
      'en': 'Bienvenue sur votre espace médical',
      'ar': '',
      'fr': '',
    },
    'qzkaka61': {
      'en': 'Patients sous suivi',
      'ar': '',
      'fr': '',
    },
    'cc3y9m83': {
      'en': '42',
      'ar': '',
      'fr': '',
    },
    'ff4jm4y9': {
      'en': 'Total Patients',
      'ar': '',
      'fr': '',
    },
    'xxarn1qj': {
      'en': '12',
      'ar': '',
      'fr': '',
    },
    'wrsa4d33': {
      'en': 'Patients Admis',
      'ar': '',
      'fr': '',
    },
    'yqek0zfl': {
      'en': '5',
      'ar': '',
      'fr': '',
    },
    'yg95yijk': {
      'en': 'Patients Récents',
      'ar': '',
      'fr': '',
    },
    'fqvg48ls': {
      'en': 'Actions rapides',
      'ar': '',
      'fr': '',
    },
    'gz4jbg3m': {
      'en': 'Ajouter un rapport',
      'ar': '',
      'fr': '',
    },
    'wc8sj00c': {
      'en': 'Voir dossiers',
      'ar': '',
      'fr': '',
    },
    'v6lbl8me': {
      'en': 'Contacter un patient',
      'ar': '',
      'fr': '',
    },
    'ja8i7yx0': {
      'en': 'Patients récents',
      'ar': '',
      'fr': '',
    },
    '9g8ym18p': {
      'en': 'JD',
      'ar': '',
      'fr': '',
    },
    'gjljhxzz': {
      'en': 'Jean Dupont',
      'ar': '',
      'fr': '',
    },
    'qedgj4qs': {
      'en': 'Consultation: 12/05/2023',
      'ar': '',
      'fr': '',
    },
    '3ck6kygq': {
      'en': 'Aide d\'urgence',
      'ar': '',
      'fr': '',
    },
    'n5565rlu': {
      'en': 'Contact immédiat avec l\'équipe d\'urgence',
      'ar': '',
      'fr': '',
    },
    'ip4hz4r0': {
      'en': 'APPELER',
      'ar': '',
      'fr': '',
    },
  },
  // home_soignant
  {
    'w3fibjfp': {
      'en': 'Bonjour , ',
      'ar': '',
      'fr': '',
    },
    'lesn7wtw': {
      'en':
          'Vous êtes actuellement sur votre page de\n suivi et d\'assistance.',
      'ar': '',
      'fr': '',
    },
    '0uki3dy0': {
      'en': 'Signes vitaux de la personne accompagnée',
      'ar': '',
      'fr': '',
    },
    '1qq2287i': {
      'en': '72',
      'ar': '',
      'fr': '',
    },
    'ssg3b0pd': {
      'en': 'BPM',
      'ar': '',
      'fr': '',
    },
    'g33vhr8j': {
      'en': '37.5',
      'ar': '',
      'fr': '',
    },
    'tjs31ahq': {
      'en': '°C',
      'ar': '',
      'fr': '',
    },
    't8v2b2ee': {
      'en': '65',
      'ar': '',
      'fr': '',
    },
    'sb3mg7yn': {
      'en': '%',
      'ar': '',
      'fr': '',
    },
    'otqsqpnc': {
      'en': 'Actions rapides',
      'ar': '',
      'fr': '',
    },
    'ltur64gv': {
      'en': 'Ajouter un rapport',
      'ar': '',
      'fr': '',
    },
    '7o92n39f': {
      'en': 'Contacter le patient',
      'ar': '',
      'fr': '',
    },
    'ge5i6ez5': {
      'en': 'Aide d\'urgence',
      'ar': '',
      'fr': '',
    },
    '73v3w3pt': {
      'en': 'Contact immédiat avec l\'équipe d\'urgence',
      'ar': '',
      'fr': '',
    },
    '22gbgudb': {
      'en': 'APPELER',
      'ar': '',
      'fr': '',
    },
  },
  // loginsuccesss
  {
    'sk0h5c9i': {
      'en': 'Connexion réussie !',
      'ar': '',
      'fr': '',
    },
    'w1t4d100': {
      'en': 'Vous êtes connecté(e) avec succès à votre compte.',
      'ar': '',
      'fr': '',
    },
    'hjn9rgn0': {
      'en': 'Continuer',
      'ar': '',
      'fr': '',
    },
  },
  // signuperror
  {
    'ecsat7w3': {
      'en': 'Erreur lors de l\'inscription',
      'ar': '',
      'fr': '',
    },
    'w5ewlvlo': {
      'en': 'Veuillez vérifier les éléments suivants :',
      'ar': '',
      'fr': '',
    },
    'nv7dmdik': {
      'en': 'Entrez une adresse e-mail valide',
      'ar': '',
      'fr': '',
    },
    'gq4b5q72': {
      'en': 'Les champs de mot de passe\n doivent correspondre',
      'ar': '',
      'fr': '',
    },
    'ppce623q': {
      'en': 'Les conditions générales \ndoivent être acceptées',
      'ar': '',
      'fr': '',
    },
    'pji3ncg4': {
      'en': 'OK',
      'ar': '',
      'fr': '',
    },
  },
  // passwordchangedsuccessfully
  {
    'hhsbwcae': {
      'en': 'Mot de passe modifié',
      'ar': '',
      'fr': '',
    },
    'jl60i5eu': {
      'en':
          'Votre mot de passe a été mis à jour avec succès. Vous pouvez maintenant utiliser votre nouveau mot de passe pour vous connecter.',
      'ar': '',
      'fr': '',
    },
    'fnzahsoy': {
      'en': 'Fait',
      'ar': '',
      'fr': '',
    },
  },
  // appointmentadded
  {
    'z5n1uno3': {
      'en': 'Rendez-vous ajouté',
      'ar': '',
      'fr': '',
    },
    't4hlcljm': {
      'en':
          'Votre rendez-vous a été programmé avec succès. Vous recevrez bientôt un e-mail de confirmation.',
      'ar': '',
      'fr': '',
    },
    't4r3ui3c': {
      'en': 'Fermer',
      'ar': '',
      'fr': '',
    },
  },
  // feedbacksent
  {
    '5f50i6ht': {
      'en': 'Avis envoyé',
      'ar': '',
      'fr': '',
    },
    'ebckeqwc': {
      'en': 'Merci pour votre retour ! Nous apprécions votre contribution.',
      'ar': '',
      'fr': '',
    },
    '1unrajh2': {
      'en': 'Fermer',
      'ar': '',
      'fr': '',
    },
  },
  // notificationsettingssaved
  {
    'sqb0dxnp': {
      'en': 'Les paramètres de notification ont été enregistrés avec succès !',
      'ar': '',
      'fr': '',
    },
    '2pawnmfw': {
      'en': 'Fermer',
      'ar': '',
      'fr': '',
    },
  },
  // profileeditedwithsuiccess
  {
    '55fm6fuq': {
      'en': 'Profil modifié avec succès',
      'ar': '',
      'fr': '',
    },
    '5hnqi4cp': {
      'en': 'Les modifications de votre profil ont été enregistrées.',
      'ar': '',
      'fr': '',
    },
    'y23kojx7': {
      'en': 'fermer',
      'ar': '',
      'fr': '',
    },
  },
  // heart_rate_dialog
  {
    'kycnr22t': {
      'en': '⚠️ Alerte de fréquence cardiaque',
      'ar': '',
      'fr': '',
    },
    '6pl5aqwz': {
      'en':
          'Votre fréquence cardiaque est trop élevée ou trop basse. Veuillez vérifier immédiatement.',
      'ar': '',
      'fr': '',
    },
    'ebyvu76u': {
      'en':
          'Conditions : Déclenchement lorsque la fréquence cardiaque est > 120 bpm ou < 50 bpm',
      'ar': '',
      'fr': '',
    },
    '6fgntxl9': {
      'en': 'OK',
      'ar': '',
      'fr': '',
    },
  },
  // oxygene_dialog
  {
    'a3qwmaxq': {
      'en': '🛑 Niveau d’oxygène faible',
      'ar': '',
      'fr': '',
    },
    'h2l9tu7p': {
      'en':
          'La saturation en oxygène est inférieure à 92 %. Veuillez consulter un médecin.',
      'ar': '',
      'fr': '',
    },
    'misw5mh6': {
      'en': 'OK',
      'ar': '',
      'fr': '',
    },
  },
  // temperature_dialog
  {
    'r4t2cqn0': {
      'en': '🌡️ Avertissement de température',
      'ar': '',
      'fr': '',
    },
    'ousn0qus': {
      'en': 'Votre température corporelle est anormale. (>38°C ou <35,5°C)',
      'ar': '',
      'fr': '',
    },
    'w7hc22xz': {
      'en': 'OK',
      'ar': '',
      'fr': '',
    },
  },
  // loginerrorpopout
  {
    'nwhjre0j': {
      'en': 'Erreur de connexion',
      'ar': '',
      'fr': '',
    },
    'vemxdvp2': {
      'en': 'E-mail ou mot de passe invalide. Veuillez réessayer.',
      'ar': '',
      'fr': '',
    },
    '0yqt5jkr': {
      'en': 'Réessayer',
      'ar': '',
      'fr': '',
    },
  },
  // Miscellaneous
  {
    'lzyb73wy': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'kx9cdks4': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'efvtwj7k': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'ec5hfa1e': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'q5ljwvfo': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'j4rmwb3h': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '6ah1b18f': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '2kos1hen': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'p8xcm0zv': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '5rqultdm': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    're3ny7l3': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '0ityt6gg': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'b68seh40': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'aox3s4fb': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'l8hv5a7z': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '4pjwb70a': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '0xlokf4y': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '8twlwiwt': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'jsulq3pf': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'av0pkkar': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'd3s9jns0': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'z53roh8f': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'xcal5d2a': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'ppjrcdhv': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    't4xzlq9q': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '513nj4m0': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'a1jxfgju': {
      'en': '',
      'ar': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
