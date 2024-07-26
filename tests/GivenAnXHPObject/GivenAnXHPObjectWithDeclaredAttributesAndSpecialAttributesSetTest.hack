/** open-xhp-specification is MIT licensed, see /LICENSE. */
namespace HTL\OpenXHPSpecification;

use type Facebook\HackTest\HackTest;
use function Facebook\FBExpect\expect;

final class GivenAnXHPObjectWithDeclaredAttributesAndSpecialAttributesSetTest
  extends HackTest {
  const type TypeUnderTest = tag\herp_and_derp;

  use TestExtensions;

  protected static function typeUnderTestSpecialLast(
  )[defaults]: this::TypeUnderTest {
    return
      <tag:herp_and_derp
        herp="h"
        derp={5.5}
        data-special="special"
        aria-role="test"
        data-more-special="more"
      />;
  }

  protected static function typeUnderTestSpecialNotLast(
  )[defaults]: this::TypeUnderTest {
    return
      <tag:herp_and_derp
        herp="h"
        data-special="special"
        aria-role="test"
        data-more-special="more"
        derp={5.5}
      />;
  }

  protected static function defaultedDerp(
  )[defaults]: tag\herp_without_default_and_derp_defaulted {
    return <tag:herp_without_default_and_derp_defaulted herp="explicit" />;
  }

  public async function test_renders_all_explicitly_set_attributes(
  )[defaults]: Awaitable<void> {
    $type_under_test = static::typeUnderTestSpecialLast();
    expect(await to_string_async($type_under_test))->toEqual(
      '<herp_and_derp herp="h" derp="5.5" data-special="special" aria-role="test" data-more-special="more">'.
      '</herp_and_derp>',
    );
  }

  public async function test_renders_attributes_in_order_of_xhp_open_on_xhp_lib(
  )[defaults]: Awaitable<void> {
    static::skipIfSGMLStream(
      'sgml-stream renders data- and aria- attributes last',
    );
    $type_under_test = static::typeUnderTestSpecialNotLast();
    expect(await to_string_async($type_under_test))->toEqual(
      '<herp_and_derp herp="h" data-special="special" aria-role="test" data-more-special="more" derp="5.5">'.
      '</herp_and_derp>',
    );
  }

  public async function test_renders_attributes_in_order_of_xhp_open_tag_provided_no_value_is_defaulted_but_places_data_and_aria_last_on_sgml_stream(
  )[defaults]: Awaitable<void> {
    static::skipIfXHPLib(null);
    $type_under_test = static::typeUnderTestSpecialNotLast();
    expect(await to_string_async($type_under_test))->toEqual(
      '<herp_and_derp herp="h" derp="5.5" data-special="special" aria-role="test" data-more-special="more">'.
      '</herp_and_derp>',
    );
  }

  public async function test_renders_attributes_in_order_of_xhp_open_tag_but_default_values_which_are_not_set_go_first_on_sgml_stream(
  )[defaults]: Awaitable<void> {
    static::skipIfXHPLib(null);
    $type_under_test = static::defaultedDerp();
    expect(await to_string_async($type_under_test))->toEqual(
      '<herp_without_default_and_derp_defaulted derp="default" herp="explicit">'.
      '</herp_without_default_and_derp_defaulted>',
    );
  }
}
