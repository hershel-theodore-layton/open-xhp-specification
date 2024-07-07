/** open-xhp-specification is MIT licensed, see /LICENSE. */
namespace HTL\OpenXHPSpecification\tag;

final xhp class herp_without_default_and_derp_defaulted
  extends \Facebook\XHP\HTML\element {
  attribute
    string herp,
    string derp = 'default';

  protected string $tagName = 'herp_without_default_and_derp_defaulted';
}
