/** open-xhp-specification is MIT licensed, see /LICENSE. */
namespace HTL\OpenXHPSpecification;

use type Facebook\HackTest\HackTest;
use function Facebook\FBExpect\expect;

final class AsArraysTest extends HackTest {
  public async function test_the_arrays_are_unpacked_in_order(
  )[defaults]: Awaitable<void> {
    $tag =
      <tag:empty>
        {vec[1, vec[2, 3, dict['four' => 4, 'five' => keyset[5]]]]}
        {vec[vec[vec[6], 7], 8]}
      </tag:empty>;
    expect(get_children($tag))->toEqual(vec[1, 2, 3, 4, 5, 6, 7, 8]);
  }
}
