/** open-xhp-specification is MIT licensed, see /LICENSE. */
namespace HTL\OpenXHPSpecification;

use type Facebook\HackTest\HackTest;
use function Facebook\FBExpect\expect;

final class AsFragsTest extends HackTest {
  public async function test_the_frags_are_unpacked_in_order(
  ): Awaitable<void> {
    $tag =
      <tag:empty>
        {frag(vec[1, 2, frag(keyset[3, 4, 5]), 6])}
        {frag(7)}
      </tag:empty>;
    expect(get_children($tag))->toEqual(vec[1, 2, 3, 4, 5, 6, 7]);
  }
}
