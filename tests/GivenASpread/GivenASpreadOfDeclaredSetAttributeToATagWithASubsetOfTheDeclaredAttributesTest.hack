/** open-xhp-specification is MIT licensed, see /LICENSE. */
namespace HTL\OpenXHPSpecification;

use type Facebook\HackTest\HackTest;
use function HTL\Expect\expect;

final class GivenASpreadOfDeclaredSetAttributeToATagWithASubsetOfTheDeclaredAttributesTest
  extends HackTest {
  const type SpreadTarget = tag\herp_and_derp;
  const type Source = tag\herp_and_durr;

  protected static function target(
    this::Source $src,
  )[defaults]: this::SpreadTarget {
    return <tag:herp_and_derp {...$src} />;
  }

  protected static function source()[defaults]: this::Source {
    return <tag:herp_and_durr herp="h" durr={5.5} />;
  }

  public async function test_only_the_common_attributes_are_spread(
  )[defaults]: Awaitable<void> {
    $type_under_test = static::target(static::source());
    expect(get_attributes($type_under_test))->toEqual(
      tuple(dict['herp' => 'h'], dict[]),
    );
  }
}
