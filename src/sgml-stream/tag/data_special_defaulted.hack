namespace HTL\OpenXHPSpecification\tag;

final xhp class data_special_defaulted extends \HTL\SGMLStream\RootElement {
  use \HTL\SGMLStream\ElementWithOpenAndCloseTags;
  const ctx INITIALIZATION_CTX = [];

  attribute string data-special = 'default';

  protected string $tagName = 'data_special_defaulted';
  const string TAG_NAME = 'data_special_defaulted';
}
