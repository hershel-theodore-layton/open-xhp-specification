namespace HTL\OpenXHPSpecification\tag;

final xhp class herp_and_durr extends \HTL\SGMLStream\RootElement {
  use \HTL\SGMLStream\ElementWithOpenAndCloseTags;

  attribute
    string herp,
    float durr;

  protected string $tagName = 'herp_and_durr';
}
