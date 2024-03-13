class AppConstants {
  static String appName = 'TCS Alumni';
  static String appFontFamily = 'Gotham';

  static String bearerToken = "";

  static const testUrl = 'http://192.168.1.250/dev/tle_laravel/public/';
  static const devUrl = 'https://dev.linkalumniapp.com/';
  //static const testUrl = 'https://tle.viion.net/';
  static const linkMembia = "https://viiontech.com/";

  static const liveUrl = 'https://tcsalumni.linkalumniapp.com/';

  static String baseUrl = liveUrl;

  static String myId = "";
  static String userName = "";
  static String chapterId = "";

  static String pdf =
      'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf';

  //Store Urls
  static const String androidUrl =
      "https://play.google.com/store/apps/details?id=com.viion.tcsalumniapp";
  static const String iosUrl =
      "https://apps.apple.com/tt/app/cityzens/id1630070364";

  static const linkAlumni = "https://linkalumniapp.com/";

  //LinkedIn
  static const String linkedinUrl =
      "https://duhs.linkalumniapp.com/index.php/Ams_Controller/login_linkedin";
  static const String linkedInClientId = "86fcw6v4y08q67";
  static const String linkedInClientSecret = "NP47KpZQ53Pwg5A5";

  //Privacy policy Url
  static const String privacyUrl =
      "https://www.termsfeed.com/privacy-policy/545d9d16737f7de501b2df8f9a098218";

  // chat status
  static const String INVITE = "invite";
  static const String ACCEPT = "accept";
  static const String BLOCK = "block";
  static const String UNBLOCK = "unblock";
  static const String REJECT = "reject";

  static const String YOU_REJECTED = "YOU REJECTED";
  static const String REQUEST = "request";
  static const String CANCEL = "cancel";
  static const String REQUEST_SENT = "REQUEST SENT";
  static const String REQUEST_RECEIVE = "REQUEST RECEIVED";

  ///
  static const String sendRequest = "REQUEST";
  static const String cancel = "CANCEL";
  static const String connect = "ACCEPT";
  //morescrns
  static const String link = "Link";
  static const String postjob = "Post Job";
  static const String submit = 'Submit';
  static const String showInterest = 'Show Interest';
  static const String interested = 'Interested';

  //loginscrn
  static const String signin = "Sign In";
  //forgetpassscrn
  static const String update = "Update";
  //signupscrns
  static const String sendcode = "Send Code";
  static const String signup = "Sign Up";

  //Youtube channel id
  static const String channelId = "UUmnjO9KHjRO4hyc5jGCwFqA";

  ///********* Intro Screens Title and Text
  static const String title1 = "Alumni List";
  static const String title2 = "Networking";
  static const String title3 = "Jobs";
  static const String text1 =
      "Being able to reach your alumni where they want to be contacted is essential. Ensure your alumni information is up to date.";
  static const String text2 =
      "Catch up with your fellow alumni by checking into places or check on the alumni community to find alumni with in the area.";
  static const String text3 =
      "One centralized area to post or view job opportunities and internships. Post and find talent.";

  static const String whatsAppNumber = '+923354604843';
  static const String pushNotificationKey = 'key=AAAAsgp6bIs:APA91bFB3yMPrQDdiTQ7TvNkQijEuZaXFqEtchHutoNuJf5wYWlfQ5hc8gaydHlpZh6gQaY63cO6jXz82qirXxARWoyRrf-k056aT3xi51Bia4jx6eSvBgyvHdqAk98LILWNwxUbFauN';

  static const String pakCityResponse = """ 
  {
    "success": 1,
    "message": "Successfull.",
    "cities": [
        {
            "country_id": "166",
            "city_id": "48358",
            "city_name": "Abbottabad",
            "update_date": "2022-10-31 15:44:15",
            "state_id": "0",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31312",
            "city_name": "Abdul Hakim",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5742",
            "city_name": "Abohar",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5743",
            "city_name": "Adampur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31540",
            "city_name": "Adilpur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31313",
            "city_name": "Ahmadpur East",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31314",
            "city_name": "Ahmadpur Lumma",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31315",
            "city_name": "Ahmadpur Sial",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31316",
            "city_name": "Ahmedabad",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5744",
            "city_name": "Ahmedgarh",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5745",
            "city_name": "Ajnala",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5746",
            "city_name": "Akalgarh",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5747",
            "city_name": "Alawalpur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31317",
            "city_name": "Alipur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31318",
            "city_name": "Alipur Chatha",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5748",
            "city_name": "Amloh",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5749",
            "city_name": "Amritsar",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5750",
            "city_name": "Amritsar Cantonment",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5751",
            "city_name": "Anandpur Sahib",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31319",
            "city_name": "Arifwala",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31320",
            "city_name": "Attock",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31541",
            "city_name": "Badah",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31321",
            "city_name": "Baddomalhi",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5752",
            "city_name": "Badhni Kalan",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31542",
            "city_name": "Badin",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31543",
            "city_name": "Bagarji",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31322",
            "city_name": "Bagh",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5753",
            "city_name": "Bagh Purana",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31323",
            "city_name": "Bahawalnagar",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31324",
            "city_name": "Bahawalpur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31325",
            "city_name": "Bai Pheru",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31544",
            "city_name": "Bakshshapur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5754",
            "city_name": "Balachaur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5755",
            "city_name": "Banaur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31545",
            "city_name": "Bandhi",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5756",
            "city_name": "Banga",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "48359",
            "city_name": "Bannu",
            "update_date": "2022-10-31 15:44:15",
            "state_id": "0",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5757",
            "city_name": "Banur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5758",
            "city_name": "Baretta",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5759",
            "city_name": "Bariwala",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31273",
            "city_name": "Barkhan",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2723",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5760",
            "city_name": "Barnala",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31326",
            "city_name": "Basirpur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5761",
            "city_name": "Bassi Pathana",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5762",
            "city_name": "Batala",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5763",
            "city_name": "Bathinda",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5764",
            "city_name": "Begowal",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31327",
            "city_name": "Begowala",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5765",
            "city_name": "Behrampur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31274",
            "city_name": "Bela",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2723",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31546",
            "city_name": "Berani",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5766",
            "city_name": "Bhabat",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5767",
            "city_name": "Bhadur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31275",
            "city_name": "Bhag",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2723",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31328",
            "city_name": "Bhakkar",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31329",
            "city_name": "Bhalwal",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31547",
            "city_name": "Bhan",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5768",
            "city_name": "Bhankharpur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5769",
            "city_name": "Bharoli Kalan",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31330",
            "city_name": "Bhawana",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5770",
            "city_name": "Bhawanigarh",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31331",
            "city_name": "Bhera",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5771",
            "city_name": "Bhikhi",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5772",
            "city_name": "Bhikhiwind",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31548",
            "city_name": "Bhiria City",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31549",
            "city_name": "Bhiria Road",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5773",
            "city_name": "Bhisiana",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31550",
            "city_name": "Bhit Shah",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5774",
            "city_name": "Bhogpur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31332",
            "city_name": "Bhopalwala",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5775",
            "city_name": "Bhuch",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5776",
            "city_name": "Bhulath",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31551",
            "city_name": "Bozdar",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5777",
            "city_name": "Budha Theh",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5778",
            "city_name": "Budhlada",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31552",
            "city_name": "Bulri",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31333",
            "city_name": "Burewala",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31553",
            "city_name": "Chak",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31334",
            "city_name": "Chak Azam Sahu",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31335",
            "city_name": "Chak Jhumra",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31336",
            "city_name": "Chak Sarwar Shahid",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31337",
            "city_name": "Chakwal",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31276",
            "city_name": "Chaman",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2723",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31554",
            "city_name": "Chambar",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "48360",
            "city_name": "Chashma",
            "update_date": "2022-10-31 15:44:15",
            "state_id": "0",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31338",
            "city_name": "Chawinda",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31339",
            "city_name": "Chichawatni",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5779",
            "city_name": "Chima",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31340",
            "city_name": "Chiniot",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31341",
            "city_name": "Chishtian Mandi",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31277",
            "city_name": "Chitkan",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2723",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31342",
            "city_name": "Choa Saidan Shah",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5780",
            "city_name": "Chohal",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31555",
            "city_name": "Chohar Jamali",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31556",
            "city_name": "Chor",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31343",
            "city_name": "Chuhar Kana",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31344",
            "city_name": "Chunian",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "48361",
            "city_name": "D I Khan",
            "update_date": "2022-10-31 15:44:15",
            "state_id": "0",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31557",
            "city_name": "Dadu",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31558",
            "city_name": "Daharki",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31345",
            "city_name": "Dajal",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31278",
            "city_name": "Dalbandin",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2723",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31559",
            "city_name": "Daro",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31346",
            "city_name": "Darya Khan",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31560",
            "city_name": "Darya Khan Mari",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31347",
            "city_name": "Daska",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5781",
            "city_name": "Dasuya",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31348",
            "city_name": "Daud Khel",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5782",
            "city_name": "Daulatpur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31561",
            "city_name": "Daulatpur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31349",
            "city_name": "Daultala",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31562",
            "city_name": "Daur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31279",
            "city_name": "Dera Allah Yar",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2723",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5783",
            "city_name": "Dera Baba Nanak",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5784",
            "city_name": "Dera Bassi",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31280",
            "city_name": "Dera Bugti",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2723",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31350",
            "city_name": "Dera Din Panah",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31351",
            "city_name": "Dera Ghazi Khan",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31281",
            "city_name": "Dera Murad Jamali",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2723",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31282",
            "city_name": "Dhadar",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2723",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5785",
            "city_name": "Dhanaula",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31352",
            "city_name": "Dhanote",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5786",
            "city_name": "Dharam Kot",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5787",
            "city_name": "Dhariwal",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5788",
            "city_name": "Dhilwan",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31353",
            "city_name": "Dhonkal",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31563",
            "city_name": "Dhoronaro",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5789",
            "city_name": "Dhuri",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31564",
            "city_name": "Digri",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31354",
            "city_name": "Dijkot",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31355",
            "city_name": "Dina",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5790",
            "city_name": "Dinanagar",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31356",
            "city_name": "Dinga",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31357",
            "city_name": "Dipalpur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31565",
            "city_name": "Diplo",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5791",
            "city_name": "Dirba",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31566",
            "city_name": "Dokri",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5792",
            "city_name": "Doraha",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31283",
            "city_name": "Duki",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2723",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31358",
            "city_name": "Dullewala",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31359",
            "city_name": "Dunga Bunga",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31360",
            "city_name": "Dunyapur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31361",
            "city_name": "Eminabad",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "48357",
            "city_name": "Faisalabad",
            "update_date": "2021-03-01 14:39:10",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31567",
            "city_name": "Faqirabad",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31363",
            "city_name": "Faqirwali",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5793",
            "city_name": "Faridkot",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31364",
            "city_name": "Faruka",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31365",
            "city_name": "Fateh Jang",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5794",
            "city_name": "Fateh Nangal",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5795",
            "city_name": "Fatehgarh Churian",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5796",
            "city_name": "Fatehgarh Sahib",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31366",
            "city_name": "Fatehpur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31367",
            "city_name": "Fazalpur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5797",
            "city_name": "Fazilka",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31368",
            "city_name": "Ferozwala",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5798",
            "city_name": "Firozpur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5799",
            "city_name": "Firozpur Cantonment",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31369",
            "city_name": "Fort Abbas",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31284",
            "city_name": "Gaddani",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2723",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31568",
            "city_name": "Gambat",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5800",
            "city_name": "Gardhiwala",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31569",
            "city_name": "Garello",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31370",
            "city_name": "Garh Maharaja",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31570",
            "city_name": "Garhi Khairo",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31571",
            "city_name": "Garhi Yasin",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5801",
            "city_name": "Garhshankar",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5802",
            "city_name": "Ghagga",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31371",
            "city_name": "Ghakar",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5803",
            "city_name": "Ghanaur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31572",
            "city_name": "Gharo",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31573",
            "city_name": "Ghauspur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31574",
            "city_name": "Ghotki",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31372",
            "city_name": "Ghurgushti",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5804",
            "city_name": "Giddarbaha",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5805",
            "city_name": "Gobindgarh",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31373",
            "city_name": "Gojra",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31575",
            "city_name": "Golarchi",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5806",
            "city_name": "Goniana",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5807",
            "city_name": "Goraya",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31576",
            "city_name": "Guddu",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31374",
            "city_name": "Gujar Khan",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31375",
            "city_name": "Gujranwala",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31376",
            "city_name": "Gujrat",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31577",
            "city_name": "Gulistan-E-Jauhar",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5808",
            "city_name": "Gurdaspur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5809",
            "city_name": "Guru Har Sahai",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31285",
            "city_name": "Gwadar",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2723",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31377",
            "city_name": "Hadali",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31378",
            "city_name": "Hafizabad",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5810",
            "city_name": "Hajipur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31578",
            "city_name": "Hala",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5811",
            "city_name": "Handiaya",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5812",
            "city_name": "Hariana",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31286",
            "city_name": "Harnai",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2723",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31379",
            "city_name": "Harnoli",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31380",
            "city_name": "Harunabad",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31381",
            "city_name": "Hasan Abdal",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31382",
            "city_name": "Hasilpur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31383",
            "city_name": "Haveli",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31384",
            "city_name": "Hazro",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31579",
            "city_name": "Hingorja",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5813",
            "city_name": "Hoshiarpur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31287",
            "city_name": "Hub",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2723",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31385",
            "city_name": "Hujra Shah Muqim",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5814",
            "city_name": "Hussainpur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31580",
            "city_name": "Hyderabad",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31386",
            "city_name": "Isa Khel",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "48362",
            "city_name": "Islamabad",
            "update_date": "2022-10-31 15:44:15",
            "state_id": "0",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31581",
            "city_name": "Islamkot",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31582",
            "city_name": "Jacobabad",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5815",
            "city_name": "Jagraon",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31387",
            "city_name": "Jahanian",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5816",
            "city_name": "Jaitu",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5817",
            "city_name": "Jalalabad",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31388",
            "city_name": "Jalalpur Bhattian",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31389",
            "city_name": "Jalalpur Jattan",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31390",
            "city_name": "Jalalpur Pirwala",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5818",
            "city_name": "Jalandhar",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5819",
            "city_name": "Jalandhar Cantonment",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31391",
            "city_name": "Jalla Jeem",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31583",
            "city_name": "Jam Nawaz Ali",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31584",
            "city_name": "Jam Sahib",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31392",
            "city_name": "Jamke Chima",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31393",
            "city_name": "Jampur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31394",
            "city_name": "Jand",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31395",
            "city_name": "Jandanwala",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5820",
            "city_name": "Jandiala",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31396",
            "city_name": "Jandiala Sherkhan",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31397",
            "city_name": "Jaranwala",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31585",
            "city_name": "Jati",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31398",
            "city_name": "Jatoi",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31399",
            "city_name": "Jauharabad",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31400",
            "city_name": "Jhang",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31401",
            "city_name": "Jhawarian",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31402",
            "city_name": "Jhelum",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31586",
            "city_name": "Jhol",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31587",
            "city_name": "Jhudo",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31288",
            "city_name": "Jiwani",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2723",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31588",
            "city_name": "Johi",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5821",
            "city_name": "Jugial",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31403",
            "city_name": "Kabirwala",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31589",
            "city_name": "Kadhan",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31404",
            "city_name": "Kahna Nau",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31405",
            "city_name": "Kahror Pakka",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31406",
            "city_name": "Kahuta",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31407",
            "city_name": "Kalabagh",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5822",
            "city_name": "Kalanaur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31408",
            "city_name": "Kalaswala",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31289",
            "city_name": "Kalat",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2723",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31409",
            "city_name": "Kaleke",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31410",
            "city_name": "Kalur Kot",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31411",
            "city_name": "Kamalia",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31412",
            "city_name": "Kamar Mashani",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31590",
            "city_name": "Kambar",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31413",
            "city_name": "Kamir",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31414",
            "city_name": "Kamoke",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31415",
            "city_name": "Kamra",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31591",
            "city_name": "Kandhra",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31592",
            "city_name": "Kandiari",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31593",
            "city_name": "Kandiaro",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31416",
            "city_name": "Kanganpur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5823",
            "city_name": "Kapurthala",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31362",
            "city_name": "Karachi",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31417",
            "city_name": "Karampur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31595",
            "city_name": "Karampur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31596",
            "city_name": "Kario Ghanwar",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31597",
            "city_name": "Karoondi",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31418",
            "city_name": "Karor Lal Esan",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5824",
            "city_name": "Karoran",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5825",
            "city_name": "Kartarpur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31598",
            "city_name": "Kashmor",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31419",
            "city_name": "Kasur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31599",
            "city_name": "Kazi Ahmad",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31600",
            "city_name": "Keti Bandar",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31601",
            "city_name": "Khadro",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31602",
            "city_name": "Khairpur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31603",
            "city_name": "Khairpur Nathan Shah",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31420",
            "city_name": "Khairpur Tamewali",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5826",
            "city_name": "Khamanon",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5827",
            "city_name": "Khanauri",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31604",
            "city_name": "Khandh Kot",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31421",
            "city_name": "Khanewal",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31422",
            "city_name": "Khangah Dogran",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31423",
            "city_name": "Khangarh",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5828",
            "city_name": "Khanna",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31424",
            "city_name": "Khanpur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31605",
            "city_name": "Khanpur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31290",
            "city_name": "Kharan",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2723",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5829",
            "city_name": "Kharar",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31425",
            "city_name": "Kharian",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5830",
            "city_name": "Khem Karan",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31426",
            "city_name": "Khewra",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31606",
            "city_name": "Khipro",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31607",
            "city_name": "Khoski",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31608",
            "city_name": "Khuhra",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31427",
            "city_name": "Khundian",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31428",
            "city_name": "Khurianwala",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31429",
            "city_name": "Khushab",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31291",
            "city_name": "Khuzdar",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2723",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31609",
            "city_name": "Khyber",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "48363",
            "city_name": "Kohat",
            "update_date": "2022-10-31 15:44:16",
            "state_id": "0",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31292",
            "city_name": "Kohlu",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2723",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31430",
            "city_name": "Kot Abdul Malik",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31431",
            "city_name": "Kot Addu",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31610",
            "city_name": "Kot Diji",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5831",
            "city_name": "Kot Fatta",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31611",
            "city_name": "Kot Ghulam Mohammad",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5832",
            "city_name": "Kot Isa Khan",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5833",
            "city_name": "Kot Kapura",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31432",
            "city_name": "Kot Mithan",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31433",
            "city_name": "Kot Moman",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31434",
            "city_name": "Kot Radha Kishan",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31435",
            "city_name": "Kot Samaba",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5834",
            "city_name": "Kotkapura",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31436",
            "city_name": "Kotli Loharan",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31612",
            "city_name": "Kotri",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31613",
            "city_name": "Kumb",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31437",
            "city_name": "Kundian",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31438",
            "city_name": "Kunjah",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31614",
            "city_name": "Kunri",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5835",
            "city_name": "Kurali",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31439",
            "city_name": "Lahore",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31615",
            "city_name": "Lakhi",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31440",
            "city_name": "Lalamusa",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31441",
            "city_name": "Lalian",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5836",
            "city_name": "Lalru",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31616",
            "city_name": "Larkana",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5837",
            "city_name": "Lehra Gaga",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31442",
            "city_name": "Liaqatabad",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31443",
            "city_name": "Liaqatpur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31444",
            "city_name": "Lieah",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31445",
            "city_name": "Liliani",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5838",
            "city_name": "Lodhian Khas",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31446",
            "city_name": "Lodhran",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5839",
            "city_name": "Longowal",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31293",
            "city_name": "Loralai",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2723",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31447",
            "city_name": "Ludhewala Waraich",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5840",
            "city_name": "Ludhiana",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31294",
            "city_name": "Mach",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2723",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5841",
            "city_name": "Machhiwara",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31617",
            "city_name": "Madeji",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5842",
            "city_name": "Mahilpur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31448",
            "city_name": "Mailsi",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5843",
            "city_name": "Majitha",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31449",
            "city_name": "Makhdumpur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31450",
            "city_name": "Makhdumpur Rashid",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5844",
            "city_name": "Makhu",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31451",
            "city_name": "Malakwal",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5845",
            "city_name": "Malaut",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5846",
            "city_name": "Malerkotla",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5847",
            "city_name": "Maloud",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31452",
            "city_name": "Mamu Kanjan",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31453",
            "city_name": "Mananwala Jodh Singh",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31454",
            "city_name": "Mandi Bahauddin",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5848",
            "city_name": "Mandi Gobindgarh",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31455",
            "city_name": "Mandi Sadiq Ganj",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31456",
            "city_name": "Mangat",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31457",
            "city_name": "Mangla",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31458",
            "city_name": "Mankera",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5849",
            "city_name": "Mansa",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "48364",
            "city_name": "Mardan",
            "update_date": "2022-10-31 15:44:16",
            "state_id": "0",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31295",
            "city_name": "Mastung",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2723",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31618",
            "city_name": "Matiari",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31619",
            "city_name": "Matli",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5850",
            "city_name": "Maur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31620",
            "city_name": "Mehar",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31621",
            "city_name": "Mehrabpur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31459",
            "city_name": "Mian Channun",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31460",
            "city_name": "Miani",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31461",
            "city_name": "Mianwali",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31462",
            "city_name": "Minchinabad",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31622",
            "city_name": "Miro Khan",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "48365",
            "city_name": "Mirpur",
            "update_date": "2022-10-31 15:44:16",
            "state_id": "0",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31623",
            "city_name": "Mirpur Bathoro",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31624",
            "city_name": "Mirpur Khas",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31625",
            "city_name": "Mirpur Mathelo",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31626",
            "city_name": "Mirpur Sakro",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31627",
            "city_name": "Mirwah",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31463",
            "city_name": "Mitha Tiwana",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31628",
            "city_name": "Mithi",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5851",
            "city_name": "Moga",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5852",
            "city_name": "Mohali",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5853",
            "city_name": "Moonak",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5854",
            "city_name": "Morinda",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31629",
            "city_name": "Moro",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5855",
            "city_name": "Mukerian",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5856",
            "city_name": "Muktsar",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5857",
            "city_name": "Mullanpur Dakha",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5858",
            "city_name": "Mullanpur Garibdas",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31464",
            "city_name": "Multan",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5859",
            "city_name": "Munak",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5860",
            "city_name": "Muradpura",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31465",
            "city_name": "Muridke",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31466",
            "city_name": "Murree",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31467",
            "city_name": "Mustafabad",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "48366",
            "city_name": "Muzaffarabad",
            "update_date": "2022-10-31 15:44:16",
            "state_id": "0",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31468",
            "city_name": "Muzaffargarh",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5861",
            "city_name": "Nabha",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31630",
            "city_name": "Nabisar",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5862",
            "city_name": "Nakodar",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5863",
            "city_name": "Nangal",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31469",
            "city_name": "Nankana Sahib",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31470",
            "city_name": "Narang",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31471",
            "city_name": "Narowal",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31631",
            "city_name": "Nasarpur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31632",
            "city_name": "Nasirabad",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31633",
            "city_name": "Naudero",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31634",
            "city_name": "Naukot",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31635",
            "city_name": "Naushahro Firoz",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31636",
            "city_name": "Nawabshah",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5864",
            "city_name": "Nawashahr",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5865",
            "city_name": "Naya Nangal",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5866",
            "city_name": "Nehon",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31472",
            "city_name": "Noorpur Thal",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31473",
            "city_name": "Nowshera",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31474",
            "city_name": "Nowshera Virkan",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5867",
            "city_name": "Nurmahal",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31296",
            "city_name": "Nushki",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2723",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31637",
            "city_name": "Oderolal Station",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31475",
            "city_name": "Okara",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31297",
            "city_name": "Ormara",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2723",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "48372",
            "city_name": "Other",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "1",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31638",
            "city_name": "Pacca Chang",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31639",
            "city_name": "Padidan",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31476",
            "city_name": "Pakpattan",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31640",
            "city_name": "Pano Aqil",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31298",
            "city_name": "Pasni",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2723",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31477",
            "city_name": "Pasrur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5868",
            "city_name": "Pathankot",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5869",
            "city_name": "Patiala",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5870",
            "city_name": "Patti",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31478",
            "city_name": "Pattoki",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5871",
            "city_name": "Pattran",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5872",
            "city_name": "Payal",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31641",
            "city_name": "Perumal",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "48367",
            "city_name": "Peshawar",
            "update_date": "2022-10-31 15:44:16",
            "state_id": "0",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "48368",
            "city_name": "Peshawar Cantt.",
            "update_date": "2022-10-31 15:44:16",
            "state_id": "0",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5873",
            "city_name": "Phagwara",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31479",
            "city_name": "Phalia",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5874",
            "city_name": "Phillaur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31480",
            "city_name": "Phularwan",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31642",
            "city_name": "Phulji",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31481",
            "city_name": "Pind Dadan Khan",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31482",
            "city_name": "Pindi Bhattian",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31483",
            "city_name": "Pindi Gheb",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31643",
            "city_name": "Pirjo Goth",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31484",
            "city_name": "Pirmahal",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31644",
            "city_name": "Piryaloi",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31299",
            "city_name": "Pishin",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2723",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31645",
            "city_name": "Pithoro",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5875",
            "city_name": "Qadian",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31485",
            "city_name": "Qadirabad",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31486",
            "city_name": "Qadirpur Ran",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31487",
            "city_name": "Qila Disar Singh",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31488",
            "city_name": "Qila Sobha Singh",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31489",
            "city_name": "Quaidabad",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31300",
            "city_name": "Quetta",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2723",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31490",
            "city_name": "Rabwah",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31646",
            "city_name": "Radhan",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31491",
            "city_name": "Rahim Yar Khan",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5876",
            "city_name": "Rahon",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5877",
            "city_name": "Raikot",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31492",
            "city_name": "Raiwind",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31493",
            "city_name": "Raja Jang",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5878",
            "city_name": "Raja Sansi",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31494",
            "city_name": "Rajanpur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31647",
            "city_name": "Rajo Khanani",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5879",
            "city_name": "Rajpura",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5880",
            "city_name": "Ram Das",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5881",
            "city_name": "Raman",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5882",
            "city_name": "Rampura",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31648",
            "city_name": "Ranipur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31495",
            "city_name": "Rasulnagar",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31649",
            "city_name": "Ratodero",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31496",
            "city_name": "Rawalpindi",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5883",
            "city_name": "Rayya",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31497",
            "city_name": "Renala Khurd",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31650",
            "city_name": "Rohri",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31498",
            "city_name": "Rojhan",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5884",
            "city_name": "Rupnagar",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5885",
            "city_name": "Rurki Kasba",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31651",
            "city_name": "Rustam",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "48369",
            "city_name": "SWABI",
            "update_date": "2022-10-31 15:44:16",
            "state_id": "0",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31499",
            "city_name": "Saddar Gogera",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31500",
            "city_name": "Sadiqabad",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31652",
            "city_name": "Saeedabad",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31501",
            "city_name": "Safdarabad",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31502",
            "city_name": "Sahiwal",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5886",
            "city_name": "Sahnewal",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31653",
            "city_name": "Sakrand",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5887",
            "city_name": "Samana",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31654",
            "city_name": "Samaro",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31503",
            "city_name": "Samasatta",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31504",
            "city_name": "Sambrial",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31505",
            "city_name": "Sammundri",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5888",
            "city_name": "Samrala",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5889",
            "city_name": "Sanaur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31506",
            "city_name": "Sangala Hill",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5890",
            "city_name": "Sangat",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31655",
            "city_name": "Sanghar",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5891",
            "city_name": "Sangrur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31507",
            "city_name": "Sanjwal",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31656",
            "city_name": "Sann",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5892",
            "city_name": "Sansarpur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31508",
            "city_name": "Sarai Alamgir",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31509",
            "city_name": "Sarai Sidhu",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5893",
            "city_name": "Sardulgarh",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31510",
            "city_name": "Sargodha",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31657",
            "city_name": "Sarhari",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31658",
            "city_name": "Sehwan",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31659",
            "city_name": "Setharja",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31511",
            "city_name": "Shadiwal",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31660",
            "city_name": "Shah Dipalli",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31661",
            "city_name": "Shahdadkot",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31662",
            "city_name": "Shahdadpur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5894",
            "city_name": "Shahkot",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31512",
            "city_name": "Shahkot",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31663",
            "city_name": "Shahpur Chakar",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31513",
            "city_name": "Shahpur City",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31664",
            "city_name": "Shahpur Jahania",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31514",
            "city_name": "Shahpur Saddar",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31515",
            "city_name": "Shakargarh",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5895",
            "city_name": "Sham Churasi",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31516",
            "city_name": "Sharqpur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31517",
            "city_name": "Shehr Sultan",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5896",
            "city_name": "Shekhpura",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31518",
            "city_name": "Shekhupura",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31665",
            "city_name": "Shikarpur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31519",
            "city_name": "Shujaabad",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31520",
            "city_name": "Sialkot",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31301",
            "city_name": "Sibi",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2723",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31521",
            "city_name": "Sillanwali",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31666",
            "city_name": "Sinjhoro",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5897",
            "city_name": "Sirhind",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31667",
            "city_name": "Sita Road",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31668",
            "city_name": "Sobhodero",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31522",
            "city_name": "Sodhra",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31523",
            "city_name": "Sohawa",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31302",
            "city_name": "Sohbatpur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2723",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5898",
            "city_name": "Sri Hargobindpur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5899",
            "city_name": "Sujanpur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31669",
            "city_name": "Sujawal",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31524",
            "city_name": "Sukheke",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31670",
            "city_name": "Sukkur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5900",
            "city_name": "Sultanpur Lodhi",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5901",
            "city_name": "Sunam",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31303",
            "city_name": "Surab",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2723",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "48370",
            "city_name": "Swat",
            "update_date": "2022-10-31 15:44:16",
            "state_id": "0",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31525",
            "city_name": "Talagang",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31671",
            "city_name": "Talhar",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5902",
            "city_name": "Talwandi Bhai",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5903",
            "city_name": "Talwara",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31526",
            "city_name": "Tandlianwala",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31672",
            "city_name": "Tando Adam",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31673",
            "city_name": "Tando Allah Yar",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31674",
            "city_name": "Tando Bagho",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31675",
            "city_name": "Tando Ghulam Ali",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31676",
            "city_name": "Tando Jam",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31677",
            "city_name": "Tando Jan Mohammad",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31678",
            "city_name": "Tando Mitha Khan",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31679",
            "city_name": "Tando Muhammad Khan",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31680",
            "city_name": "Tangwani",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5904",
            "city_name": "Tappa",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5905",
            "city_name": "Tarn Taran",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31527",
            "city_name": "Taunsa",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31528",
            "city_name": "Taxila",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31681",
            "city_name": "Thano Bula Khan",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31682",
            "city_name": "Thari Mirwah",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31683",
            "city_name": "Tharushah",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31684",
            "city_name": "Thatta",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31685",
            "city_name": "Ther I",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31686",
            "city_name": "Ther I Mohabat",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31687",
            "city_name": "Thul",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31529",
            "city_name": "Tibba Sultanpur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31530",
            "city_name": "Toba Tek Singh",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31531",
            "city_name": "Tulamba",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31304",
            "city_name": "Turbat",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2723",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31688",
            "city_name": "Ubauro",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31532",
            "city_name": "Uch",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31689",
            "city_name": "Umarkot",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5906",
            "city_name": "Urmar Tanda",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31305",
            "city_name": "Usta Muhammad",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2723",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31306",
            "city_name": "Uthal",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2723",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31533",
            "city_name": "Vihari",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31307",
            "city_name": "Wadh",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2723",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31534",
            "city_name": "Wah",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31690",
            "city_name": "Warah",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2729",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31535",
            "city_name": "Warburton",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31536",
            "city_name": "Wazirabad",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31308",
            "city_name": "Winder",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2723",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31537",
            "city_name": "Yazman",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31538",
            "city_name": "Zafarwal",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31539",
            "city_name": "Zahir Pir",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31309",
            "city_name": "Zehri",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2723",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31310",
            "city_name": "Zhob",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2723",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "31311",
            "city_name": "Ziarat",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2723",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5907",
            "city_name": "Zira",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        },
        {
            "country_id": "166",
            "city_id": "5908",
            "city_name": "Zirakpur",
            "update_date": "2020-01-02 02:19:00",
            "state_id": "2728",
            "is_deleted": "N"
        }
    ]
}
  """;

}
