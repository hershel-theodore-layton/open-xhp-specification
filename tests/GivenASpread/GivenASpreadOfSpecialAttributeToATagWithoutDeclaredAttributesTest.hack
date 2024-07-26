/** open-xhp-specification is MIT licensed, see /LICENSE. */
namespace HTL\OpenXHPSpecification;

use type Facebook\HackTest\HackTest;
use function Facebook\FBExpect\expect;

final class GivenASpreadOfSpecialAttributeToATagWithoutDeclaredAttributesTest
  extends HackTest {
  const type SpreadTarget = tag\empty;
  const type Source = tag\empty;

  protected static function target(
    this::Source $src,
  )[defaults]: this::SpreadTarget {
    return <tag:empty {...$src} />;
  }

  protected static function source()[defaults]: this::Source {
    return <tag:empty data-special="special" aria-role="test" />;
  }

  public async function test_attributes_are_spread(
  )[defaults]: Awaitable<void> {
    $type_under_test = static::target(static::source());
    expect(get_attributes($type_under_test))->toEqual(
      tuple(dict[], dict['data-special' => 'special', 'aria-role' => 'test']),
    );
  }
}
