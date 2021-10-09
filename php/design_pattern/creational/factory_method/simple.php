<?php
interface Product 
{
    public function operation();
}

class ConcreteProduct1 implements Product
{
    public function operation()
    {
        return "{Result of the ConcreteProduct1}";
    }
}

class ConcreteProduct2 implements Product
{
    public function operation()
    {
        return "{Result of the ConcreteProduct2}";
    }
}

abstract class Creator
{
    abstract public function factoryMethod();

    public function someOperation()
    {
        $product = $this->factoryMethod();
        $result = "Creator: The same creator's code has just worked with " . $product->operation();

        return $result;
    }
}

class ConcreteCreator1 extends Creator
{
    public function factoryMethod()
    {
        return new ConcreteProduct1();
    }
}

class ConcreteCreator2 extends Creator
{
    public function factoryMethod()
    {
        return new ConcreteProduct2();
    }
}

function main(Creator $creator)
{
    echo "Client: I'm not aware of the creator's class, but it still works.\n" . $creator->someOperation();
}

echo "App: Launched with the ConcreteCreator1.\n";
main(new ConcreteCreator1());
echo "\n\n";

echo "App: Launched with the ConcreteCreator2.\n";
main(new ConcreteCreator2());
echo "\n\n";