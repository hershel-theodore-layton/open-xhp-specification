/** open-xhp-specification is MIT licensed, see /LICENSE. */
namespace HTL\OpenXHPSpecification;

use type Facebook\HackTest\HackTest;
use function Facebook\FBExpect\expect;

final class GivenASpreadOfSpecialDefaultedUnsetAttributeToValidTargetTest
  extends HackTest {
  const type SpreadTarget = tag\empty;
  const type Source = tag\data_special_defaulted;

  protected static function target(
    this::Source $src,
  )[defaults]: this::SpreadTarget {
    return <tag:empty {...$src} />;
  }

  protected static function source()[defaults]: this::Source {
    return <tag:data_special_defaulted />;
  }

  public async function test_the_default_value_is_spread(
  )[defaults]: Awaitable<void> {
    $type_under_test = static::target(static::source());
    expect(get_attributes($type_under_test))->toEqual(
      tuple(dict[], dict['data-special' => 'default']),
    );
  }
}
