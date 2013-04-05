 // reference link 
 // http://www.west-wind.com/weblog/posts/2011/Apr/22/Restricting-Input-in-HTML-Textboxes-to-Numeric-Values
 
 var decSeparator =".";
 
(function(jQuery) {
    function internalCheck(code, ch, key, v) {
        if (key==code)
            if (ch==decSeparator) {
                    if (v.indexOf(decSeparator)!=-1) 
                        return false;
            } else {
                return false;
            }
        return true;
    }

    jQuery.fn.forceNumeric = function (options) {
        var opts = jQuery.extend({}, jQuery.fn.forceNumeric.defaults, options);

        return this.each(function () {
            var o = jQuery.meta ? jQuery.extend({}, opts, $this.data()) : opts;
            
            jQuery.fn.forceNumeric.defaults = {
//                fixDecimals : -1
                fixDecimals : 3
            };
            
            $(this).keydown(function (e) {
                var key = e.which || e.keyCode;

                if (!e.shiftKey && !e.altKey && !e.ctrlKey &&
                // numbers   
                    key >= 48 && key <= 57 ||
                // Numeric keypad
                    key >= 96 && key <= 105 ||
                // comma, period and minus, . on keypad      '
                   key == 190 || key == 188 || key == 109 || key == 110 || key == 222 ||
                // Backspace and Tab and Enter
                   key == 8 || key == 9 || key == 13 ||
                // Home and End
                   key == 35 || key == 36 ||
                // left and right arrows
                   key == 37 || key == 39 ||
                // Del and Ins
                   key == 46 || key == 45) {
                    var v=$(this).val();

                    var tmp =internalCheck(190,".",key,v);
                    if (!tmp) return false;

                    var tmp =internalCheck(188,",",key,v);
                    if (!tmp) return false;

                    return true;
                } else if (e.ctrlKey){
                    //ctrl-c       ctrl-v       ctrl-x
                    if (key==67 || key==86  || key==90)
                        return true;
                }
                return false;
            });

            $(this).blur(function (e) {
                var v = jQuery.trim($(this).val());
                if (v == '') { return; }

//                    if(o.fixDecimals != -1) {
//                        var num = parseFloat(v);
//                        var numSix =  num.toFixed(o.fixDecimals);
//                        $(this).val(numSix);
//                    }

            });

        }); 
        
//        jQuery.fn.forceNumeric.defaults = {
//            fixDecimals : -1
//        };


    };
})(jQuery);