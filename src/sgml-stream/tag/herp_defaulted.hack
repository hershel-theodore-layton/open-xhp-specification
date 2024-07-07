/** open-xhp-specification is MIT licensed, see /LICENSE. */
namespace HTL\OpenXHPSpecification\tag;

final xhp class herp_defaulted extends \HTL\SGMLStream\RootElement {
  use \HTL\SGMLStream\ElementWithOpenAndCloseTags;
  const ctx INITIALIZATION_CTX = [];

  attribute string herp = 'default';

  protected string $tagName = 'herp_defaulted';
  const string TAG_NAME = 'herp_defaulted';
}
