namespace HTL\OpenXHPSpecification\tag;

final xhp class herp_required extends \HTL\SGMLStream\RootElement {
  use \HTL\SGMLStream\ElementWithOpenAndCloseTags;

  attribute string herp @required;

  protected string $tagName = 'herp_required';
}
