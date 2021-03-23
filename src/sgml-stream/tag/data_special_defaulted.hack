namespace HTL\OpenXHPSpecification\tag;

final xhp class data_special_defaulted extends \HTL\SGMLStream\RootElement {
  use \HTL\SGMLStream\ElementWithOpenAndCloseTags;

  attribute string data-special = 'default';

  protected string $tagName = 'data_special_defaulted';
}
