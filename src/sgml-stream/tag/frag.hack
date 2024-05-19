namespace HTL\OpenXHPSpecification\tag;

use type XHPChild;

final xhp class frag
  extends \HTL\SGMLStream\RootElement
  implements \HTL\SGMLStreamInterfaces\FragElement {
  const ctx INITIALIZATION_CTX = [];

  public function getFragChildren()[]: vec<XHPChild> {
    return $this->getChildren();
  }

  <<__Override>>
  public function placeIntoSnippetStream(
    \HTL\SGMLStreamInterfaces\SnippetStream $stream,
    \HTL\SGMLStreamInterfaces\Init<\HTL\SGMLStreamInterfaces\Flow> $init_flow,
  ): void {
    $this->placeMyChildrenIntoSnippetStream($stream, $init_flow);
  }
}
