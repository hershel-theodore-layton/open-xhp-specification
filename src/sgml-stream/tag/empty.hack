namespace HTL\OpenXHPSpecification\tag;

final xhp class empty extends \HTL\SGMLStream\RootElement {
  use \HTL\SGMLStream\ElementWithOpenAndCloseTags;

  protected string $tagName = 'empty';
}
