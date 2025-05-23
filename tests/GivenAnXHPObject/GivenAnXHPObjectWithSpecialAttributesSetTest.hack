/** open-xhp-specification is MIT licensed, see /LICENSE. */
namespace HTL\OpenXHPSpecification;

use type Facebook\HackTest\HackTest;
use function HTL\Expect\{expect, expect_invoked};

final class GivenAnXHPObjectWithSpecialAttributesSetTest extends HackTest {
  const type TypeUnderTest = tag\empty;

  use TestExtensions;

  protected static function typeUnderTest()[defaults]: this::TypeUnderTest {
    return <tag:empty aria-special="as" data-special="ds" />;
  }

  public function test_access_yields_value()[defaults]: void {
    $type_under_test = static::typeUnderTest();
    expect($type_under_test->:aria-special)->toEqual('as');
    expect($type_under_test->:data-special)->toEqual('ds');
  }

  public async function test_setting_a_non_arraykey_value_on_a_special_attribute_is_allowed_on_xhp_lib(
  )[defaults]: Awaitable<void> {
    static::skipIfSGMLStream(
      'sgml-stream does not accept non arraykey values on special attributes',
    );
    $type_under_test = <tag:empty data-special={1.1} />;
    expect(await to_string_async($type_under_test))->toEqual(
      '<empty data-special="1.1">'.'</empty>',
    );
  }

  public function test_setting_a_non_arraykey_value_on_a_special_attribute_throws_on_sgml_stream(
  )[defaults]: void {
    static::skipIfXHPLib(null);
    expect_invoked(() ==> <tag:empty data-special={1.1} />)->toHaveThrown<
      InvariantException,
    >();
  }

  public async function test_renders_all_explicitly_set_attributes(
  )[defaults]: Awaitable<void> {
    $type_under_test = static::typeUnderTest();
    expect(await to_string_async($type_under_test))->toEqual(
      '<empty aria-special="as" data-special="ds">'.'</empty>',
    );
  }
}
