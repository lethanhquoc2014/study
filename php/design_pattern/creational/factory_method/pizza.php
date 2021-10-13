<?php
abstract class BasePizzaFactory
{
    public abstract function createPizza($type);
}

class PizzaFactory extends BasePizzaFactory
{
    public function createPizza($type)
    {
        $pizza = null;
        switch(strtolower($type)) {
            case "cheese":
                $pizza = new CheesePizza();
                break;
            case "pepperoni":
                $pizza = new PepperoniPizza();
                break;
            case "veggie":
                $pizza = new VeggiePizza();
                break;
            default:
                break;
        }
        $pizza->addIngredients();
        $pizza->bakePizza();
        return $pizza;
    }
}

abstract class Pizza
{
    abstract public function addIngredients();

    public function bakePizza()
    {
        echo "Pizza baked at 400 for 20 minutes.\n";
    }
}

class CheesePizza extends Pizza
{
    public function addIngredients()
    {
        echo "Preparing ingredients for cheese pizza.\n";
    }
}

class PepperoniPizza extends Pizza
{
    public function addIngredients()
    {
        echo "Preparing ingredients for pepperoni pizza.\n";
    }
}

class VeggiePizza extends Pizza
{
    public function addIngredients()
    {
        echo "Preparing ingredients for veggie pizza.\n";
    }
}


$pizzaFactory = new PizzaFactory();
$cheesePizza = $pizzaFactory->createPizza('cheese');
$pepperoniPizza = $pizzaFactory->createPizza('pepperoni');
$veggiePizza = $pizzaFactory->createPizza('veggie');