<?php
abstract class SocialNetworkPoster 
{
    abstract public function getSocialNetWork(): SocialNetworkConnector;

    public function post($content): void
    {
        $network = $this->getSocialNetWork();
        $network->login();
        $network->createPost($content);
        $network->logout();
    }
}

class FacebookPoster extends SocialNetworkPoster
{
    private $login, $password;

    public function __construct(string $login, string $password)
    {
        $this->login = $login;
        $this->password = $password;
    }

    public function getSocialNetWork(): SocialNetworkConnector
    {
        return new FacebookConnector($this->login, $this->password);
    }
}

class LinkedInPoster extends SocialNetworkPoster
{
    private $email, $password;

    public function __construct(string $email, string $password)
    {
        $this->email = $email;
        $this->password = $password;
    }

    public function getSocialNetwork(): SocialNetworkConnector
    {
        return new LinkedInConnector($this->email, $this->password);
    }
}

interface SocialNetWorkConnector
{
    public function login(): void;
    public function createPost($content): void;
    public function logout(): void;
}

class FacebookConnector implements SocialNetWorkConnector
{
    private $login, $password;

    public function __construct($login, $password)
    {
        $this->login = $login;
        $this->password = $password;
    }

    public function login(): void
    {
        echo "Send HTTP API request to log in user $this->login with " .
            "password $this->password\n";
    }

    public function createPost($content): void
    {
        echo "Send HTTP API requests to create a post in Facebook timeline.\n";
    }

    public function logout(): void
    {
        echo "Send HTTP API request to log out user $this->login\n";
    }
}

class LinkedInConnector implements SocialNetworkConnector
{
    private $email, $password;

    public function __construct(string $email, string $password)
    {
        $this->email = $email;
        $this->password = $password;
    }

    public function logIn(): void
    {
        echo "Send HTTP API request to log in user $this->email with " .
            "password $this->password\n";
    }

    public function logOut(): void
    {
        echo "Send HTTP API request to log out user $this->email\n";
    }

    public function createPost($content): void
    {
        echo "Send HTTP API requests to create a post in LinkedIn timeline.\n";
    }
}

function clientCode(SocialNetworkPoster $creator)
{
    $creator->post("Hello world!");
    $creator->post("I had a large hamburger this morning!");
}

echo "Testing ConcreteCreator1:\n";
clientCode(new FacebookPoster("john_smith", "******"));
echo "\n\n";

echo "Testing ConcreteCreator2:\n";
clientCode(new LinkedInPoster('john_smith@gmail.com', '******'));
echo "\n\n";