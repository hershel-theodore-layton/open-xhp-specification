namespace HTL\OpenXHPSpecification;

use namespace HH\Lib\{Dict, Str};

function get_attributes(
  \Facebook\XHP\Core\node $node,
): (dict<string, mixed>, dict<string, mixed>) {
  $attributes = $node->getAttributes();
  return Dict\partition_with_key(
    $attributes,
    ($name, $_) ==>
      !Str\starts_with($name, 'data-') && !Str\starts_with($name, 'aria-'),
  );
}
