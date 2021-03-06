namespace HTL\OpenXHPSpecification;

use type Facebook\HackTest\HackTest;
use function Facebook\FBExpect\expect;

final class AsNumbersTest extends HackTest {
  public async function test_the_numbers_are_not_cast_to_a_string(
  ): Awaitable<void> {
    $tag = <tag:empty>{1}{1.1}</tag:empty>;
    expect(get_children($tag))->toEqual(vec[1, 1.1]);
  }
}
