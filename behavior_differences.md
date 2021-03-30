## Differences
|Given|then|
|--:|:--|
| An xhp object with a boolean attribute (1) | renders false as an attribute with the value of an empty string **on sgml stream** |
| An xhp object with a boolean attribute (1) | renders false by not including the attribute **on xhp lib** |
| An xhp object with declared defaulted attributes not set (2) | renders an element with the default values **on sgml stream** |
| An xhp object with declared defaulted attributes not set (2) | renders an empty element **on xhp lib** |
| An xhp object with special defaulted attributes not set (2) | renders an element with the default values **on sgml stream** |
| An xhp object with special defaulted attributes not set (2) | renders an empty element **on xhp lib** |
| An xhp object with special attributes set (3) | setting a non arraykey value on a special attribute throws **on sgml stream** |
| An xhp object with special attributes set (3) | setting a non arraykey value on a special attribute is allowed **on xhp lib** |
| An xhp object with special defaulted attributes not set (4) | access yields default value **on sgml stream** |
| An xhp object with special defaulted attributes not set (4) | access yields null instead of default value **on xhp lib** |
| An xhp object with declared late init attributes not set (5) | access yields null **on sgml stream** |
| An xhp object with declared late init attributes not set (5) | access throws **on xhp lib** |
| An xhp object with declared required attributes not set (5) | access yields null **on sgml stream** |
| An xhp object with declared required attributes not set (5) | access throws **on xhp lib** |
| An xhp object with declared attributes and special attributes set (6) | renders attributes in order of xhp open tag provided no value is defaulted but places data and aria last **on sgml stream** |
| An xhp object with declared attributes and special attributes set (6) | renders attributes in order of xhp open tag but default values which are not set go first **on sgml stream** |
| An xhp object with declared attributes and special attributes set (6) | renders attributes in order of xhp open **on xhp lib** |


### Differences explained

1. The default built-in `render_opening_tag()` does not treat `false` as a signal value. You can use your own or filter out `false` before passing the attributes to `render_opening_tag()` to get the xhp-lib behavior back.
2. RootElement does not treat a default value differently from an explicit value. This means that sgml-stream can't match xhp-lib's behavior. This difference affects primitives on xhp-lib and Elements which render to a string (instead of composing a Streamable). This behavior difference is not a bug. We found it strange that `xhp class x { attribute string herp = "def" }` renders as `<x></x>`, instead of `<x herp="def"></x>`. You are not able to use the xhp-lib behavior when using sgml-stream.
3. RootElement enforces that all `data-` and `aria-` attributes are `?arraykey` at runtime. Declaring a `data-` or `aria-` attribute with a different type is allowed, but useless, since the xhp open will fail when a non `?arraykey` value is passed or a non `?arraykey` default is declared. This decision was made for two reasons. Accessing `$xhp->:data-not-declared` yielded mixed, and we wanted a safe `as ?arraykey` cast to be possible. The second reason was that we didn't want developers using `data-` and `aria-` as expandos on our Elements. If you want to attach an object type to your xhp classes, declare them as a normal attribute. If you want untyped expandos, declare the following attribute `attribute dict<string, mixed> expandos = dict[]`.
4. RootElement does not treat a default value differently from an explicit value. This means that declaring `attribute string data-special = "def"` makes `$xhp->:data-special` yield `def` when no explicit value is supplied. We actually consider xhp-lib to be the buggy one here, since the default value can never be observed. You are not able to use the xhp-lib behavior when using sgml-stream.
5. When using sgml-stream, you **MUST** enable the .hhconfig setting `check_xhp_attribute`. This makes it so that you are not able to forget `@required` attributes in your xhp open. Sgml-stream uses this knowledge of this typechecker setting to not validate `@required` at runtime. Sgml-stream does not support setting new attributes after xhp open completes. This means that `@lateinit` attributes which were missing from the xhp open can never be set. For this reason `@lateinit` is **NOT SUPPORTED** by sgml-stream. If you do not need to observe the difference between `no value` and `explicit null`, you can remove `@lateinit` and add `as nonnull` at the use sites. This throws when xhp-lib would have thrown. If you need to observe the difference, sgml-stream can not help you. Sgml-stream does not treat `<x herp={null} />` differently from `<x />` if there is no default value (which there isn't in case of `@lateinit`). So we are unable to behave differently depending on this xhp open used.
6. The order of the attributes as they appear in the rendered sgml in xhp-lib depends only on the order of attributes in the xhp open. Sgml-stream renders attributes in a different order because of how the attributes are stored internally. This should not be cause for concern, but may require you to update some unit test which depended on xhp-lib's attribute order.

## Identical attribute behavior
|Given|then|
|--:|:--|
| A spread of declared defaulted set attribute to valid target | the explicitly set value is spread |
| A spread of declared defaulted unset attribute to valid target | the default value is spread |
| A spread of declared defaulted unset attribute with null to valid target | the null value is not copied in the spread |
| A spread of declared set attribute to a tag with a subset of the declared attributes | only the common attributes are spread |
| A spread of declared set attribute to a tag with identical declared attributes | attributes are spread |
| A spread of declared set attribute to a tag with the same attribute specified as null in the xhp open | the explicit null value is overridden by the spread |
| A spread of declared set attribute to a tag with the same attribute specified as null in the xhp open | the explicit null value passed after the spread overrides the value from the spread |
| A spread of declared set attribute to a tag with the same attribute specified in the xhp open | the common values set before the spread are overridden |
| A spread of declared set attribute to a tag with the same attribute specified in the xhp open | the common values set after the spread override the spread |
| A spread of declared set attribute to a tag without declared attributes | attributes are not spread |
| A spread of declared set attribute with null to valid target | the null value is not copied in the spread |
| A spread of special attribute to a tag without declared attributes | attributes are spread |
| A spread of special defaulted set attribute to valid target | the explicitly set value is spread |
| A spread of special defaulted unset attribute to valid target | the default value is spread |
| A spread of special set attribute to a tag with the same attribute specified in the xhp open | the common values set before the spread are overridden |
| A spread of special set attribute to a tag with the same attribute specified in the xhp open | the common values set after the spread override the spread |
| A spread of special untyped set attribute to a tag with the same attribute but with a type | the explicitly set value is spread even though this might set a value of a different type |
| An xhp object with a boolean attribute | access yields null |
| An xhp object with declared attributes not set | access yields null |
| An xhp object with declared attributes set | access yields value |
| An xhp object with declared defaulted attributes not set | access yields default value |
| An xhp object with declared defaulted attributes set | access yields explicitly set value |
| An xhp object with declared late init attributes set | access yields value |
| An xhp object with declared required attributes set | access yields value |
| An xhp object with special attributes set | access yields value |
| An xhp object with special defaulted attributes set | access yields explicitly set value |
| An xhp object with special required attributes not set | access yields null |
| An xhp object with special required attributes set | access yields value |
| An xhp object without attributes | access yields null |

## Identical render behavior
|Given|then|
|--:|:--|
| An xhp object with a boolean attribute | renders true as a valueless attribute |
| An xhp object with declared attributes and special attributes set | renders all explicitly set attributes |
| An xhp object with declared attributes not set | renders an empty element |
| An xhp object with declared attributes set | renders all explicitly set attributes in the order of the open tag |
| An xhp object with declared attributes set | renders all explicitly set attributes |
| An xhp object with declared defaulted attributes set | renders all explicitly set attributes |
| An xhp object with declared late init attributes not set | renders an empty element |
| An xhp object with declared late init attributes set | renders all explicitly set attributes |
| An xhp object with declared required attributes not set | renders an empty element |
| An xhp object with declared required attributes set | renders all explicitly set attributes |
| An xhp object with special attributes set | renders all explicitly set attributes |
| An xhp object with special defaulted attributes set | renders all explicitly set attributes |
| An xhp object with special required attributes not set | renders an empty element |
| An xhp object with special required attributes set | renders all explicitly set attributes |
| An xhp object without attributes | renders an empty element |

## Identical children behavior
|Given|then|
|--:|:--|
| Given children as arrays | the arrays are unpacked in order |
| Given children as elements | the elements are saved |
| Given children as frags | the frags are unpacked in order |
| Given children as numbers | the numbers are not cast to a string |
| Given children as strings | the strings are not yet escaped |
| Given children with a bit of everything | the frags and arrays are unpacked in order |
| Given children with nulls | the nulls are ignored |