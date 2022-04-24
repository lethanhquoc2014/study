$(document).ready(function() {
    function stripe() {
        $('#news').find('tr.alt').removeClass('alt');
        $('#news tbody').each(function() {
            $(this).children(':visible').has('td')
                .filter(function(index) {
                    return (index % 4) < 3;
                }).addClass('alt');
        });
    }

    stripe();

    $('#topics a').click(function(event) {
        event.preventDefault();

        var topic = $(this).text();
        $('#topics a.selected').removeClass('selected');
        $(this).addClass('selected');
        $('#news').find('tr').show();
        if (topic != 'All') {
            $('#news').find('tr:has(td)').not(function() {
                return $(this).children(':nth-child(4)').text() == topic;
            }).hide();
        }
        stripe();
    });
});
