/*
	classie javascript
*/
        ( function( window ) {

        'use strict';

        function classReg( className ) {
          return new RegExp("(^|\\s+)" + className + "(\\s+|$)");
        }

        var hasClass, addClass, removeClass;

        if ( 'classList' in document.documentElement ) {
          hasClass = function( elem, c ) {
            return elem.classList.contains( c );
          };
          addClass = function( elem, c ) {
            elem.classList.add( c );
          };
          removeClass = function( elem, c ) {
            elem.classList.remove( c );
          };
        }
        else {
          hasClass = function( elem, c ) {
            return classReg( c ).test( elem.className );
          };
          addClass = function( elem, c ) {
            if ( !hasClass( elem, c ) ) {
              elem.className = elem.className + ' ' + c;
            }
          };
          removeClass = function( elem, c ) {
            elem.className = elem.className.replace( classReg( c ), ' ' );
          };
        }

        function toggleClass( elem, c ) {
          var fn = hasClass( elem, c ) ? removeClass : addClass;
          fn( elem, c );
        }

        var classie = {
          hasClass: hasClass,
          addClass: addClass,
          removeClass: removeClass,
          toggleClass: toggleClass,
          has: hasClass,
          add: addClass,
          remove: removeClass,
          toggle: toggleClass
        };

        // transport
        if ( typeof define === 'function' && define.amd ) {
          // AMD
          define( classie );
        } else {
          // browser global
          window.classie = classie;
        }

        })( window );
/*
	Function put smaller to the header
*/
        function init() {
            window.addEventListener('scroll', function(e){
                var element = document.getElementsByClassName("menu")[0];
                var distanceY = window.pageYOffset || document.documentElement.scrollTop,shrinkOn = 150,header = document.querySelector("header");
                var headerShrinkCheck =150;
                if (distanceY > shrinkOn) {
                    if (!classie.has(header,"smaller")) {
                        classie.add(header,"smaller");
                        if(element.style.width == '14em')
                        {
                            element.style["width"] = "0em";
                        }
                    }
                } else {
                    if (classie.has(header,"smaller")) {
                        classie.remove(header,"smaller");
                        if(element.style.width == '0em')
                        {
                            element.style["width"] = "14em";
                        }
                    }
                }
            });
        }
        window.onload = init();
/*
	Function menu click button
*/
	function menu_onclick() {
            var element = document.getElementsByClassName("menu")[0];
            if(element.style.width == '14em')
            {
                element.style["width"] = "0em";
            }else {
                element.style["width"] = "14em";
            }
        }
