/** open-xhp-specification is MIT licensed, see /LICENSE. */
namespace HTL\OpenXHPSpecification;

use type Facebook\HackTest\HackTest;
use function HTL\Expect\expect;

final class GivenAnXHPObjectWithABooleanAttributeTest extends HackTest {
  const type TypeUnderTest = tag\bull;

  use TestExtensions;

  protected static function typeUnderTestTrue()[defaults]: this::TypeUnderTest {
    return <tag:bull burp={true} />;
  }

  protected static function typeUnderTestFalse(
  )[defaults]: this::TypeUnderTest {
    return <tag:bull burp={false} />;
  }

  public function test_access_yields_null()[defaults]: void {
    $type_under_test = static::typeUnderTestTrue();
    expect($type_under_test->:burp)->toBeTrue();
    $type_under_test = static::typeUnderTestFalse();
    expect($type_under_test->:burp)->toBeFalse();
  }

  public async function test_renders_true_as_a_valueless_attribute(
  )[defaults]: Awaitable<void> {
    $type_under_test = static::typeUnderTestTrue();
    expect(await to_string_async($type_under_test))->toEqual(
      '<bull burp></bull>',
    );
  }

  public async function test_renders_false_by_not_including_the_attribute_on_xhp_lib(
  )[defaults]: Awaitable<void> {
    static::skipIfSGMLStream(
      'sgml-stream does not special case false, it uses BooleanAttribute',
    );
    $type_under_test = static::typeUnderTestFalse();
    expect(await to_string_async($type_under_test))->toEqual('<bull></bull>');
  }

  public async function test_renders_false_as_an_attribute_with_the_value_of_an_empty_string_on_sgml_stream(
  )[defaults]: Awaitable<void> {
    static::skipIfXHPLib(null);
    $type_under_test = static::typeUnderTestFalse();
    expect(await to_string_async($type_under_test))->toEqual(
      '<bull burp=""></bull>',
    );
  }
}
