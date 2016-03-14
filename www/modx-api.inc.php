<?php
if(!defined("MODX_BASE_PATH")) exit;
define('MODX_MANAGER_PATH', MODX_BASE_PATH . "manager/");
require_once MODX_MANAGER_PATH . 'includes/protect.inc.php';
$_SERVER_SCRIPT_NAME = $_SERVER['SCRIPT_NAME']; $_SERVER['SCRIPT_NAME']="/index.php";
require_once MODX_MANAGER_PATH . 'includes/config.inc.php';
$_SERVER['SCRIPT_NAME'] = $_SERVER_SCRIPT_NAME;
if(empty($_REQUEST['lightmode'])){
    require_once MODX_MANAGER_PATH . 'includes/document.parser.class.inc.php';
    if(file_exists(MODX_MANAGER_PATH . 'includes/document.parser.extender.class.inc.php')){
      require_once MODX_MANAGER_PATH . 'includes/document.parser.extender.class.inc.php';
      $modx = new DocumentParserEx;
    }else{
      $modx = new DocumentParser;
    }
    set_error_handler(array(&$modx, "phpError"), E_ALL);
    $modx->db->connect();
    if(empty($modx->config)){
        $modx->getSettings();
    }
}

?>