/** open-xhp-specification is MIT licensed, see /LICENSE. */
namespace HTL\OpenXHPSpecification;

use type XHPChild;

function frag(?XHPChild $children)[]: tag\frag {
  return <tag:frag>{$children}</tag:frag>;
}
