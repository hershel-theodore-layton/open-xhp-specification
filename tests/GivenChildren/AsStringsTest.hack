/** open-xhp-specification is MIT licensed, see /LICENSE. */
namespace HTL\OpenXHPSpecification;

use type Facebook\HackTest\HackTest;
use function HTL\Expect\expect;

final class AsStringsTest extends HackTest {
  public async function test_the_strings_are_not_yet_escaped(
  )[defaults]: Awaitable<void> {
    $tag = <tag:empty>{'<script>'}</tag:empty>;
    expect(get_children($tag))->toEqual(vec['<script>']);
  }
}
