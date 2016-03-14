<?php
if(!class_exists('DocumentParser')) die('Class DocumentParser required');
class DocumentParserEx extends DocumentParser{

    /**
     * @var DBAPI $db
     */
    var $db;


    /**
     * @param array $doc
     * @return array
     */
    public function addResourse(array $doc)
    {

        $table = array(
            'sc' => $this->getFullTableName('site_content'),
            'tv' => $this->getFullTableName('site_tmplvar_contentvalues'),
        );
        $colums = array(
            'sc' => array_keys($this->db->getTableMetaData($table['sc'])),
            'tv' => array_keys($this->db->getTableMetaData($table['tv']))
        );

        $doc['editedon'] = time();

        $fields = array_intersect_key($doc, array_flip($colums['sc'])); // Отсекаем ненужные ключи

        // Если известен ID документа, он есть в базе и есть поля для изменения:
        if(isset($doc['id']) && $this->db->getValue($this->db->select("COUNT(`id`)", $table['sc'], "`id` = " . (int)$doc['id'])) && count($fields)>0){
            $this->db->update($fields, $table['sc'], "`id` = " . (int)$doc['id']); // Апдейтим документ
        }elseif(isset($doc['pagetitle'])){

            $fields['createdon'] = $fields['publishedon'] = $fields['editedon']; // Создавая документ все значения одинаковые (editedon уже задан выше, => приравниваем к нему)
            if(!isset($doc['alias'])){
                $doc['alias'] = $this->invokeEvent("OnStripAlias",['alias' => $doc['pagetitle']])[0];
            }

            // Добавляем документ только если в этой категории еще нет документа с таким же alias.
            if(($doc['id'] = $this->db->getValue($this->db->select("`id`", $table['sc'], "`parent`='". (int)$doc['parent'] . "' AND alias='" . $doc['alias'] . "'")))==false){
                $this->db->update("isfolder=1", $table['sc'], "id = " . (int)$doc['parent']); //Делаем папку из родителя
                $doc['id'] = $this->db->insert($fields, $table['sc']); // Добавляем документ
            }
        }
        if(isset($doc['tv']) && is_array($doc['tv'])){
            foreach($doc['tv'] as $tv){
                if(isset($doc['id'])) $tv['contentid'] = $doc['id'];
                $tv = array_intersect_key($tv, array_flip($colums['tv'])); // Отсекаем ненужные ключи
                if(count($tv)==3){
                    if(($tvid = $this->db->getValue($this->db->select("`id`", $table['tv'], "contentid='".$tv['contentid'] . "' AND tmplvarid='" . $tv['tmplvarid'] . "'")))==false){
                        $this->db->insert($tv, $table['tv']);
                    }else{
                        $this->db->update($tv, $table['tv'], '`id` = "'.$tvid.'"' );
                    }
                }
            }
        }
        return $doc;
    }
    function setPlaceholders($str,$ph,$b="[++]"){
        preg_match_all("~\[\+(\w+\:+\w+.*)\+\]~sU",$str,$matches);
        foreach($matches[1] as $match){
            $match_arr = explode(":",$match);
            $func = array_shift($match_arr);
            $match_arr[0] = $this->setPlaceholders("[+".$match_arr[0]."+]", $ph);
            $match_arr[0] = preg_replace('~\[[\+\(](.*?)[\)\+]\]~', "", $match_arr[0]); // Удаляем неиспользуемые плейсхолдеры
            if(function_exists($func) && count($match_arr)>0 && !empty($match_arr[0])){
                $ph[$match] = call_user_func_array($func,$match_arr);
            }
        }
        $b = str_split($b,strlen($b)/2);
        while(!isset($replaced) || $replaced>0){
            $str = str_replace(
                array_map(function($v) use($b){return $b[0] . strval($v) . $b[1];},array_keys($ph)),
                array_map(function($v){if(!is_array($v)) return $v;},$ph),
                $str,
                $replaced
            );
        }
        return $str;
    }
}  
?>