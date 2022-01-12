namespace HTL\OpenXHPSpecification\tag;

final xhp class herp_defaulted extends \HTL\SGMLStream\RootElement {
  use \HTL\SGMLStream\ElementWithOpenAndCloseTags;

  attribute string herp = 'default';

  protected string $tagName = 'herp_defaulted';
  const string TAG_NAME = 'herp_defaulted';
}
