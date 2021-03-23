namespace HTL\OpenXHPSpecification;

use type Facebook\HackTest\HackTest;
use function Facebook\FBExpect\expect;

final class GivenAnXHPObjectWithDeclaredRequiredAttributesSetTest
  extends HackTest {
  const type TypeUnderTest = tag\herp_required;

  protected static function typeUnderTest(): this::TypeUnderTest {
    return <tag:herp_required herp="required" />;
  }

  public function test_access_yields_value(): void {
    $type_under_test = static::typeUnderTest();
    expect($type_under_test->:herp)->toEqual('required');
  }

  public async function test_renders_all_explicitly_set_attributes(
  ): Awaitable<void> {
    $type_under_test = static::typeUnderTest();
    expect(await to_string_async($type_under_test))->toEqual(
      '<herp_required herp="required"></herp_required>',
    );
  }
}
