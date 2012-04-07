<?php

/**
 * Description of BigMLClient
 *
 * @author visti
 */
class BigMLClient {

    private $username;
    private $apikey;
    private $baseURL = "https://bigml.io/";
    private $version = "andromeda/";

    public function __construct($username, $apikey) {
        $this->username = $username;
        $this->apikey = $apikey;
        $this->cmd = $this->baseURL . $this->version . ' ' . $this->username . ' ' . $this->apikey . ' ';
    }

    public function create_prediction($model_id, Array $data) {
        $data = json_encode($data);
        $cmd = "bash/create_prediction.sh " . $this->cmd . "$model_id '$data'";
        exec($cmd, $result);
        $result = $this->parse($result);
        if ($result->status->code != 5){
            throw new Exception($result->status->message);
        }
        return $result;
    }
    
    public function create_model($dataset_id){
        $cmd = "bash/create_model.sh " . $this->cmd . "$dataset_id";
        exec($cmd, $result);
        $result = $this->parse($result);
        return $result;
    }
    
    public function create_source($file){
        $cmd = "bash/create_source.sh " . $this->cmd . "$file";
        exec($cmd, $result);
        $result = $this->parse($result);
        return $result;
    }
    
    public function create_dataset($source_id){
        $cmd = "bash/create_dataset.sh " . $this->cmd . "$source_id";
        exec($cmd, $result);
        $result = $this->parse($result);
        return $result;
    }
    
    private function parse($result){
        $result = implode('', $result);
        $result = json_decode($result);
        return $result;
    }

}

?>
