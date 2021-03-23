namespace HTL\OpenXHPSpecification\tag;

final xhp class data_special_typed extends \HTL\SGMLStream\RootElement {
  use \HTL\SGMLStream\ElementWithOpenAndCloseTags;

  attribute string data-special;

  protected string $tagName = 'data_special_typed';
}
