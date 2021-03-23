namespace HTL\OpenXHPSpecification;

use type Facebook\HackTest\HackTest;
use function Facebook\FBExpect\expect;

final class GivenASpreadOfDeclaredDefaultedUnsetAttributeToValidTargetTest
  extends HackTest {
  const type SpreadTarget = tag\herp_and_derp;
  const type Source = tag\herp_defaulted;

  protected static function target(this::Source $src): this::SpreadTarget {
    return <tag:herp_and_derp {...$src} />;
  }

  protected static function source(): this::Source {
    return <tag:herp_defaulted />;
  }

  public async function test_the_default_value_is_spread(): Awaitable<void> {
    $type_under_test = static::target(static::source());
    expect(get_attributes($type_under_test))->toEqual(
      tuple(dict['herp' => 'default'], dict[]),
    );
  }
}
