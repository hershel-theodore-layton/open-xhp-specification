/** open-xhp-specification is MIT licensed, see /LICENSE. */
namespace HTL\OpenXHPSpecification;

use type Facebook\HackTest\HackTest;
use function HTL\Expect\expect;

final class GivenAnXHPObjectWithDeclaredAttributesNotSetTest extends HackTest {
  const type TypeUnderTest = tag\herp_and_derp;

  protected static function typeUnderTest()[defaults]: this::TypeUnderTest {
    return <tag:herp_and_derp />;
  }

  public function test_access_yields_null()[defaults]: void {
    $type_under_test = static::typeUnderTest();
    expect($type_under_test->:herp)->toBeNull();
    expect($type_under_test->:derp)->toBeNull();
  }

  public async function test_renders_an_empty_element(
  )[defaults]: Awaitable<void> {
    $type_under_test = static::typeUnderTest();
    expect(await to_string_async($type_under_test))->toEqual(
      '<herp_and_derp></herp_and_derp>',
    );
  }
}
