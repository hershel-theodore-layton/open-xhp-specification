/** open-xhp-specification is MIT licensed, see /LICENSE. */
namespace HTL\OpenXHPSpecification;

use type XHPChild;

function get_children(\Facebook\XHP\Core\node $node): vec<XHPChild> {
  return $node->getChildren();
}
