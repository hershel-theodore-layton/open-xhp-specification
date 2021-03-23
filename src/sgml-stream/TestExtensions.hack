namespace HTL\OpenXHPSpecification;

trait TestExtensions {
  require extends \Facebook\HackTest\HackTest;

  public static function skipIfSGMLStream(?string $why): nothing {
    self::markTestSkipped($why ?? 'See previous test');
  }
  public static function skipIfXHPLib(?string $_why): void {}
}
