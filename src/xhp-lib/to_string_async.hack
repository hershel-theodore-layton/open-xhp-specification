/** open-xhp-specification is MIT licensed, see /LICENSE. */
namespace HTL\OpenXHPSpecification;

function to_string_async(\Facebook\XHP\Core\node $node): Awaitable<string> {
  return $node->toStringAsync();
}
