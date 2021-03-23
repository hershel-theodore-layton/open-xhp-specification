namespace HTL\OpenXHPSpecification;

use type Facebook\HackTest\HackTest;
use function Facebook\FBExpect\expect;

final class GivenASpreadOfSpecialDefaultedSetAttributeToValidTargetTest
  extends HackTest {
  const type SpreadTarget = tag\empty;
  const type Source = tag\data_special_defaulted;

  protected static function target(this::Source $src): this::SpreadTarget {
    return <tag:empty {...$src} />;
  }

  protected static function source(): this::Source {
    return <tag:data_special_defaulted data-special="not-default" />;
  }

  public async function test_the_explicitly_set_value_is_spread(
  ): Awaitable<void> {
    $type_under_test = static::target(static::source());
    expect(get_attributes($type_under_test))->toEqual(
      tuple(dict[], dict['data-special' => 'not-default']),
    );
  }
}
