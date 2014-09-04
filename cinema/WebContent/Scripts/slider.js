$(function () {
    $('#carousel').infiniteCarousel({
    	imagePath: 'images/',
        displayProgressRing: false,
        showControls: false,
        autoPilot: true,
        displayTime: 3000,
        enableKeyboardNav: false,
        easeLeft: 'easeInQuint',
		easeRight:'easeInQuint'
    });
});


//easeLeft: 'easeOutBounce',
//easeRight:'easeOutBounce'
//easeOutQuint