/** open-xhp-specification is MIT licensed, see /LICENSE. */
namespace HTL\OpenXHPSpecification;

<<__EntryPoint>>
function main(): void {
  require_once __DIR__.'/vendor/autoload.hack';
  \Facebook\AutoloadMap\initialize();
  // This constant is defined twice. Once for each library.
  $l = LIBRARY_UNDER_TEST;
  $v = null;

  $packages = \file_get_contents(__DIR__.'/composer.dev.lock')
    |> \json_decode($$, true)['packages-dev'];
  foreach ($packages as $p) {
    if ($p['name'] === $l) {
      $v = \trim($p['version'], 'v').'-'.$p['source']['reference'];
      break;
    }
  }

  $v ??= "<unknown>";

  echo "======\n".$l.'@'.$v.' on hhvm '.\HHVM_VERSION."\n======\n";
}
