namespace HTL\OpenXHPSpecification\tag;

final xhp class herp_and_derp extends \HTL\SGMLStream\RootElement {
  use \HTL\SGMLStream\ElementWithOpenAndCloseTags;

  attribute
    string herp,
    float derp;

  protected string $tagName = 'herp_and_derp';
}
