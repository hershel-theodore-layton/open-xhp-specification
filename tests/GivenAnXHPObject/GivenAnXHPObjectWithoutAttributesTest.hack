namespace HTL\OpenXHPSpecification;

use type Facebook\HackTest\HackTest;
use function Facebook\FBExpect\expect;

final class GivenAnXHPObjectWithoutAttributesTest extends HackTest {
  const type TypeUnderTest = tag\empty;

  protected static function typeUnderTest(): this::TypeUnderTest {
    return <tag:empty />;
  }

  public function test_access_yields_null(): void {
    $type_under_test = static::typeUnderTest();
    expect($type_under_test->:aria-prop)->toBeNull();
    expect($type_under_test->:data-prop)->toBeNull();
  }

  public async function test_renders_an_empty_element(): Awaitable<void> {
    $type_under_test = static::typeUnderTest();
    expect(await to_string_async($type_under_test))->toEqual('<empty></empty>');
  }
}
