<?php
if (!defined('MODX_BASE_PATH')) {
    die('HACK???');
}

/**
 * Prepare extender for DocLister
 *
 * @category extender
 * @license GNU General Public License (GPL), http://www.gnu.org/copyleft/gpl.html
 * @author Agel_Nash <Agel_Nash@xaker.ru>
 */

class prepare_DL_Extender extends extDocLister
{
    private $_store = array();

    public function setStore($name,$val){
        $this->_store[$name] = $val;
    }

    public function getStore($name){
        return APIHelpers::getkey($this->_store, $name);
    }

    protected function run()
    {
        $out = $this->getCFGDef('data', array());
        $nameParam = $this->getCFGDef('nameParam', 'prepare');
        $ret = $this->getCFGDef('return', null);
        if (($prepare = $this->DocLister->getCFGDef($nameParam, '')) != '') {
            $params = $this->getParams($out);
            if(is_scalar($prepare)){
                $names = explode(",", $prepare);
                foreach($names as $item){
                    $params['data'] = $this->callPrepare($item, $params, $ret);
                    if($params['data'] === false){
                        break;
                    }
                }
            }else{
                $params['data'] = $this->callPrepare($prepare, $params, $ret);
            }
            $out = $params['data'];
        }
        return (!empty($ret) && is_scalar($ret) && isset($out[$ret])) ? $out[$ret] : $out;
    }

    public function getParams(array $data = array()){
        return array(
            '_extDocLister' => $this,
            '_DocLister' => $this->DocLister,
            'data' => $data,
            'modx' => $this->modx
        );
    }

    public function callPrepare($name, array $params, $ret = null){
        $out = null;
        if((is_object($name) && ($name instanceof Closure)) || is_callable($name)){
            $data = call_user_func($name, $params['data'], $params['modx'], $params['_DocLister'], $params['_extDocLister']);
        }else{
            $data = $this->modx->runSnippet($name, $params);
        }
        switch(true){
            case is_array($data):{
                $out = $data;
                break;
            }
            case ($data==='' || (is_bool($data) && $data===false)):{
                $out = false;
                break;
            }
            case is_string($data):{
                if($data[0] == '[' || $data[0] == '{'){
                    $out = $this->DocLister->jsonDecode($data, array('assoc' => true), true);
                }else{
                    $out = unserialize($data);
                }
            }
        }
        return is_null($out) ? $params['data'] : $out;
    }
}