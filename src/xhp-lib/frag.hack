/** open-xhp-specification is MIT licensed, see /LICENSE. */
namespace HTL\OpenXHPSpecification;

use type XHPChild;
use namespace Facebook\XHP\Core;

function frag(?XHPChild $children): Core\frag {
  return <Core:frag>{$children}</Core:frag>;
}
