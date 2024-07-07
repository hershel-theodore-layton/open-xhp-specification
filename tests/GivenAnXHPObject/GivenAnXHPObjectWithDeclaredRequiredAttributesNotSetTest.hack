/** open-xhp-specification is MIT licensed, see /LICENSE. */
namespace HTL\OpenXHPSpecification;

use type Facebook\HackTest\HackTest;
use function Facebook\FBExpect\expect;

final class GivenAnXHPObjectWithDeclaredRequiredAttributesNotSetTest
  extends HackTest {
  const type TypeUnderTest = tag\herp_required;

  use TestExtensions;

  protected static function typeUnderTest(): this::TypeUnderTest {
    /* HH_FIXME[4314] Missing the required herp attribute */
    return <tag:herp_required />;
  }

  public function test_access_throws_on_xhp_lib(): void {
    static::skipIfSGMLStream(
      'sgml-stream does not expect you to violate required',
    );
    $type_under_test = static::typeUnderTest();
    expect(() ==> $type_under_test->:herp)->toThrow(
      \Facebook\XHP\AttributeRequiredException::class,
    );
  }

  public function test_access_yields_null_on_sgml_stream(): void {
    static::skipIfXHPLib(null);
    $type_under_test = static::typeUnderTest();
    expect($type_under_test->:herp)->toBeNull();
  }

  public async function test_renders_an_empty_element(): Awaitable<void> {
    $type_under_test = static::typeUnderTest();
    expect(await to_string_async($type_under_test))->toEqual(
      '<herp_required></herp_required>',
    );
  }
}
