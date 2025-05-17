/** open-xhp-specification is MIT licensed, see /LICENSE. */
namespace HTL\OpenXHPSpecification;

use type Facebook\HackTest\HackTest;
use function HTL\Expect\{expect, expect_invoked};

final class GivenAnXHPObjectWithDeclaredLateInitAttributesNotSetTest
  extends HackTest {
  const type TypeUnderTest = tag\herp_lateinit;

  use TestExtensions;

  protected static function typeUnderTest()[defaults]: this::TypeUnderTest {
    return <tag:herp_lateinit />;
  }

  public function test_access_throws_on_xhp_lib()[defaults]: void {
    static::skipIfSGMLStream('sgml-stream does not support lateinit');
    $type_under_test = static::typeUnderTest();
    expect_invoked(() ==> $type_under_test->:herp)->toHaveThrown<
      \Facebook\XHP\AttributeRequiredException,
    >();
  }

  public function test_access_yields_null_on_sgml_stream()[defaults]: void {
    static::skipIfXHPLib(null);
    $type_under_test = static::typeUnderTest();
    expect($type_under_test->:herp)->toBeNull();
    // 'This is actually pretty bad, since this is not type safe. '.
    // 'sgml-stream does not expose a way to set attributes after construction either. '.
    // 'So lateinit could never be valid.',
  }

  public async function test_renders_an_empty_element(
  )[defaults]: Awaitable<void> {
    $type_under_test = static::typeUnderTest();
    expect(await to_string_async($type_under_test))->toEqual(
      '<herp_lateinit></herp_lateinit>',
    );
  }
}
