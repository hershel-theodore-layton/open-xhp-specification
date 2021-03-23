namespace HTL\OpenXHPSpecification;

use type Facebook\HackTest\HackTest;
use function Facebook\FBExpect\expect;

final class GivenAnXHPObjectWithDeclaredDefaultedAttributesNotSetTest
  extends HackTest {
  const type TypeUnderTest = tag\herp_defaulted;

  use TestExtensions;

  protected static function typeUnderTest(): this::TypeUnderTest {
    return <tag:herp_defaulted />;
  }

  public function test_access_yields_default_value(): void {
    $type_under_test = static::typeUnderTest();
    expect($type_under_test->:herp)->toEqual('default');
  }

  public async function test_renders_an_empty_element_on_xhp_lib(
  ): Awaitable<void> {
    static::skipIfSGMLStream('sgml-stream renders defaults too');
    $type_under_test = static::typeUnderTest();
    expect(await to_string_async($type_under_test))->toEqual(
      '<herp_defaulted></herp_defaulted>',
    );
  }

  public async function test_renders_an_element_with_the_default_values_on_sgml_stream(
  ): Awaitable<void> {
    static::skipIfXHPLib(null);
    $type_under_test = static::typeUnderTest();
    expect(await to_string_async($type_under_test))->toEqual(
      '<herp_defaulted herp="default"></herp_defaulted>',
    );
  }
}
