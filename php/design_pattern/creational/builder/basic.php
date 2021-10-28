<?php
interface IBuilder
{
    public function createProductPartA(): void;
    public function createProductPartB(): void;
    public function createProductPartC(): void;
    public function getProduct(): Product;
    public function reset(): void;
}

class ConcreteBuilder implements IBuilder
{
    private $product;

    public function __construct()
    {
        $this->reset();
    }

    public function createProductPartA(): void
    {
        $this->product->addPart('PartA');
    }

    public function createProductPartB(): void
    {
        $this->product->addPart('PartB');
    }

    public function createProductPartC(): void
    {
        $this->product->addPart('PartC');
    }

    public function getProduct(): Product
    {
        $result = $this->product;
        $this->reset();
        
        return $result;
    }

    public function reset(): void
    {
        $this->product = new Product();
    }
}

class Product
{
    private $parts = [];

    public function addPart(string $part): void
    {
        $this->parts[] = $part;
    }

    public function getParts(): array
    {
        return $this->parts;
    }
}

class Director
{
    private $builder;

    public function setBuilder(IBuilder $builder)
    {
        $this->builder = $builder;
    }

    public function buildMinimumPart(): void
    {
        $this->builder->createProductPartA();
    }

    public function buildFullPart(): void
    {
        $this->builder->createProductPartA();
        $this->builder->createProductPartB();
        $this->builder->createProductPartC();
    }
}

function clien_code(Director $director)
{
    $concrete = new ConcreteBuilder();
    $director->setBuilder($concrete);

    echo "Build minimum parts: ";
    $director->buildMinimumPart();
    echo implode(",", $concrete->getProduct()->getParts());
    echo "\n";

    echo "Build full parts: ";
    $director->buildFullPart();
    echo implode(",", $concrete->getProduct()->getParts());
    echo "\n";

    echo "Build custom parts: ";
    $concrete->createProductPartA();
    $concrete->createProductPartC();
    echo implode(",", $concrete->getProduct()->getParts());
    echo "\n";
}

clien_code(new Director());
