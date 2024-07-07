/** open-xhp-specification is MIT licensed, see /LICENSE. */
namespace HTL\OpenXHPSpecification;

use type Facebook\HackTest\HackTest;
use function Facebook\FBExpect\expect;

final class AsElementsTest extends HackTest {
  public async function test_the_elements_are_saved(): Awaitable<void> {
    $child_1 = <tag:empty />;
    $child_2 = <tag:herp_and_durr />;
    $tag = <tag:empty>{$child_1}{$child_2}</tag:empty>;
    expect(get_children($tag))->toEqual(vec[$child_1, $child_2]);
  }
}
