/** open-xhp-specification is MIT licensed, see /LICENSE. */
namespace HTL\OpenXHPSpecification;

use type Facebook\HackTest\HackTest;
use function HTL\Expect\expect;

final class GivenAnXHPObjectWithSpecialDefaultedAttributesNotSetTest
  extends HackTest {
  const type TypeUnderTest = tag\data_special_defaulted;

  use TestExtensions;

  protected static function typeUnderTest()[defaults]: this::TypeUnderTest {
    return <tag:data_special_defaulted />;
  }

  public function test_access_yields_default_value_on_sgml_stream(
  )[defaults]: void {
    static::skipIfXHPLib(
      'xhp-lib does not implement default values for special attributes',
    );
    $type_under_test = static::typeUnderTest();
    expect($type_under_test->:data-special)->toEqual('default');
  }

  public function test_access_yields_null_instead_of_default_value_on_xhp_lib(
  )[defaults]: void {
    static::skipIfSGMLStream(null);
    $type_under_test = static::typeUnderTest();
    expect($type_under_test->:data-special)->toBeNull();
  }

  public async function test_renders_an_empty_element_on_xhp_lib(
  )[defaults]: Awaitable<void> {
    static::skipIfSGMLStream('sgml-stream renders defaults too');
    $type_under_test = static::typeUnderTest();
    expect(await to_string_async($type_under_test))->toEqual(
      '<data_special_defaulted></data_special_defaulted>',
    );
  }

  public async function test_renders_an_element_with_the_default_values_on_sgml_stream(
  )[defaults]: Awaitable<void> {
    static::skipIfXHPLib(null);
    $type_under_test = static::typeUnderTest();
    expect(await to_string_async($type_under_test))->toEqual(
      '<data_special_defaulted data-special="default"></data_special_defaulted>',
    );
  }
}
