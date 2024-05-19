namespace HTL\OpenXHPSpecification\tag;

final xhp class empty extends \HTL\SGMLStream\RootElement {
  use \HTL\SGMLStream\ElementWithOpenAndCloseTags;
  const ctx INITIALIZATION_CTX = [];

  protected string $tagName = 'empty';
  const string TAG_NAME = 'empty';
}
