(function($) {
    $.fn.shadow = function(opts) {
        var defaults = {
            copies: 5,
            opacity: 0.5,
            copyOffset: function(index) {
                return {x: index, y: index};
            }
        };
        var options = $.extend(defaults, opts);

        return this.each(function() {
            var $originalElement = $(this);
            for (var i = 0; i < options.copies; i++) {
                var offset = options.copyOffset(i);
                $originalElement
                    .clone()
                    .css({
                        position: 'absolute',
                        left: $originalElement.offset().left + offset.x,
                        top: $originalElement.offset().top + offset.y,
                        margin: 0,
                        zIndex: -1,
                        opacity: options.opacity
                    })
                    .appendTo('body')
            }
        });
    };

    $.fn.swapClass = function(class1, class2) {
        this.each(function() {
            var $element = $(this);
            if ($element.hasClass(class1)) {
                $element.removeClass(class1).addClass(class2);
            } else if ($element.hasClass(class2)) {
                $element.removeClass(class2).addClass(class1);
            }
        });
    };

    $.mathUtils = {
        sum: function(array) {
            var total = 0;
            if (!$.isArray(array)) {
                return total;
            }
            $.each(array, function(index, value) {
                value = $.trim(value);
                value = parseFloat(value) || 0;
                total += value;
            });
            return total;
        },
        average: function(array) {
            if ($.isArray(array)) {
                return $.mathUtils.sum(array) / array.length;
            }
            return 0;
        },
    };
})(jQuery);