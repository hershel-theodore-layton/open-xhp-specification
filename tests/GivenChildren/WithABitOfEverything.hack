namespace HTL\OpenXHPSpecification;

use type Facebook\HackTest\HackTest;
use function Facebook\FBExpect\expect;

final class WithALittleBitOfEverything extends HackTest {
  public async function test_the_frags_and_arrays_are_unpacked_in_order(
  ): Awaitable<void> {
    $tag =
      <tag:empty>
        {frag(vec[1, 2, frag(keyset[3, 4, 5]), 6, null])}
        Some text here
        {frag(null)}
        {null}
        With lots of &hearts;
      </tag:empty>;
    expect(get_children($tag))->toEqual(
      vec[1, 2, 3, 4, 5, 6, 7, 'Some text here', 'With lots of &hearts;'],
    );
  }
}
