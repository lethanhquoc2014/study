<?php
abstract class ConnectionDB
{
    abstract function getConnection();
}

class MysqlConnection extends ConnectionDB
{
    private $host;
    private $database;
    private $username;
    private $password;
    private $port;

    public function __construct($host, $database, $username, $password, $port)
    {
        $this->host = $host;
        $this->database = $database;
        $this->username = $username;
        $this->password = $password;
        $this->port = $port;
    }

    public function getConnection()
    {
        return new MysqlConfig($this->host, $this->database, $this->username, $this->password, $this->port);
    }
}

class RedisConnection extends ConnectionDB
{
    private $host;
    private $database;
    private $username;
    private $password;
    private $port;

    public function __construct($host, $database, $username, $password, $port)
    {
        $this->host = $host;
        $this->database = $database;
        $this->username = $username;
        $this->password = $password;
        $this->port = $port;
    }

    public function getConnection()
    {
        return new RedisConfig($this->host, $this->database, $this->username, $this->password, $this->port);
    }
}

interface ConfigDB
{
    public function getConfig();
}

class MysqlConfig implements ConfigDB
{
    private $host;
    private $database;
    private $username;
    private $password;
    private $port;

    public function __construct($host, $database, $username, $password, $port)
    {
        $this->host = $host;
        $this->database = $database;
        $this->username = $username;
        $this->password = $password;
        $this->port = $port;
    }

    public function getConfig()
    {
        echo "==Mysql config==\n";
        echo "host: {$this->host}\n";
        echo "database: {$this->database}\n";
        echo "username: {$this->username}\n";
        echo "password: {$this->password}\n";
        echo "port: {$this->port}\n";
    }
}

class RedisConfig implements ConfigDB
{
    private $host;
    private $database;
    private $username;
    private $password;
    private $port;

    public function __construct($host, $database, $username, $password, $port)
    {
        $this->host = $host;
        $this->database = $database;
        $this->username = $username;
        $this->password = $password;
        $this->port = $port;
    }

    public function getConfig()
    {
        echo "==Redis config==\n";
        echo "host: {$this->host}\n";
        echo "database: {$this->database}\n";
        echo "username: {$this->username}\n";
        echo "password: {$this->password}\n";
        echo "port: {$this->port}\n";
    }
}

function testConnectionDB($type)
{
    $connection = null;
    if ($type == 'mysql') {
        $mysql = new MysqlConnection('127.0.0.1', 'test', 'root', 'root', '3306');
        $connection = $mysql->getConnection();
    } elseif ($type == 'redis') {
        $redis = new RedisConnection('127.0.0.1', 'testdb', 'admin', '123456', '8888');
        $connection = $redis->getConnection();
    }
    $connection->getConfig();
}

testConnectionDB('mysql');
testConnectionDB('redis');
