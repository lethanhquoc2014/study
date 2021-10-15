<?php
interface FurnitureProduct
{
    public function style();
    public function price();
}

// chair
class VictorianChair implements FurnitureProduct
{
    public function style() { return 'This is a victorian chair'; }
    public function price() { return 100; }
}

class ModernChair implements FurnitureProduct
{
    public function style() { return 'This is a modern chair'; }
    public function price() { return 200; }
}

class ArtDecoChair implements FurnitureProduct
{
    public function style() { return 'This is a art deco chair'; }
    public function price() { return 300; }
}

// sofa
class VictorianSofa implements FurnitureProduct
{
    public function style() { return 'This is a victorian sofa'; }
    public function price() { return 400; }
}

class ModernSofa implements FurnitureProduct
{
    public function style() { return 'This is a modern sofa'; }
    public function price() { return 500; }
}

class ArtDecoSofa implements FurnitureProduct
{
    public function style() { return 'This is a art deco sofa'; }
    public function price() { return 600; }
}

// coffee table
class VictorianCoffeeTable implements FurnitureProduct
{
    public function style() { return 'This is a victorian coffee table'; }
    public function price() { return 700; }
}

class ModernCoffeeTable implements FurnitureProduct
{
    public function style() { return 'This is a modern coffee table'; }
    public function price() { return 800; }
}

class ArtDecoCoffeeTable implements FurnitureProduct
{
    public function style() { return 'This is a art deco coffee table'; }
    public function price() { return 900; }
}


interface FurnitureFactory
{
    public function createChair();
    public function createSofa();
    public function createCoffeeTable();
}

class VictorianFurnitureFactory implements FurnitureFactory
{
    public function createChair() { return new VictorianChair(); }
    public function createSofa() { return new VictorianSofa(); }
    public function createCoffeeTable() { return new VictorianCoffeeTable(); }
}

class ModernFurnitureFactory implements FurnitureFactory
{
    public function createChair() { return new ModernChair(); }
    public function createSofa() { return new ModernSofa(); }
    public function createCoffeeTable() { return new ModernCoffeeTable(); }
}

class ArtDecoFurnitureFactory implements FurnitureFactory
{
    public function createChair() { return new ArtDecoChair(); }
    public function createSofa() { return new ArtDecoSofa(); }
    public function createCoffeeTable() { return new ArtDecoCoffeeTable(); }
}

function clientCode(FurnitureFactory $factory)
{
    $chair = $factory->createChair();
    echo "1. Chair\n";
    echo "Style: {$chair->style()}\n";
    echo "Price: {$chair->price()}\n";
    
    $sofa = $factory->createSofa();
    echo "2. Sofa\n";
    echo "Style: {$sofa->style()}\n";
    echo "Price: {$sofa->price()}\n";

    $coffeeTable = $factory->createCoffeeTable();
    echo "3. Coffee Table\n";
    echo "Style: {$coffeeTable->style()}\n";
    echo "Price: {$coffeeTable->price()}\n";
}

echo "List victorian products:\n";
clientCode(new VictorianFurnitureFactory());
echo "\n";

echo "List modern products:\n";
clientCode(new ModernFurnitureFactory());
echo "\n";

echo "List art deco products:\n";
clientCode(new ArtDecoFurnitureFactory());
echo "\n";