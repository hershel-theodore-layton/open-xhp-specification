/** open-xhp-specification is MIT licensed, see /LICENSE. */
namespace HTL\OpenXHPSpecification;

trait TestExtensions {
  require extends \Facebook\HackTest\HackTest;

  public static function skipIfSGMLStream(?string $why)[defaults]: nothing {
    self::markTestSkipped($why ?? 'See previous test');
  }
  public static function skipIfXHPLib(?string $_why)[defaults]: void {}
}
