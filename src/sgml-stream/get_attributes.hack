/** open-xhp-specification is MIT licensed, see /LICENSE. */
namespace HTL\OpenXHPSpecification;

function get_attributes(
  \HTL\SGMLStream\RootElement $element,
): (dict<string, mixed>, dict<string, mixed>) {
  return AccessProtected::getAttributesForElement($element);
}

final class AccessProtected extends \HTL\SGMLStream\RootElement {
  const ctx INITIALIZATION_CTX = [];
  public static function getAttributesForElement(
    \HTL\SGMLStreamInterfaces\Element $element,
  ): (dict<string, nonnull>, dict<string, arraykey>) {
    return tuple(
      $element->getDeclaredAttributes(),
      $element->getDataAndAriaAttributes(),
    );
  }

  <<__Override>>
  public function placeIntoSnippetStream(
    \HTL\SGMLStreamInterfaces\SnippetStream $_stream,
    \HTL\SGMLStreamInterfaces\Flow $_init_flow,
  ): void {}
}
