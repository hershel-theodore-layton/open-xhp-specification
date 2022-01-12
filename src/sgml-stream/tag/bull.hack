namespace HTL\OpenXHPSpecification\tag;

final xhp class bull extends \HTL\SGMLStream\RootElement {
  use \HTL\SGMLStream\ElementWithOpenAndCloseTags;

  attribute bool burp;

  protected string $tagName = 'bull';
  const string TAG_NAME = 'bull';
}
