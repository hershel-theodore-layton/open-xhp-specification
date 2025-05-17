/** open-xhp-specification is MIT licensed, see /LICENSE. */
namespace HTL\OpenXHPSpecification;

use type Facebook\HackTest\HackTest;
use function HTL\Expect\expect;

final class GivenASpreadOfDeclaredSetAttributeToATagWithoutDeclaredAttributesTest
  extends HackTest {
  const type SpreadTarget = tag\empty;
  const type Source = tag\herp_and_derp;

  protected static function target(
    this::Source $src,
  )[defaults]: this::SpreadTarget {
    return <tag:empty {...$src} />;
  }

  protected static function source()[defaults]: this::Source {
    return <tag:herp_and_derp herp="h" derp={5.5} />;
  }

  public async function test_attributes_are_not_spread(
  )[defaults]: Awaitable<void> {
    $type_under_test = static::target(static::source());
    expect(get_attributes($type_under_test))->toEqual(tuple(dict[], dict[]));
  }
}
