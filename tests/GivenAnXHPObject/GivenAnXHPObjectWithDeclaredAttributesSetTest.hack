/** open-xhp-specification is MIT licensed, see /LICENSE. */
namespace HTL\OpenXHPSpecification;

use type Facebook\HackTest\HackTest;
use function HTL\Expect\expect;

final class GivenAnXHPObjectWithDeclaredAttributesSetTest extends HackTest {
  const type TypeUnderTest = tag\herp_and_derp;

  protected static function typeUnderTest()[defaults]: this::TypeUnderTest {
    return <tag:herp_and_derp herp="h" derp={5.5} />;
  }

  protected static function typeUnderTestInverseAttributeOrder(
  )[defaults]: this::TypeUnderTest {
    return <tag:herp_and_derp derp={5.5} herp="h" />;
  }

  public function test_access_yields_value()[defaults]: void {
    $type_under_test = static::typeUnderTest();
    expect($type_under_test->:herp)->toEqual('h');
    expect($type_under_test->:derp)->toEqual(5.5);
  }

  public async function test_renders_all_explicitly_set_attributes(
  )[defaults]: Awaitable<void> {
    $type_under_test = static::typeUnderTest();
    expect(await to_string_async($type_under_test))->toEqual(
      '<herp_and_derp herp="h" derp="5.5"></herp_and_derp>',
    );
  }

  public async function test_renders_all_explicitly_set_attributes_in_the_order_of_the_open_tag(
  )[defaults]: Awaitable<void> {
    $type_under_test = static::typeUnderTestInverseAttributeOrder();
    expect(await to_string_async($type_under_test))->toEqual(
      '<herp_and_derp derp="5.5" herp="h"></herp_and_derp>',
    );
  }
}
