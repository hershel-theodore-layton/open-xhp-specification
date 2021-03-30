namespace HTL\OpenXHPSpecification\tag;

use type XHPChild;

final xhp class frag
  extends \HTL\SGMLStream\RootElement
  implements \HTL\SGMLStreamInterfaces\FragElement {

  public function getFragChildren(): vec<XHPChild> {
    return $this->getChildren();
  }

  <<__Override>>
  public function placeIntoSnippetStream(
    \HTL\SGMLStreamInterfaces\SnippetStream $stream,
  ): void {
    $this->placeMyChildrenIntoSnippetStream($stream);
  }
}
