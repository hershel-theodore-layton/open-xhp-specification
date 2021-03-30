namespace HTL\OpenXHPSpecification;

use type Facebook\HackTest\HackTest;
use function Facebook\FBExpect\expect;

final class AsStringsTest extends HackTest {
  public async function test_the_strings_are_not_yet_escaped(
  ): Awaitable<void> {
    $tag = <tag:empty>{'<script>'}</tag:empty>;
    expect(get_children($tag))->toEqual(vec['<script>']);
  }
}
