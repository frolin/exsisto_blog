$(document).ready(function() {
    $('.menu-tags a').each(function(i) {
        var position = $(this).position();
        console.log(position);
        console.log('min: ' + position.top + ' / max: ' + parseInt(position.top + $(this).height()));
        $(this).scrollspy({
            min: position.top,
            max: position.top + $(this).height(),
            onEnter: function(element, position) {
                if(console) console.log('entering ' +  element.id);
                $("body").css('background-color', element.id);
            },
            onLeave: function(element, position) {
                if(console) console.log('leaving ' +  element.id);
                	$('body').css('background-color','#eee');
            }
        });
    });
});