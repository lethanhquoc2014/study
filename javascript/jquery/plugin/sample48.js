(function($) {
    $.fn.swapClass = function(class1, class2) {
        if (this.hasClass(class1)) {
            this.removeClass(class1).addClass(class2);
        } else if (this.hasClass(class2)) {
            this.removeClass(class2).addClass(class1);
        }
    };
})(jQuery)