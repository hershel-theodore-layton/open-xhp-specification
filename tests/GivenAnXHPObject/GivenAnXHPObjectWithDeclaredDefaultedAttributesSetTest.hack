/** open-xhp-specification is MIT licensed, see /LICENSE. */
namespace HTL\OpenXHPSpecification;

use type Facebook\HackTest\HackTest;
use function Facebook\FBExpect\expect;

final class GivenAnXHPObjectWithDeclaredDefaultedAttributesSetTest
  extends HackTest {
  const type TypeUnderTest = tag\herp_defaulted;

  protected static function typeUnderTest()[defaults]: this::TypeUnderTest {
    return <tag:herp_defaulted herp="not-default" />;
  }

  public function test_access_yields_explicitly_set_value()[defaults]: void {
    $type_under_test = static::typeUnderTest();
    expect($type_under_test->:herp)->toEqual('not-default');
  }

  public async function test_renders_all_explicitly_set_attributes(
  )[defaults]: Awaitable<void> {
    $type_under_test = static::typeUnderTest();
    expect(await to_string_async($type_under_test))->toEqual(
      '<herp_defaulted herp="not-default">'.'</herp_defaulted>',
    );
  }
}
