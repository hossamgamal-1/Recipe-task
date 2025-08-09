class HeroTagHelper {
  const HeroTagHelper._();

  static String getRecipeImageTag(int id) => 'recipe-image-$id';
  static String getCreatorSectionTag(int id) => 'creator-section-$id';
  static String getTimeSectionTag(int id) => 'time-section-$id';
  static String getSpotlightSectionTag(int id) => 'spotlight-section-$id';
}
