namespace HTL\OpenXHPSpecification;

use type Facebook\HackTest\HackTest;
use function Facebook\FBExpect\expect;

final class GivenAnXHPObjectWithDeclaredLateInitAttributesNotSetTest
  extends HackTest {
  const type TypeUnderTest = tag\herp_lateinit;

  use TestExtensions;

  protected static function typeUnderTest(): this::TypeUnderTest {
    return <tag:herp_lateinit />;
  }

  public function test_access_throws_on_xhp_lib(): void {
    static::skipIfSGMLStream('sgml-stream does not support lateinit');
    $type_under_test = static::typeUnderTest();
    expect(() ==> $type_under_test->:herp)->toThrow(
      \Facebook\XHP\AttributeRequiredException::class,
    );
  }

  public function test_access_yields_null_on_sgml_stream(): void {
    static::skipIfXHPLib(null);
    $type_under_test = static::typeUnderTest();
    expect($type_under_test->:herp)->toBeNull(
      'This is actually pretty bad, since this is not type safe. '.
      'sgml-stream does not expose a way to set attributes after construction either. '.
      'So lateinit could never be valid.',
    );
  }

  public async function test_renders_an_empty_element(): Awaitable<void> {
    $type_under_test = static::typeUnderTest();
    expect(await to_string_async($type_under_test))->toEqual(
      '<herp_lateinit></herp_lateinit>',
    );
  }
}
