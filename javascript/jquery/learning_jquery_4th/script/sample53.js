(function($) {
    $.fn.column = function() {
        var $cells = $();
        this.each(function() {
            var $td = $(this).closest('td, th');
            if ($td.length) {
                var colNum = $td[0].cellIndex + 1;
                var $columnCells = $td
                    .closest('table')
                    .find('td, th')
                    .filter(':nth-child(' + colNum + ')');
                $cells = $cells.add($columnCells);
            }
        });
        console.log($cells);
        return this.pushStack($cells);
    }
})(jQuery);