namespace HTL\OpenXHPSpecification;

use type XHPChild;

function get_children(\HTL\SGMLStream\RootElement $element): vec<XHPChild> {
  return AccessProtectedChildren::getChildrenPublic($element);
}

final class AccessProtectedChildren extends \HTL\SGMLStream\RootElement {
  const ctx INITIALIZATION_CTX = [];

  public static function getChildrenPublic(
    \HTL\SGMLStreamInterfaces\Element $element,
  ): vec<XHPChild> {
    return $element->getChildren();
  }

  <<__Override>>
  public function placeIntoSnippetStream(
    \HTL\SGMLStreamInterfaces\SnippetStream $_stream,
    \HTL\SGMLStreamInterfaces\Flow $_init_flow,
  ): void {}
}
