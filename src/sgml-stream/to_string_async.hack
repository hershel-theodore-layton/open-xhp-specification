/** open-xhp-specification is MIT licensed, see /LICENSE. */
namespace HTL\OpenXHPSpecification;

use namespace HTL\SGMLStreamInterfaces;

function to_string_async(
  SGMLStreamInterfaces\Element $element,
)[defaults]: Awaitable<string> {
  return $element->toHTMLStringAsync();
}
