<?php

include 'classes/connection.php' ;
include 'classes/User.php' ;
include 'classes/Follow.php' ;
include 'classes/Tweet.php' ;

session_start();
 
global $pdo;

define("BASE_URL" , "http://localhost/twitter/");
