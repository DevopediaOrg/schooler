/* Copyright (C) YOOtheme GmbH, http://www.gnu.org/licenses/gpl.html GNU/GPL */

(function($){var error;$.each(files,function(i,file){if(error)return;var tag=$("head [data-file='"+file.target+"']");if(tag.length){$.less.getCSS(file.source,{compress:true}).done(function(css){if($("html").attr("dir")=="rtl"){css=$.rtl.convert2RTL(css)}tag.html(css)}).fail(function(e){error=true})}})})(jQuery);