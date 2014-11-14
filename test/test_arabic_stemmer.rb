require 'arabic_stemmer'
require 'test/unit'

class ArabicStemmerTest < Test::Unit::TestCase
   def test_do_not_stem_keywords
    assert_equal "الله", ArabicStemmer.to_arabic_stem("الله")
  end

  def test_remove_non_alphanumeric
    expected_word = "كلمة"
    assert_equal expected_word, ArabicStemmer.to_arabic_stem("&كلمة.:;")
    assert_equal expected_word, ArabicStemmer.to_arabic_stem("كلمة,،_")
    assert_equal expected_word, ArabicStemmer.to_arabic_stem("كلمة\"\';")
    assert_equal expected_word, ArabicStemmer.to_arabic_stem("كلمة?؟)(")
  end

  def test_remove_diacratics
    assert_equal "ب", ArabicStemmer.to_arabic_stem("بَ")
  end

  def test_convert_alif
    assert_equal "الف", ArabicStemmer.to_arabic_stem("ألف")
#    assert_equal "اذان", "آذان"
    assert_equal "اسلام", ArabicStemmer.to_arabic_stem("إسلام")
  end

  def test_long_and_short_words_no_changes
    assert_equal "ضرب", ArabicStemmer.to_arabic_stem("ضرب")
    assert_equal "حذاء", ArabicStemmer.to_arabic_stem("حذاء")
    assert_equal "مقاطعة", ArabicStemmer.to_arabic_stem("مقاطعة")
    assert_equal "برنامج", ArabicStemmer.to_arabic_stem("برنامج")
    assert_equal "بريطانيا", ArabicStemmer.to_arabic_stem("بريطانيا")
  end

  def test_remove_suffixes
    assert_equal "معلم", ArabicStemmer.to_arabic_stem("معلمان")
    assert_equal "معلم", ArabicStemmer.to_arabic_stem("معلمون")
    assert_equal "معلم", ArabicStemmer.to_arabic_stem("معلمات")
    assert_equal "معلم", ArabicStemmer.to_arabic_stem("معلمين")
    assert_equal "معلم", ArabicStemmer.to_arabic_stem("معلمهن")
    assert_equal "معلم", ArabicStemmer.to_arabic_stem("معلمهم")
    assert_equal "معلم", ArabicStemmer.to_arabic_stem("معلمكم")
  end

  def test_remove_prefixes
    assert_equal "رب", ArabicStemmer.to_arabic_stem("الرب")
    assert_equal "اسلام", ArabicStemmer.to_arabic_stem("الإسلام")
    assert_equal "طلبة", ArabicStemmer.to_arabic_stem("الطلبة")
    assert_equal "ضرب", ArabicStemmer.to_arabic_stem("الضرب")
    assert_equal "سيف", ArabicStemmer.to_arabic_stem("كالسيف")
    assert_equal "سيف", ArabicStemmer.to_arabic_stem("والسيف")
    assert_equal "قول", ArabicStemmer.to_arabic_stem("سيقول")
    assert_equal "قول", ArabicStemmer.to_arabic_stem("ستقول")
    assert_equal "برمج", ArabicStemmer.to_arabic_stem("سيبرمج")
    assert_equal "برمجة", ArabicStemmer.to_arabic_stem("للبرمجة")
  end

  def test_stem_words
   assert_equal "مناضل", ArabicStemmer.to_arabic_stem("المناضلين")
   assert_equal "مستوطن", ArabicStemmer.to_arabic_stem("المستوطنون")
  end
end
