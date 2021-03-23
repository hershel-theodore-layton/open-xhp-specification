namespace HTL\OpenXHPSpecification;

use type Facebook\HackTest\HackTest;
use function Facebook\FBExpect\expect;

final class
  GivenASpreadOfSpecialUntypedSetAttributeToATagWithTheSameAttributeButWithATypeTest
  extends HackTest {
  const type SpreadTarget = tag\data_special_typed;
  const type Source = tag\empty;

  protected static function target(this::Source $src): this::SpreadTarget {
    return <tag:data_special_typed {...$src} />;
  }

  protected static function source(): this::Source {
    return <tag:empty data-special={42} />;
  }

  public async function test_the_explicitly_set_value_is_spread_even_though_this_might_set_a_value_of_a_different_type(
  ): Awaitable<void> {
    $type_under_test = static::target(static::source());
    expect(get_attributes($type_under_test))->toEqual(
      tuple(dict[], dict['data-special' => 42]),
    );

    $error_level = \error_reporting(0);
    try {
      // Passing an int to a function which expects a ?string.
      // Both sgml-stream and xhp-lib fail to ensure type safety here.
      static::takesNullableString($type_under_test->:data-special);
    } finally {
      \error_reporting($error_level);
    }
  }

  private static function takesNullableString(
    <<__Soft>> ?string $string_or_null,
  ): void {
    expect($string_or_null)->toBeType('int');
  }
}
