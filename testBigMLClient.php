<?php
include ("BigMLClient.php");

$client = new BigMLClient('vistik','6f49539e248cc22fb626bbb095065ef56e6d9913');

$file = "data/iris.csv";
$result = $client->create_source($file);

$resource = $result->resource;
echo $result->status->message;

sleep(1);

$result = $client->create_dataset($resource);
$resource = $result->resource;
echo $result->status->message;

sleep(1);

$result  = $client->create_model($resource);
$resource = $result->resource;
echo $result->status->message;

sleep(1);

$data = array(
    '000002' => 1.2
);
$result = $client->create_prediction($resource,$data);
$key = $result->objective_fields[0];
echo "Prediction:" . $result->prediction->$key;
?>
