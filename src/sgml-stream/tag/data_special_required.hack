namespace HTL\OpenXHPSpecification\tag;

final xhp class data_special_required extends \HTL\SGMLStream\RootElement {
  use \HTL\SGMLStream\ElementWithOpenAndCloseTags;

  attribute string data-special @required;

  protected string $tagName = 'data_special_required';
  const string TAG_NAME = 'data_special_required';
}
