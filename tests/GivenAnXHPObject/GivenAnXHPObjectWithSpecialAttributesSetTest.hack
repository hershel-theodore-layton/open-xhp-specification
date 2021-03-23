namespace HTL\OpenXHPSpecification;

use type Facebook\HackTest\HackTest;
use function Facebook\FBExpect\expect;

final class GivenAnXHPObjectWithSpecialAttributesSetTest extends HackTest {
  const type TypeUnderTest = tag\empty;

  use TestExtensions;

  protected static function typeUnderTest(): this::TypeUnderTest {
    return <tag:empty aria-special="as" data-special="ds" />;
  }

  public function test_access_yields_value(): void {
    $type_under_test = static::typeUnderTest();
    expect($type_under_test->:aria-special)->toEqual('as');
    expect($type_under_test->:data-special)->toEqual('ds');
  }

  public async function test_setting_a_non_arraykey_value_on_a_special_attribute_is_allowed_on_xhp_lib(
  ): Awaitable<void> {
    static::skipIfSGMLStream(
      'sgml-stream does not accept non arraykey values on special attributes',
    );
    $type_under_test = <tag:empty data-special={1.1} />;
    expect(await to_string_async($type_under_test))->toEqual(
      '<empty data-special="1.1">'.'</empty>',
    );
  }

  public function test_setting_a_non_arraykey_value_on_a_special_attribute_throws_on_sgml_stream(
  ): void {
    static::skipIfXHPLib(null);
    expect(() ==> <tag:empty data-special={1.1} />)->toThrow(
      \HH\InvariantException::class,
    );
  }

  public async function test_renders_all_explicitly_set_attributes(
  ): Awaitable<void> {
    $type_under_test = static::typeUnderTest();
    expect(await to_string_async($type_under_test))->toEqual(
      '<empty aria-special="as" data-special="ds">'.'</empty>',
    );
  }
}
