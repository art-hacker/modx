<?php
class ean13{
  public $barcode;
  
  function __construct($barcode='') {
    $this->barcode = (string)$barcode;
    if(strlen($this->barcode) == 12) $this->barcode.= $this->checksum();
  }
  
  private function checksum(){
    $arr = array("","");
    foreach(str_split($this->barcode) as $k=>$v) $arr[$k%2] += $v;
    return ( 10 - ( $arr[0] + ( $arr[1] * 3 ) ) % 10 ) % 10;
  }

  public function generatePNG($str,$fontSize=45){
		$box = ImageTTFbbox($fontSize, 0, 'font/EAN13.ttf', $str);
		$img = imagecreatetruecolor(($box[2]+11), (abs($box[7]-$box[1])+6));
		header('Content-type: image/png');
		ImageFill($img, 0, 0, ImageColorAllocate($img, 255,255,255));
		ImageTTFText($img, $fontSize, 0, 0, abs($box[7]), ImageColorAllocate($img, 0,0,0), 'font/EAN13.ttf', $str);
    //imagefilter($img, IMG_FILTER_CONTRAST,-50);
		ImagePNG($img);
		ImageDestroy($img);
  }

	public function codestring() {
    $arr = array(
      1  => array(0=>65, 1=>65, 2=>65, 3=>65, 4=>65, 5=>65, 6=>65, 7=>65, 8=>65, 9=>65),
      2  => array(0=>65, 1=>65, 2=>65, 3=>65, 4=>75, 5=>75, 6=>75, 7=>75, 8=>75, 9=>75),
      3  => array(0=>65, 1=>75, 2=>75, 3=>75, 4=>65, 5=>75, 6=>75, 7=>65, 8=>65, 9=>75),
      4  => array(0=>65, 1=>75, 2=>75, 3=>75, 4=>65, 5=>65, 6=>75, 7=>75, 8=>75, 9=>65),
      5  => array(0=>65, 1=>75, 2=>65, 3=>75, 4=>75, 5=>65, 6=>65, 7=>65, 8=>75, 9=>75),
      6  => array(0=>65, 1=>75, 2=>75, 3=>65, 4=>75, 5=>75, 6=>65, 7=>75, 8=>65, 9=>65),
      7  => array(0=>97, 1=>97, 2=>97, 3=>97, 4=>97, 5=>97, 6=>97, 7=>97, 8=>97, 9=>97),
      8  => array(0=>97, 1=>97, 2=>97, 3=>97, 4=>97, 5=>97, 6=>97, 7=>97, 8=>97, 9=>97),
      9  => array(0=>97, 1=>97, 2=>97, 3=>97, 4=>97, 5=>97, 6=>97, 7=>97, 8=>97, 9=>97),
      10 => array(0=>97, 1=>97, 2=>97, 3=>97, 4=>97, 5=>97, 6=>97, 7=>97, 8=>97, 9=>97),
      11 => array(0=>97, 1=>97, 2=>97, 3=>97, 4=>97, 5=>97, 6=>97, 7=>97, 8=>97, 9=>97),
      12 => array(0=>97, 1=>97, 2=>97, 3=>97, 4=>97, 5=>97, 6=>97, 7=>97, 8=>97, 9=>97)
    );
    $str = $this->barcode[0];
    for($i=1;$i<13;$i++){
      $str .= chr($arr[$i][$this->barcode[0]] + $this->barcode[$i]);
      if($i==6) $str.="*";
      if($i==12) $str.="+";
    }
		return $str;
	}
  
}
?>