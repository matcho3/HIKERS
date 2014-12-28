var cbpAnimatedHeader = (function() {

    var docElem = document.documentElement,
        header = document.querySelector( '.transparent-nav' ),
        didScroll = false,
        changeHeaderOn = 150;

    function init() {
        window.addEventListener( 'scroll', function( event ) {
            if( !didScroll ) {
                didScroll = true;
                setTimeout( scrollPage, 250 );
            }
        }, false );
    }

    function scrollPage() {
        var sy = scrollY();
        if ( sy >= changeHeaderOn ) {
            classie.add( header, 'navbar-scroll' );
        }
        else {
            classie.remove( header, 'navbar-scroll' );
        }
        didScroll = false;
    }

    function scrollY() {
        return window.pageYOffset || docElem.scrollTop;
    }

    init();

})();

