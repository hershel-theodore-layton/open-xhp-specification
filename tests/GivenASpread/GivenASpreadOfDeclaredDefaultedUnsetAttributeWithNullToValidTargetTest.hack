namespace HTL\OpenXHPSpecification;

use type Facebook\HackTest\HackTest;
use function Facebook\FBExpect\expect;

final class
  GivenASpreadOfDeclaredDefaultedUnsetAttributeWithNullToValidTargetTest
  extends HackTest {
  const type SpreadTarget = tag\herp_and_derp;
  const type Source = tag\herp_defaulted_with_null;

  protected static function target(this::Source $src): this::SpreadTarget {
    return <tag:herp_and_derp herp="not-null" {...$src} />;
  }

  protected static function source(): this::Source {
    return <tag:herp_defaulted_with_null />;
  }

  public async function test_the_null_value_is_not_copied_in_the_spread(
  ): Awaitable<void> {
    $type_under_test = static::target(static::source());
    expect(get_attributes($type_under_test))->toEqual(
      tuple(dict['herp' => 'not-null'], dict[]),
    );
  }
}
