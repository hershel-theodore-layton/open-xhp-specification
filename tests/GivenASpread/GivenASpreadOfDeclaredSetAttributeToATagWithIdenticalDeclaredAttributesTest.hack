/** open-xhp-specification is MIT licensed, see /LICENSE. */
namespace HTL\OpenXHPSpecification;

use type Facebook\HackTest\HackTest;
use function Facebook\FBExpect\expect;

final class
  GivenASpreadOfDeclaredSetAttributeToATagWithIdenticalDeclaredAttributesTest
  extends HackTest {
  const type SpreadTarget = tag\herp_and_derp;
  const type Source = tag\herp_and_derp;

  protected static function target(this::Source $src): this::SpreadTarget {
    return <tag:herp_and_derp {...$src} />;
  }

  protected static function source(): this::Source {
    return <tag:herp_and_derp herp="h" derp={5.5} />;
  }

  public async function test_attributes_are_spread(): Awaitable<void> {
    $type_under_test = static::target(static::source());
    expect(get_attributes($type_under_test))->toEqual(
      tuple(dict['herp' => 'h', 'derp' => 5.5], dict[]),
    );
  }
}
