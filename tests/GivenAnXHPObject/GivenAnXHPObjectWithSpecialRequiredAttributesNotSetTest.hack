/** open-xhp-specification is MIT licensed, see /LICENSE. */
namespace HTL\OpenXHPSpecification;

use type Facebook\HackTest\HackTest;
use function HTL\Expect\expect;

final class GivenAnXHPObjectWithSpecialRequiredAttributesNotSetTest
  extends HackTest {
  const type TypeUnderTest = tag\data_special_required;

  protected static function typeUnderTest()[defaults]: this::TypeUnderTest {
    /* HH_FIXME[4314] Missing the required data-special attribute */
    return <tag:data_special_required />;
  }

  public function test_access_yields_null()[defaults]: void {
    $type_under_test = static::typeUnderTest();
    // sgml-stream does not expect you to violate required, so no harm so far.
    // xhp-lib does support running without check_xhp_attribute, which would
    // make this a legitimate type error, since the typechecker expected string.
    expect($type_under_test->:data-special)->toBeNull();
  }

  public async function test_renders_an_empty_element(
  )[defaults]: Awaitable<void> {
    $type_under_test = static::typeUnderTest();
    expect(await to_string_async($type_under_test))->toEqual(
      '<data_special_required>'.'</data_special_required>',
    );
  }
}
