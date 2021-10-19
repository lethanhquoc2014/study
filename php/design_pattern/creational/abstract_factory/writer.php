<?php
interface WriterFactory
{
    public function createCsvWriter(): CsvWriter;
    public function createJsonWriter(): JsonWriter;
}

class WinWriterFactory implements WriterFactory
{
    public function createCsvWriter(): CsvWriter
    {
        return new WinCsvWriter();
    }

    public function createJsonWriter(): JsonWriter
    {
        return new WinJsonWriter();
    }
}

class UnixWriterFactory implements WriterFactory
{
    public function createCsvWriter(): CsvWriter
    {
        return new UnixCsvWriter();
    }

    public function createJsonWriter(): JsonWriter
    {
        return new UnixJsonWriter();
    }
}

interface CsvWriter
{
    public function write(array $line): string;
}

class WinCsvWriter implements CsvWriter
{
    public function write(array $line): string
    {
        return join(',', $line) . "\r\n";
    }
}

class UnixCsvWriter implements CsvWriter
{
    public function write(array $line): string
    {
        return join(',', $line) . "\n";
    }
}

interface JsonWriter
{
    public function write(array $data, bool $formatted): string;
}

class WinJsonWriter implements JsonWriter
{
    public function write(array $data, bool $formatted): string
    {
        $options = 0;
        if ($formatted) {
            $options = JSON_PRETTY_PRINT;
        }

        return json_encode($data, $options);
    }
}

class UnixJsonWriter implements JsonWriter
{
    public function write(array $data, bool $formatted): string
    {
        $options = 0;
        if ($formatted) {
            $options = JSON_PRETTY_PRINT;
        }

        return json_encode($data, $options);
    }
}

function clientCode(WriterFactory $factory)
{
    $csv = $factory->createCsvWriter();
    $json = $factory->createJsonWriter();

    echo $csv->write([1,2,3,4,5,6], true);
    echo "\n";
    echo $json->write([1,2,3,4,5,6], true);
    echo "\n";
}

echo "Test WinWriterFactory\n";
clientCode(new WinWriterFactory());

echo "Test UnixWriterFactory\n";
clientCode(new UnixWriterFactory());