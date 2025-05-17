/** open-xhp-specification is MIT licensed, see /LICENSE. */
namespace HTL\OpenXHPSpecification;

use type Facebook\HackTest\HackTest;
use function HTL\Expect\{expect, expect_invoked};

final class GivenAnXHPObjectWithDeclaredRequiredAttributesNotSetTest
  extends HackTest {
  const type TypeUnderTest = tag\herp_required;

  use TestExtensions;

  protected static function typeUnderTest()[defaults]: this::TypeUnderTest {
    /* HH_FIXME[4314] Missing the required herp attribute */
    return <tag:herp_required />;
  }

  public function test_access_throws_on_xhp_lib()[defaults]: void {
    static::skipIfSGMLStream(
      'sgml-stream does not expect you to violate required',
    );
    $type_under_test = static::typeUnderTest();
    expect_invoked(() ==> $type_under_test->:herp)->toHaveThrown<
      \Facebook\XHP\AttributeRequiredException,
    >();
  }

  public function test_access_yields_null_on_sgml_stream()[defaults]: void {
    static::skipIfXHPLib(null);
    $type_under_test = static::typeUnderTest();
    expect($type_under_test->:herp)->toBeNull();
  }

  public async function test_renders_an_empty_element(
  )[defaults]: Awaitable<void> {
    $type_under_test = static::typeUnderTest();
    expect(await to_string_async($type_under_test))->toEqual(
      '<herp_required></herp_required>',
    );
  }
}
