/** open-xhp-specification is MIT licensed, see /LICENSE. */
namespace HTL\OpenXHPSpecification;

use type Facebook\HackTest\HackTest;
use function Facebook\FBExpect\expect;

final class WithNullsTest extends HackTest {
  public async function test_the_nulls_are_ignored(): Awaitable<void> {
    $tag = <tag:empty>{null}{1}{null}{1.1}{null}</tag:empty>;
    expect(get_children($tag))->toEqual(vec[1, 1.1]);
  }
}
