namespace HTL\OpenXHPSpecification;

use namespace HTL\SGMLStreamInterfaces;

function to_string_async(
  SGMLStreamInterfaces\Element $element,
): Awaitable<string> {
  return $element->toHTMLStringAsync();
}
