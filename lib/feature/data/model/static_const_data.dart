// for listen the quran
const String FIREBASE_COLLECITON = "moshaf";
const String FIREBASE_NAME = 'name';
const String FIREBASE_SORAH = 'sorah';
const String FIREBASE_URL = 'url';
const String FIREBASE_IMAGE_URL = 'imageUrl';
const String DATABASE_BODY = 'body';

// for read the quran

const String SORAH = 'sorah';
const String MOSHAF_TABLE = 'moshafTable';
const String PAGES = 'page';
const String SORAH_TABLE = 'sorahTable';

const String FIRESTORE_COLLECTION_PAGE = 'quran';
const String ZAKER_COLLECTION = 'zaker_nayek';
const String DEEDAT_COLLECTION = 'ahmed_deedat';

const String QURAN_PAGE = 'QURAN_PAGE';
const String AZKAR_PAGE = 'TAGHSEER_PAGE';

enum PageType { QURAN_PAGE, AZKAR_PAGE }

Map<PageType, String> sharedReferencePageType = {
  PageType.QURAN_PAGE: 'quran_page',
  PageType.AZKAR_PAGE: 'tafseer_page'
};
