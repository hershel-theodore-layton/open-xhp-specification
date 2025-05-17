/** open-xhp-specification is MIT licensed, see /LICENSE. */
namespace HTL\OpenXHPSpecification;

use type Facebook\HackTest\HackTest;
use function HTL\Expect\expect;

final class GivenASpreadOfDeclaredDefaultedSetAttributeToValidTargetTest
  extends HackTest {
  const type SpreadTarget = tag\herp_and_derp;
  const type Source = tag\herp_defaulted;

  protected static function target(
    this::Source $src,
  )[defaults]: this::SpreadTarget {
    return <tag:herp_and_derp {...$src} />;
  }

  protected static function source()[defaults]: this::Source {
    return <tag:herp_defaulted herp="not-default" />;
  }

  public async function test_the_explicitly_set_value_is_spread(
  )[defaults]: Awaitable<void> {
    $type_under_test = static::target(static::source());
    expect(get_attributes($type_under_test))->toEqual(
      tuple(dict['herp' => 'not-default'], dict[]),
    );
  }
}
