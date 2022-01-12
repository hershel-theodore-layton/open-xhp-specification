namespace HTL\OpenXHPSpecification\tag;

final xhp class herp_lateinit extends \HTL\SGMLStream\RootElement {
  use \HTL\SGMLStream\ElementWithOpenAndCloseTags;

  attribute string herp @lateinit;

  protected string $tagName = 'herp_lateinit';
  const string TAG_NAME = 'herp_lateinit';
}
