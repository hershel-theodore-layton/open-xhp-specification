/** open-xhp-specification is MIT licensed, see /LICENSE. */
namespace HTL\OpenXHPSpecification;

use type Facebook\HackTest\HackTest;
use function Facebook\FBExpect\expect;

final class GivenAnXHPObjectWithSpecialRequiredAttributesSetTest
  extends HackTest {
  const type TypeUnderTest = tag\data_special_required;

  protected static function typeUnderTest(): this::TypeUnderTest {
    return <tag:data_special_required data-special="required" />;
  }

  public function test_access_yields_value(): void {
    $type_under_test = static::typeUnderTest();
    expect($type_under_test->:data-special)->toEqual('required');
  }

  public async function test_renders_all_explicitly_set_attributes(
  ): Awaitable<void> {
    $type_under_test = static::typeUnderTest();
    expect(await to_string_async($type_under_test))->toEqual(
      '<data_special_required data-special="required">'.
      '</data_special_required>',
    );
  }
}
