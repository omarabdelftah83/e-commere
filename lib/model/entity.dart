class Product {
  final int id, price;
  final String title, subTitle, description, image;

  Product(
      {required this.id,
        required this.price,
        required this.title,
        required  this.subTitle,
        required this.description,
        required this.image});
}

// list of products
List<Product> products = [
  Product(
    id: 1,
    price: 59,
    title: "سماعات لاسلكية",
    subTitle: "جودة صوت عالية",
    image: "assets/images/airpod(1).png",
    description:
    "تمتاز سماعات اير بودز برو اللاسلكية بتصميمها الأنيق والجذاب، وهي مصنوعة من مواد عالية الجودة لإستخدام طويل المدى، بالإضافة إلى انها تتمتع بصوت عالي الجودة ونقي، بفضل تقنية الإلغاء النشط للضوضاء.",
  ),
  Product(
    id: 2,

    price: 1099,
    title: "جهاز موبايل",
    subTitle: "وأصبح للموبايل قوة",
    image: "assets/images/mobile.png",
    description:
    "الأداء يأتي الهاتف بمعالج من نوع Exynos 850 بتكنولوجيا الـ 8 نانو مع معالج رسومي من نوع Mali-G52 فهو نفس المعالج الموجود في الـ Samsung Galaxy M12 والـ Samsung Galaxy A21s .. اما النسخة المصرية من الهاتف تأتي بمعالج ميدياتيك G80 تكنولوجيا 12 نانو . الكاميرا الأمامية تأتي بدقة 8 ميجا بكسل بفتحة عدسة F/2.2 .",
  ),
  Product(
      id: 3,
      price: 39,
      title: "نظارات ثلاثية الأبعاد",
      subTitle: "لنقلك للعالم الافتراضي",
      image: "assets/images/class.png",
      description:"عند استخدام النظارات ثلاثية الأبعاد النشطة للمرة الأولى، اجعل المسافة بين النظارات والتلفاز ضمن مدى 50 سم ، ثم قم بتشغيل التلفاز واضغط مع الاستمرار على زر Power "
  ),
  Product(
      id: 4,
      price: 56,
      title: "سماعات",
      subTitle: "لساعات استماع طويلة",
      image: "assets/images/headset.png",
      description:
      "سماعات الرأس ‏ هي اداة تستخدم للاستماع بصورة خاصة للصوت. كان الناس في الفترة الأولى من ظهور المذياع يعتمدون على سماعات الرأس للاستماع وكانت آنذاك بصيغة المونو ثم أصبحت السماعة ذات قناتين للصوت تصدر من كل سماعة صوت منفصل عن الأخرى وسمى النظام بالاستيريو ويكيبيديا"  ),
  Product(
      id: 5,
      price: 68,
      title: "مسجل صوت",
      subTitle: "سجل اللحظات المهمة حولك",
      image: "assets/images/speaker.png",
      description:
      "إن مسجل الصوت عبارة عن تطبيق لتسجيل المحاضرات والمحادثات، وغير ذلك من الأصوات (المُسمى سابقًا "  ),
  Product(
      id: 6,
      price: 39,
      title: "كاميرات كمبيوتر",
      subTitle: "بجودة ودقة صورة عالية",
      image: "assets/images/camera(1).png",
      description:"هي كاميرا مصممة لاستخدامها كجهاز طرفي للكمبيوتر، تبث فيديو رقمي عبر ويب و عبر الإنترنت عن طريق نقل صور فورية، "
  ),
];