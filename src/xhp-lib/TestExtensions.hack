namespace HTL\OpenXHPSpecification;

trait TestExtensions {
  require extends \Facebook\HackTest\HackTest;

  public static function skipIfSGMLStream(?string $_why): void {}

  public static function skipIfXHPLib(?string $why): nothing {
    self::markTestSkipped($why ?? 'See previous test');
  }
}
